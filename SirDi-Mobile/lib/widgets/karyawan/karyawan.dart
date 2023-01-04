import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pbl_kasir/utils/auth.dart';
import 'package:pbl_kasir/models/karyawan_response.dart';
import 'package:pbl_kasir/utils/base_url.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:pbl_kasir/widgets/karyawan/tambah_karyawan.dart';
import 'package:pbl_kasir/widgets/karyawan/update_karyawan.dart';

class Karyawan extends StatefulWidget {
  const Karyawan({super.key});

  @override
  State<Karyawan> createState() => _KaryawanState();
}

class _KaryawanState extends State<Karyawan> {
  bool isLoading = false;

  Future<KaryawanResponse> getKategori() async {
    try {
      Uri url = Uri.parse(BaseUrl.url + '/karyawan');
      var response = await http.get(url, headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': Auth.token
      });
      return KaryawanResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw FormatException(e.toString());
    }
  }

  Future<void> hapus(String id) async {
    Uri url = Uri.parse('${BaseUrl.url}/hapusKaryawan/$id');
    try {
      var response = await http.delete(url, headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': Auth.token
      });
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      throw FormatException(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Karyawan"),
        centerTitle: true,
      ),
      floatingActionButton: Auth.isAdmin != true
          ? Container()
          : FloatingActionButton(
              onPressed: () => Navigator.push(
                context,
                PageTransition(
                    child: const TambahKaryawan(),
                    type: PageTransitionType.leftToRight),
              ).then((value) => setState(() {})),
              child: Icon(Icons.add),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: FutureBuilder<KaryawanResponse>(
        future: getKategori(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.data.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Card(
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              snapshot.data!.data[index].name,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Email : ${snapshot.data!.data[index].email}",
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Auth.isAdmin != true
                                ? Container()
                                : Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                        width: 100,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                                  context,
                                                  PageTransition(
                                                      child: UpdateKaryawan(
                                                        id: snapshot.data!
                                                            .data[index].id,
                                                        name: snapshot.data!
                                                            .data[index].name,
                                                        email: snapshot.data!
                                                            .data[index].email,
                                                      ),
                                                      type: PageTransitionType
                                                          .leftToRight))
                                              .then((value) => setState(
                                                    () {},
                                                  ));
                                        },
                                        child: Icon(
                                          Icons.edit,
                                          color: Colors.yellow,
                                          size: 30,
                                        ),
                                      ),
                                      GestureDetector(
                                        // ignore: prefer_const_constructors
                                        child: Icon(
                                          Icons.remove_circle,
                                          color: Colors.red,
                                          size: 30,
                                        ),
                                        onTap: () {
                                          showDialog<void>(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: const Text(
                                                    'Apakah Anda Yakin ?'),
                                                content: Text(
                                                    'Akan Menghapus Barang ${snapshot.data!.data[index].name}'),
                                                actions: <Widget>[
                                                  TextButton(
                                                    style: TextButton.styleFrom(
                                                      textStyle:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .labelLarge,
                                                    ),
                                                    child: const Text('IYA'),
                                                    onPressed: () {
                                                      setState(() {
                                                        isLoading = true;
                                                      });
                                                      hapus(snapshot
                                                          .data!.data[index].id
                                                          .toString());
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  ),
                                                  TextButton(
                                                    style: TextButton.styleFrom(
                                                      textStyle:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .labelLarge,
                                                    ),
                                                    child: const Text('TIDAK'),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                          ],
                        ),
                      )),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
