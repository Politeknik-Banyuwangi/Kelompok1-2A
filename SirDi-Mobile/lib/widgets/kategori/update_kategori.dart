import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pbl_kasir/utils/auth.dart';
import 'package:pbl_kasir/utils/base_url.dart';
import 'package:http/http.dart' as http;

class UpdateKategori extends StatefulWidget {
  int id;
  String nama;
  UpdateKategori({super.key, required this.id, required this.nama});

  @override
  State<UpdateKategori> createState() => _UpdateKategoriState();
}

class _UpdateKategoriState extends State<UpdateKategori> {
  final _formKeyBarang = GlobalKey<FormState>();
  TextEditingController kategori = TextEditingController();
  bool isLoading = false;
  Future<void> updateKategori() async {
    try {
      Uri url = Uri.parse('${BaseUrl.url}/updatekategori/${widget.id}');
      var response = await http.put(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': Auth.token,
          'Accept': 'application/json'
        },
        body: jsonEncode(
          <String, String>{
            'nama': kategori.text,
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
    kategori.text = widget.nama;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Kategori"),
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
                            labelText: 'Masukkan Nama Kategori',
                          ),
                          controller: kategori,
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
                              updateKategori();
                            }
                          },
                          child: const Text('Update Kategori'),
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
