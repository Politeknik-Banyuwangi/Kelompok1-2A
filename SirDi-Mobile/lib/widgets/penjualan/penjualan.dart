// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pbl_kasir/models/barang_transaksi.dart';
import 'package:pbl_kasir/models/response.dart';
import 'package:pbl_kasir/utils/auth.dart';
import 'package:pbl_kasir/utils/base_url.dart';
import 'package:http/http.dart' as http;
import 'package:pbl_kasir/utils/rupiah.dart';
import 'package:pbl_kasir/widgets/penjualan/list_transaksi.dart';
import 'package:pbl_kasir/widgets/stok/update_barang.dart';
import 'dart:convert';

class Penjualan extends StatefulWidget {
  const Penjualan({super.key});

  @override
  State<Penjualan> createState() => _PenjualanState();
}

class _PenjualanState extends State<Penjualan>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  TextEditingController cariController = TextEditingController();
  late TabController controller = TabController(length: 2, vsync: this);
  List<BarangTransaksi> barangTransaksi = [];
  Future<Response> getData() async {
    Uri url;
    if (cariController.text.isEmpty) {
      url = Uri.parse('${BaseUrl.url}/barang');
    } else {
      url = Uri.parse('${BaseUrl.url}/barang?nama=${cariController.text}');
    }
    var response = await http.get(url, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': Auth.token
    });
    return Response.fromJson(jsonDecode(response.body));
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cariBarang = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Kasir"),
        centerTitle: true,
        elevation: 0,
        bottom: TabBar(
          controller: controller,
          tabs: [
            Tab(icon: Icon(Icons.production_quantity_limits)),
            Tab(icon: Icon(Icons.money)),
          ],
        ),
      ),
      body: isLoading != false
          ? Center(
              child: CircularProgressIndicator(),
            )
          : TabBarView(
              controller: controller,
              children: [
                Column(
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
                              GestureDetector(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Container(
                                    width: 70,
                                    height: 60,
                                    color: Theme.of(context).primaryColor,
                                    child: Icon(
                                      Icons.search_rounded,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  setState(() {});
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
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
                                                  snapshot
                                                      .data!.data[index].stok
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                ElevatedButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      if (barangTransaksi
                                                          .isEmpty) {
                                                        barangTransaksi.add(
                                                            BarangTransaksi(
                                                                barang_id: snapshot
                                                                    .data!
                                                                    .data[index]
                                                                    .barang_id,
                                                                nama: snapshot
                                                                    .data!
                                                                    .data[index]
                                                                    .nama,
                                                                harga_jual: snapshot
                                                                    .data!
                                                                    .data[index]
                                                                    .harga_jual,
                                                                stok: snapshot
                                                                    .data!
                                                                    .data[index]
                                                                    .stok,
                                                                jumlah: 1,
                                                                total: 0));
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                                "Berhasil Tambah Transaksi"),
                                                            backgroundColor:
                                                                Colors.green,
                                                          ),
                                                        );
                                                      } else {
                                                        for (var element
                                                            in barangTransaksi) {
                                                          if (snapshot
                                                                  .data!
                                                                  .data[index]
                                                                  .barang_id ==
                                                              element
                                                                  .barang_id) {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                    "Barang Sudah Ada"),
                                                                backgroundColor:
                                                                    Colors.red,
                                                              ),
                                                            );
                                                            return;
                                                          }
                                                        }
                                                        barangTransaksi.add(
                                                            BarangTransaksi(
                                                                barang_id: snapshot
                                                                    .data!
                                                                    .data[index]
                                                                    .barang_id,
                                                                nama: snapshot
                                                                    .data!
                                                                    .data[index]
                                                                    .nama,
                                                                harga_jual: snapshot
                                                                    .data!
                                                                    .data[index]
                                                                    .harga_jual,
                                                                stok: snapshot
                                                                    .data!
                                                                    .data[index]
                                                                    .stok,
                                                                jumlah: 1,
                                                                total: 0));
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                                "Berhasil Tambah Transaksi"),
                                                            backgroundColor:
                                                                Colors.green,
                                                          ),
                                                        );
                                                      }
                                                    });
                                                  },
                                                  child:
                                                      Text('Tambah Transaksi'),
                                                ),
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
                Container(
                  child: listTransaksi(barangTransaksi: barangTransaksi),
                )
              ],
            ),
    );
  }
}
