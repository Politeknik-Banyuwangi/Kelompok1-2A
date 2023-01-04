// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pbl_kasir/utils/auth.dart';
import 'package:pbl_kasir/utils/base_url.dart';
import 'package:http/http.dart' as http;
import 'package:pbl_kasir/widgets/stok/stok.dart';

class UpdateBarang extends StatefulWidget {
  String barangId;
  String kategoriId;
  String supplierId;
  String namaBarang;
  String hargaJual;
  String hargaBeli;
  String stok;
  UpdateBarang({
    super.key,
    required this.barangId,
    required this.kategoriId,
    required this.supplierId,
    required this.namaBarang,
    required this.hargaJual,
    required this.hargaBeli,
    required this.stok,
  });

  @override
  State<UpdateBarang> createState() => UpdategState();
}

class UpdategState extends State<UpdateBarang> {
  final _formKeyBarang = GlobalKey<FormState>();
  TextEditingController namaBarang = TextEditingController();
  TextEditingController hargaBeli = TextEditingController();
  TextEditingController hargaJual = TextEditingController();
  bool isLoading = false;
  List<dynamic> listKategori = [];
  List<dynamic> listSupplier = [];
  Future<void> getData() async {
    Uri urlKategori = Uri.parse(BaseUrl.url + '/kategori');
    Uri urlSupplier = Uri.parse(BaseUrl.url + '/supplier');
    try {
      var responseKategori = await http.get(urlKategori,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': Auth.token
          });
      var responseSupplier = await http.get(urlSupplier,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': Auth.token
          });
      setState(() {
        listKategori = jsonDecode(responseKategori.body)['data'];
        // selectedValue = listKategori[0]['kategori_id'].toString();
        listSupplier = jsonDecode(responseSupplier.body)['data'];
        // supplierId = listSupplier[0]['supplier_id'].toString();
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateBarang() async {
    try {
      Uri url = Uri.parse('${BaseUrl.url}/updateBarang/${widget.barangId}');
      var response = await http.put(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': Auth.token
        },
        body: jsonEncode(
          <String, String>{
            'kategori_id': widget.kategoriId,
            'supplier_id': widget.supplierId,
            'nama': namaBarang.text,
            'harga_beli': hargaBeli.text,
            'harga_jual': hargaJual.text,
          },
        ),
      );
      print(response.body);
      setState(() {
        isLoading = false;
      });
      Navigator.pop(context);
    } catch (e) {
      throw new FormatException(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
    namaBarang.text = widget.namaBarang;
    hargaBeli.text = widget.hargaBeli;
    hargaJual.text = widget.hargaJual;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ubah Barang"),
        centerTitle: true,
      ),
      body: isLoading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Form(
                      key: _formKeyBarang,
                      child: ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Masukkan Kategori Barang',
                              ),
                              key: UniqueKey(),
                              hint: Text("Pilih Kategori"),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Tidak Boleh Kosong';
                                }
                                return null;
                              },
                              value: widget.kategoriId,
                              onChanged: (String? newValue) {
                                setState(() {
                                  widget.kategoriId = newValue!;
                                });
                              },
                              items: listKategori.map((item) {
                                return DropdownMenuItem(
                                  value: item['kategori_id'].toString(),
                                  child: Text(item['nama'].toString()),
                                );
                              }).toList(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Masukkan Supplier Barang',
                              ),
                              key: UniqueKey(),
                              hint: Text("Pilih Supplier"),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Tidak Boleh Kosong';
                                }
                                return null;
                              },
                              value: widget.supplierId,
                              onChanged: (String? newValue) {
                                setState(() {
                                  widget.supplierId = newValue!;
                                });
                              },
                              items: listSupplier.map((item) {
                                return DropdownMenuItem(
                                  value: item['supplier_id'].toString(),
                                  child: Text(item['nama_supplier'].toString()),
                                );
                              }).toList(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Masukkan Nama Barang',
                              ),
                              controller: namaBarang,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Tidak Boleh Kosong';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Masukkan Harga Beli',
                              ),
                              keyboardType: TextInputType.number,
                              controller: hargaBeli,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Tidak Boleh Kosong';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Masukkan Harga Jual',
                              ),
                              keyboardType: TextInputType.number,
                              controller: hargaJual,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Tidak Boleh Kosong';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKeyBarang.currentState!.validate()) {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  updateBarang();
                                }
                              },
                              child: const Text('Update Barang'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
    );
  }
}
