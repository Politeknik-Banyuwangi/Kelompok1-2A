import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pbl_kasir/utils/auth.dart';
import 'package:pbl_kasir/utils/base_url.dart';
import 'package:http/http.dart' as http;

class UpdateSupplier extends StatefulWidget {
  int id;
  String nama;
  UpdateSupplier({super.key, required this.id, required this.nama});

  @override
  State<UpdateSupplier> createState() => Tambah_SupplierState();
}

class Tambah_SupplierState extends State<UpdateSupplier> {
  final _formKeyBarang = GlobalKey<FormState>();
  TextEditingController supplier = TextEditingController();
  bool isLoading = false;
  Future<void> updateSupplier() async {
    try {
      Uri url = Uri.parse('${BaseUrl.url}/updatesupplier/${widget.id}');
      print(url);
      var response = await http.put(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': Auth.token,
          'Accept': 'application/json'
        },
        body: jsonEncode(
          <String, String>{
            'nama_supplier': supplier.text,
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
    supplier.text = widget.nama;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Supplier"),
        centerTitle: true,
      ),
      body: isLoading == true
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Form(
                  key: _formKeyBarang,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Masukkan Nama Supplier',
                          ),
                          controller: supplier,
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
                              updateSupplier();
                            }
                          },
                          child: const Text('Update Supplier'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
