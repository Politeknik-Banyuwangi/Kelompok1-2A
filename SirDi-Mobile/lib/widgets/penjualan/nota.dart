import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pbl_kasir/models/barang_transaksi.dart';
import 'package:pbl_kasir/utils/rupiah.dart';

class Nota extends StatelessWidget {
  final List<BarangTransaksi> listBarang;
  final int uang;
  final int totalKeseluruhan;
  const Nota(
      {super.key,
      required this.listBarang,
      required this.totalKeseluruhan,
      required this.uang});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cetak Nota"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: DataTable(
              columnSpacing: 20,
              columns: const [
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'Nama Barang',
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'Harga Barang',
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'Jumlah',
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'Total',
                    ),
                  ),
                ),
              ],
              rows: listBarang
                  .map((e) => DataRow(cells: [
                        DataCell(Text(e.nama)),
                        DataCell(Text(e.harga_jual.toString())),
                        DataCell(Text(e.jumlah.toString())),
                        DataCell(Text(e.total.toString())),
                      ]))
                  .toList(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Total Keseluruhan      : ${Rupiah.format(totalKeseluruhan)}",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Total Uang      : ${Rupiah.format(uang)}",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Kembalian      : ${Rupiah.format(uang - totalKeseluruhan)}",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, "/home", (route) => false);
                },
                child: Text("Kembali")),
          ),
        ],
      ),
    );
  }
}
