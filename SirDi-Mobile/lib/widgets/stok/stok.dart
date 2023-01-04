// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pbl_kasir/utils/rupiah.dart';
import 'package:pbl_kasir/widgets/stok/tambah_barang.dart';
import 'package:pbl_kasir/models/response.dart';
import 'package:pbl_kasir/utils/auth.dart';
import 'package:pbl_kasir/utils/base_url.dart';
import 'package:http/http.dart' as http;
import 'package:pbl_kasir/widgets/stok/tambah_stok.dart';
import 'package:pbl_kasir/widgets/stok/update_barang.dart';

class StokPage extends StatefulWidget {
  const StokPage({super.key});

  @override
  State<StokPage> createState() => _StokPageState();
}

class _StokPageState extends State<StokPage> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  List<dynamic> listKategori = [];
  String selectedkategori = "";
  bool isKategori = false;
  var client = http.Client();

  TextEditingController cariController = TextEditingController();
  Future<Response> getData() async {
    try {
      String queryParam = "";
      if (cariController.text.isNotEmpty) {
        queryParam += "?nama=${cariController.text}";
      }
      if (isKategori) {
        if (cariController.text.isEmpty) {
          queryParam += "?kategori=$selectedkategori";
        } else {
          queryParam += "&kategori=$selectedkategori";
        }
      }
      Uri url = Uri.parse('${BaseUrl.url}/barang$queryParam');
      var response = await client.get(url, headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': Auth.token
      });
      return Response.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw new FormatException(e.toString());
    }
  }

  Future<void> hapus(String id) async {
    Uri url = Uri.parse('${BaseUrl.url}/hapusBarang/$id');
    try {
      var response = await client.delete(url, headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': Auth.token
      });
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      throw new FormatException(e.toString());
    }
  }

  Future<void> getKategori() async {
    Uri urlKategori = Uri.parse('${BaseUrl.url}/kategori');
    try {
      var responseKategori = await client.get(urlKategori,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': Auth.token
          });
      setState(() {
        listKategori = jsonDecode(responseKategori.body)['data'];
        selectedkategori = listKategori[0]['nama'].toString();
      });
    } catch (e) {
      throw FormatException(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    getKategori();
  }

  @override
  void dispose() {
    super.dispose();
    cariController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Barang"),
        centerTitle: true,
        elevation: 0,
      ),
      floatingActionButton: Auth.isAdmin != true
          ? Container()
          : FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                    child: const TambahBarang(),
                    type: PageTransitionType.leftToRight,
                  ),
                ).then((value) => setState(() {}));
              },
              child: Icon(Icons.add),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: isLoading != false
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Form(
                      key: _formKey,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: cariController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Masukkan Nama Barang',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Tidak Boleh Kosong';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {});
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                isKategori == false
                    ? TextButton(
                        onPressed: () {
                          setState(() {
                            isKategori = true;
                          });
                        },
                        child: Text("Tampilkan Kategori"))
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 10),
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
                                  value: selectedkategori,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedkategori = newValue!;
                                    });
                                  },
                                  items: listKategori.map((item) {
                                    return DropdownMenuItem(
                                      value: item['nama'].toString(),
                                      child: Text(item['nama'].toString()),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    isKategori = false;
                                  });
                                },
                                child: Text("Batal"))
                          ],
                        ),
                      ),
                cariController.text.isNotEmpty
                    ? ElevatedButton(
                        onPressed: () {
                          setState(() {
                            cariController.text = "";
                            isKategori = false;
                          });
                        },
                        child: Text("Reset"))
                    : Container(),
                FutureBuilder<Response>(
                  future: getData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Expanded(
                        child: ListView.builder(
                          itemCount: snapshot.data!.data.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(10),
                              child: Card(
                                  elevation: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          snapshot.data!.data[index].nama
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            SizedBox(
                                              width: 80,
                                            ),
                                            Text(
                                              'Harga Beli : ',
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                            Text(
                                              Rupiah.format(snapshot.data!
                                                  .data[index].harga_beli),
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            SizedBox(
                                              width: 80,
                                            ),
                                            Text(
                                              'Harga Jual : ',
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                            Text(
                                              Rupiah.format(snapshot.data!
                                                  .data[index].harga_jual),
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            SizedBox(
                                              width: 80,
                                            ),
                                            Text(
                                              'Stok          :',
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                            Text(
                                              snapshot.data!.data[index].stok
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            SizedBox(
                                              width: 80,
                                            ),
                                            Text(
                                              'Supplier      :',
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                            Text(
                                              snapshot.data!.data[index]
                                                  .supplier.nama_supplier
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            SizedBox(
                                              width: 80,
                                            ),
                                            Text(
                                              'Kategori      :',
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                            Text(
                                              snapshot.data!.data[index]
                                                  .kategori.nama
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Auth.isAdmin != true
                                            ? SizedBox()
                                            : Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  SizedBox(
                                                    width: 100,
                                                  ),
                                                  GestureDetector(
                                                    child: Icon(
                                                      Icons.edit,
                                                      color: Colors.yellow,
                                                      size: 30,
                                                    ),
                                                    onTap: () => Navigator.push(
                                                      context,
                                                      PageTransition(
                                                          child: UpdateBarang(
                                                            barangId: snapshot
                                                                .data!
                                                                .data[index]
                                                                .barang_id
                                                                .toString(),
                                                            kategoriId: snapshot
                                                                .data!
                                                                .data[index]
                                                                .kategori
                                                                .kategori_id
                                                                .toString(),
                                                            supplierId: snapshot
                                                                .data!
                                                                .data[index]
                                                                .supplier
                                                                .supplier_id
                                                                .toString(),
                                                            namaBarang: snapshot
                                                                .data!
                                                                .data[index]
                                                                .nama,
                                                            hargaBeli: snapshot
                                                                .data!
                                                                .data[index]
                                                                .harga_beli
                                                                .toString(),
                                                            hargaJual: snapshot
                                                                .data!
                                                                .data[index]
                                                                .harga_jual
                                                                .toString(),
                                                            stok: snapshot
                                                                .data!
                                                                .data[index]
                                                                .stok
                                                                .toString(),
                                                          ),
                                                          type:
                                                              PageTransitionType
                                                                  .leftToRight),
                                                    ).then((value) => setState(
                                                          () {},
                                                        )),
                                                  ),
                                                  GestureDetector(
                                                    child: Icon(
                                                      Icons.remove_circle,
                                                      color: Colors.red,
                                                      size: 30,
                                                    ),
                                                    onTap: () {
                                                      showDialog<void>(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return AlertDialog(
                                                            title: const Text(
                                                                'Apakah Anda Yakin ?'),
                                                            content: Text(
                                                                'Akan Menghapus Barang ${snapshot.data!.data[index].nama}'),
                                                            actions: <Widget>[
                                                              TextButton(
                                                                style: TextButton
                                                                    .styleFrom(
                                                                  textStyle: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .labelLarge,
                                                                ),
                                                                child:
                                                                    const Text(
                                                                        'IYA'),
                                                                onPressed: () {
                                                                  setState(() {
                                                                    isLoading =
                                                                        true;
                                                                  });
                                                                  hapus(snapshot
                                                                      .data!
                                                                      .data[
                                                                          index]
                                                                      .barang_id
                                                                      .toString());
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                              ),
                                                              TextButton(
                                                                style: TextButton
                                                                    .styleFrom(
                                                                  textStyle: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .labelLarge,
                                                                ),
                                                                child:
                                                                    const Text(
                                                                        'TIDAK'),
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.push(
                                                        context,
                                                        PageTransition(
                                                            child: TambahStok(
                                                                id: snapshot
                                                                    .data!
                                                                    .data[index]
                                                                    .barang_id),
                                                            type: PageTransitionType
                                                                .leftToRight),
                                                      ).then(
                                                          (value) => setState(
                                                                () {},
                                                              ));
                                                    },
                                                    child: Text("Tambah Stok"),
                                                  )
                                                ],
                                              ),
                                      ],
                                    ),
                                  )),
                            );
                          },
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return Container(
                        margin: EdgeInsets.only(top: 100),
                        child: CircularProgressIndicator());
                  },
                ),
              ],
            ),
    );
  }
}
