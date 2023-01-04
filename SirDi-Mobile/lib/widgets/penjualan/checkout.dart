import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pbl_kasir/models/barang_transaksi.dart';
import 'package:http/http.dart' as http;
import 'package:pbl_kasir/utils/auth.dart';
import 'package:pbl_kasir/utils/base_url.dart';
import 'package:pbl_kasir/utils/rupiah.dart';
import 'package:pbl_kasir/widgets/penjualan/nota.dart';

class CheckOut extends StatefulWidget {
  List<BarangTransaksi> listBarang;
  CheckOut({super.key, required this.listBarang});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  final _formKey = GlobalKey<FormState>();
  int total = 0;
  TextEditingController uang = TextEditingController();
  Future<void> transaksi() async {
    Uri url = Uri.parse("${BaseUrl.url}/transaksi");
    try {
      var response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': Auth.token
        },
        body: jsonEncode({'data': widget.listBarang}),
      );
      print(response.body);
    } catch (e) {
      throw FormatException(e.toString());
    }
  }

  getTotal() {
    int p = 0;
    widget.listBarang.forEach(
      (element) {
        p += element.total;
      },
    );
    setState(() {
      total = p;
    });
  }

  @override
  void initState() {
    super.initState();
    getTotal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Check Out"),
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
              rows: widget.listBarang
                  .map((e) => DataRow(cells: [
                        DataCell(Text(e.nama)),
                        DataCell(Text(e.harga_jual.toString())),
                        DataCell(Text(e.jumlah.toString())),
                        DataCell(Text(e.total.toString())),
                      ]))
                  .toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  "Total Keseluruhan : ",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(
                  Rupiah.format(total),
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Masukkan Uang : ",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Form(
                    key: _formKey,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: uang,
                      decoration: InputDecoration(border: OutlineInputBorder()),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Wajib Di isi';
                        } else if (total > int.parse(uang.text)) {
                          return 'Uang kurang';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                  transaksi().then((value) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        PageTransition(
                            child: Nota(
                              listBarang: widget.listBarang,
                              uang: int.parse(uang.text),
                              totalKeseluruhan: total,
                            ),
                            type: PageTransitionType.leftToRight),
                        (route) => false);
                  });
                }
              },
              child: const Text('Proses Transaksi'),
            ),
          ),
        ],
      ),
    );
  }
}
