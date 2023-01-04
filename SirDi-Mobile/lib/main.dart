// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pbl_kasir/widgets/home/homepage.dart';
import 'package:pbl_kasir/widgets/karyawan/karyawan.dart';
import 'package:pbl_kasir/widgets/kategori/kategori.dart';
import 'package:pbl_kasir/widgets/laporan/laporan.dart';
import 'package:pbl_kasir/widgets/laporan/laporan_barang_masuk.dart';
import 'package:pbl_kasir/widgets/laporan/laporan_penjualan.dart';
import 'package:pbl_kasir/widgets/penjualan/penjualan.dart';
import 'package:pbl_kasir/widgets/splash_screen.dart';
import 'package:pbl_kasir/widgets/stok/stok.dart';
import 'package:pbl_kasir/widgets/supplier/supplier.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sir.Di',
      theme: ThemeData(
        primaryColor: Colors.blue,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return PageTransition(
              child: const SplashScreenWidget(),
              type: PageTransitionType.bottomToTop,
              childCurrent: this,
              duration: Duration(milliseconds: 250),
            );
          case '/home':
            return PageTransition(
              child: const HomePage(),
              type: PageTransitionType.bottomToTop,
              childCurrent: this,
              duration: Duration(milliseconds: 250),
            );
          case '/transaksipembelian':
            return PageTransition(
              child: LaporanBarangMasuk(),
              type: PageTransitionType.leftToRight,
              childCurrent: this,
              duration: Duration(milliseconds: 250),
            );
          case '/transaksipenjualan':
            return PageTransition(
              child: const LaporanPenjualan(),
              type: PageTransitionType.leftToRight,
              childCurrent: this,
              duration: Duration(milliseconds: 250),
            );
          case '/penjualan':
            return PageTransition(
              child: const Penjualan(),
              type: PageTransitionType.leftToRight,
              childCurrent: this,
              duration: Duration(milliseconds: 250),
            );
          case '/laporan':
            return PageTransition(
              child: const Laporan(),
              type: PageTransitionType.leftToRight,
              childCurrent: this,
              duration: Duration(milliseconds: 250),
            );
          case '/stokpage':
            return PageTransition(
              child: const StokPage(),
              type: PageTransitionType.leftToRight,
              childCurrent: this,
              duration: Duration(milliseconds: 250),
            );
          case '/karyawan':
            return PageTransition(
              child: const Karyawan(),
              type: PageTransitionType.leftToRight,
              childCurrent: this,
              duration: Duration(milliseconds: 250),
            );
          case '/kategori':
            return PageTransition(
              child: const Kategori(),
              type: PageTransitionType.leftToRight,
              childCurrent: this,
              duration: Duration(milliseconds: 250),
            );
          case '/supplier':
            return PageTransition(
              child: const Supplier(),
              type: PageTransitionType.leftToRight,
              childCurrent: this,
              duration: Duration(milliseconds: 250),
            );
          default:
            return null;
        }
      },
    );
  }
}
