import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pbl_kasir/models/barang_masuk_response.dart';
import 'package:pbl_kasir/models/history_response.dart';
import 'package:pbl_kasir/utils/auth.dart';
import 'package:pbl_kasir/utils/base_url.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:pbl_kasir/utils/rupiah.dart';

class LaporanBarangMasuk extends StatefulWidget {
  LaporanBarangMasuk({super.key});

  @override
  State<LaporanBarangMasuk> createState() => _LaporanBarangMasukState();
}

class _LaporanBarangMasukState extends State<LaporanBarangMasuk> {
  TextEditingController from = TextEditingController();
  bool isDate = false;
  TextEditingController to = TextEditingController();

  Future<BarangMasukResponse> getBarangMasuk() async {
    try {
      String queryParam = "";
      if (from.text.isNotEmpty) {
        isDate = true;
        queryParam += "?from=${from.text}";
      }
      if (to.text.isNotEmpty) {
        isDate = true;
        queryParam += "&to=${to.text}";
      }
      Uri url = Uri.parse('${BaseUrl.url}/barangmasuk${queryParam}');
      var response = await http.get(url, headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': Auth.token
      });
      return BarangMasukResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw new FormatException(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Barang Masuk"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
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
                    padding: const EdgeInsets.all(8.0),
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
              ],
            ),
          ),
          isDate == true
              ? ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isDate = false;
                      from.text = "";
                      to.text = "";
                    });
                  },
                  child: Text("Reset"))
              : Container(),
          Expanded(
            child: FutureBuilder<BarangMasukResponse>(
              future: getBarangMasuk(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
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
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              snapshot
                                                  // ignore: prefer_const_constructors
                                                  .data!
                                                  .data[index]
                                                  .barang
                                                  .nama,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "X ${snapshot
                                                  // ignore: prefer_const_constructors
                                                  .data!.data[index].jumlah}",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          // ignore: prefer_const_literals_to_create_immutables
                                          children: [
                                            SizedBox(
                                              width: 40,
                                            ),
                                            Text(
                                              "Tanggal : ",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              DateFormat('yyyy-MM-dd').format(
                                                  snapshot.data!.data[index]
                                                      .created_at),
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
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
    );
  }
}
