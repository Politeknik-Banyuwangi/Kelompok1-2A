// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Laporan extends StatelessWidget {
  const Laporan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Laporan",
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
        child: Column(
          children: [
            buttonBuilder(
              context,
              "Laporan Transaksi Penjualan",
              "/transaksipenjualan",
            ),
            buttonBuilder(
              context,
              "Laporan Barang Masuk",
              "/transaksipembelian",
            ),
          ],
        ),
      ),
    );
    ;
  }

  Widget buttonBuilder(BuildContext context, String judul, String route) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width - 30,
          height: 70,
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).primaryColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
          ),
          child: Text(
            judul,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        onTap: () => Navigator.pushNamed(context, route),
      ),
    );
  }
}
