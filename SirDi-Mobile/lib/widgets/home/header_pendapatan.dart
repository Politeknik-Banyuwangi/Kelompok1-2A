import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pbl_kasir/models/total.dart';
import 'package:pbl_kasir/utils/auth.dart';
import 'package:pbl_kasir/utils/base_url.dart';
import 'package:http/http.dart' as http;
import 'package:pbl_kasir/utils/rupiah.dart';

class HeaderPendapatan extends StatefulWidget {
  final Size size;
  HeaderPendapatan({super.key, required this.size});

  @override
  State<HeaderPendapatan> createState() => _HeaderPendapatanState();
}

class _HeaderPendapatanState extends State<HeaderPendapatan> {
  int pendapatan = 0;
  Future<TotalHariIni> getTotal() async {
    try {
      Uri url = Uri.parse('${BaseUrl.url}/totalhariini');
      var res = await http.get(url, headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': Auth.token
      });
      return TotalHariIni.fromJson(jsonDecode(res.body));
    } catch (e) {
      throw FormatException(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size.height * 0.3,
      child: Stack(
        children: [
          Container(
            height: widget.size.height * 0.4 - 0.27,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
          ),
          Positioned(
            left: 0,
            bottom: 80,
            right: 0,
            child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: 90,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: FutureBuilder(
                  future: getTotal(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Total Penjualan Hari Ini ",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            Rupiah.format(snapshot.data!.penjualan),
                            style: TextStyle(
                                fontSize: 20,
                                height: 2.5,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor),
                          ),
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                )),
          ),
        ],
      ),
    );
  }
}
