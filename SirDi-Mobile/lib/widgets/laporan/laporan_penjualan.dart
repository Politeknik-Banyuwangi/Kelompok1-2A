// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pbl_kasir/models/history_response.dart';
import 'package:pbl_kasir/utils/auth.dart';
import 'package:pbl_kasir/utils/base_url.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:pbl_kasir/utils/rupiah.dart';
import 'package:pbl_kasir/widgets/laporan/laporan_hari_ini.dart';

class LaporanPenjualan extends StatefulWidget {
  const LaporanPenjualan({super.key});

  @override
  State<LaporanPenjualan> createState() => _LaporanPenjualanState();
}

class _LaporanPenjualanState extends State<LaporanPenjualan>
    with SingleTickerProviderStateMixin {
  late TabController controller = TabController(length: 2, vsync: this);
  TextEditingController from = TextEditingController();
  TextEditingController to = TextEditingController();
  bool isDate = false;
  List<dynamic> listKategori = [];
  String selectedkategori = "";
  bool isKategori = false;
  var client = http.Client();

  Future<HistoryResponse> getTransaksi() async {
    try {
      String queryParam = "";
      if (from.text.isNotEmpty) {
        queryParam += "?from=${from.text}";
      }
      if (to.text.isNotEmpty) {
        if (from.text.isNotEmpty) {
          queryParam += "&to=${to.text}";
        } else {
          queryParam += "?to=${to.text}";
        }
      }
      if (isKategori) {
        if (from.text.isNotEmpty || to.text.isNotEmpty) {
          queryParam += "&kategori=$selectedkategori";
        } else {
          queryParam += "?kategori=$selectedkategori";
        }
      }
      Uri url = Uri.parse('${BaseUrl.url}/transaksi${queryParam}');
      var response = await client.get(url, headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': Auth.token
      });
      return HistoryResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw FormatException(e.toString());
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
  void dispose() {
    super.dispose();
    controller.dispose();
    from.dispose();
    to.dispose();
  }

  @override
  void initState() {
    super.initState();
    getKategori();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Laporan Penjualan"),
          centerTitle: true,
          elevation: 0,
          bottom: TabBar(
            controller: controller,
            tabs: const [
              Tab(
                text: "Hari Ini",
              ),
              Tab(
                text: "Semua",
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: controller,
          children: [
            LaporanPenjualanHariIni(),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: TextField(
                            controller: from,
                            decoration: InputDecoration(
                                icon: Icon(Icons.calendar_today),
                                labelText: "Dari Tanggal"),
                            readOnly: true,
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1950),
                                  lastDate: DateTime(2100));

                              if (pickedDate != null) {
                                String formattedDate =
                                    DateFormat('yyyy-MM-dd').format(pickedDate);

                                setState(() {
                                  from.text =
                                      formattedDate; //set output date to TextField value.
                                  isDate = true;
                                });
                              } else {}
                            },
                            onChanged: (value) {
                              setState(() {});
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: TextField(
                            controller: to,
                            decoration: InputDecoration(
                                icon: Icon(Icons.calendar_today),
                                labelText: "Ke Tanggal"),
                            readOnly: true,
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1950),
                                  lastDate: DateTime(2100));

                              if (pickedDate != null) {
                                String formattedDate =
                                    DateFormat('yyyy-MM-dd').format(pickedDate);
                                setState(() {
                                  to.text =
                                      formattedDate; //set output date to TextField value.
                                });
                              } else {}
                            },
                            onChanged: (value) {
                              setState(() {
                                isDate = true;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
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
                    : Row(
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
                isDate == true
                    ? ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isDate = false;
                            isKategori = false;
                            from.text = "";
                            to.text = "";
                          });
                        },
                        child: Text("Reset"))
                    : Container(),
                Expanded(
                  child: FutureBuilder<HistoryResponse>(
                    future: getTransaksi(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                elevation: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        "Penjualan : ",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Expanded(
                                        child: FittedBox(
                                          child: Text(
                                            Rupiah.format(
                                                snapshot.data!.penjualan),
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Laba : ",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Expanded(
                                        child: FittedBox(
                                          child: Text(
                                            Rupiah.format(snapshot.data!.laba),
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
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
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    snapshot
                                                        // ignore: prefer_const_constructors
                                                        .data!
                                                        .data[index]
                                                        .barang[0]
                                                        .nama,
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    "X ${snapshot
                                                        // ignore: prefer_const_constructors
                                                        .data!.data[index].jumlah}",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                // ignore: prefer_const_literals_to_create_immutables
                                                children: [
                                                  SizedBox(
                                                    width: 40,
                                                  ),
                                                  Text(
                                                    "Tanggal : ",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    DateFormat('yyyy-MM-dd')
                                                        .format(snapshot
                                                            .data!
                                                            .data[index]
                                                            .created_at),
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                // ignore: prefer_const_literals_to_create_immutables
                                                children: [
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    "Total : ",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    Rupiah.format(snapshot.data!
                                                        .data[index].total),
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                // ignore: prefer_const_literals_to_create_immutables
                                                children: [
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    "Laba : ",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    Rupiah.format(snapshot.data!
                                                        .data[index].laba),
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                // ignore: prefer_const_literals_to_create_immutables
                                                children: [
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    "Kasir : ",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    snapshot.data!.data[index]
                                                        .user.name,
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        )),
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      } else if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      }
                      return Center(child: const CircularProgressIndicator());
                    },
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
