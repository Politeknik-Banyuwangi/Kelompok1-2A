import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pbl_kasir/utils/auth.dart';
import 'package:pbl_kasir/utils/base_url.dart';
import 'package:http/http.dart' as http;

class UpdateKaryawan extends StatefulWidget {
  int id;
  String name;
  String email;
  UpdateKaryawan(
      {super.key, required this.id, required this.name, required this.email});

  @override
  State<UpdateKaryawan> createState() => _UpdateKaryawanState();
}

class _UpdateKaryawanState extends State<UpdateKaryawan> {
  final _formKeyBarang = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isLoading = false;
  bool isPassword = false;
  Future<void> updateKaryawan() async {
    try {
      Uri url = Uri.parse('${BaseUrl.url}/updatekaryawan/${widget.id}');
      var response = await http.put(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': Auth.token,
          'Accept': 'application/json'
        },
        body: isPassword != true
            ? jsonEncode(
                <String, String>{
                  'name': name.text,
                  'email': email.text,
                },
              )
            : jsonEncode(<String, String>{
                'name': name.text,
                'email': email.text,
                'password': password.text
              }),
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
    name.text = widget.name;
    email.text = widget.email;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Karyawan"),
        centerTitle: true,
      ),
      body: isLoading == true
          ? const Center(child: CircularProgressIndicator())
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
                            labelText: 'Masukkan Nama Karyawan',
                          ),
                          controller: name,
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
                            labelText: 'Masukkan Email Karyawan',
                          ),
                          controller: email,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Tidak Boleh Kosong';
                            }
                            return null;
                          },
                        ),
                      ),
                      isPassword != true
                          ? TextButton(
                              onPressed: () => setState(() {
                                isPassword = true;
                              }),
                              child: const Text("Ubah Password"),
                            )
                          : Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Masukkan Password Karyawan',
                                      ),
                                      controller: password,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Tidak Boleh Kosong';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  TextButton(
                                      onPressed: () => setState(() {
                                            isPassword = false;
                                          }),
                                      child: const Text("Batal"))
                                ],
                              )),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKeyBarang.currentState!.validate()) {
                              setState(() {
                                isLoading = true;
                              });
                              updateKaryawan();
                            }
                          },
                          child: const Text('Update Karyawan'),
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
