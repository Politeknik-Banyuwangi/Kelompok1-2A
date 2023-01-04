// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pbl_kasir/models/barang_transaksi.dart';
import 'package:pbl_kasir/utils/rupiah.dart';
import 'package:pbl_kasir/widgets/penjualan/checkout.dart';

class listTransaksi extends StatefulWidget {
  List<BarangTransaksi> barangTransaksi;
  listTransaksi({super.key, required this.barangTransaksi});

  @override
  State<listTransaksi> createState() => _listTransaksiState();
}

class _listTransaksiState extends State<listTransaksi> {
  final _formKey = GlobalKey<FormState>();
  List<TextEditingController> _controller = [];
  getTotal() {
    int total = 0;
    widget.barangTransaksi.map((e) {
      total += e.total;
    });
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: widget.barangTransaksi.isEmpty
              ? Container()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        showDialog<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Apakah Anda Yakin ?'),
                              content: Text("Selanjutnya"),
                              actions: <Widget>[
                                TextButton(
                                  style: TextButton.styleFrom(
                                    textStyle:
                                        Theme.of(context).textTheme.labelLarge,
                                  ),
                                  child: const Text('Batal'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    textStyle:
                                        Theme.of(context).textTheme.labelLarge,
                                  ),
                                  child: const Text('Iya'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    if (_formKey.currentState!.validate()) {
                                      Navigator.push(
                                        context,
                                        PageTransition(
                                            child: CheckOut(
                                                listBarang:
                                                    widget.barangTransaksi),
                                            type:
                                                PageTransitionType.leftToRight),
                                      );
                                    }
                                    ;
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Text("Proses Transaksi"),
                    ),
                  ],
                ),
        ),
        Form(
          key: _formKey,
          child: Expanded(
            child: ListView.builder(
              itemCount: widget.barangTransaksi.length,
              itemBuilder: (context, index) {
                _controller.add(TextEditingController());
                _controller[index].text =
                    widget.barangTransaksi[index].jumlah.toString();
                widget.barangTransaksi[index].total =
                    (widget.barangTransaksi[index].harga_jual *
                        int.parse(_controller[index].text));
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Card(
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  widget.barangTransaksi[index].nama.toString(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      widget.barangTransaksi.removeAt(index);
                                    });
                                  },
                                  child: Icon(
                                    Icons.remove_circle,
                                    color: Colors.red,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const SizedBox(
                                  width: 80,
                                ),
                                const Text(
                                  'Harga Jual : ',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  Rupiah.format(
                                      widget.barangTransaksi[index].harga_jual),
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                  widget.barangTransaksi[index].stok.toString(),
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 250,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: TextFormField(
                                      controller: _controller[index],
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Jumlah',
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Wajib Di isi';
                                        } else if (value == 0) {
                                          return "Jumlah Tidak Boleh 0";
                                        } else if (int.parse(
                                                _controller[index].text) >
                                            widget
                                                .barangTransaksi[index].stok) {
                                          return "Stok Tidak Mencukupi";
                                        }
                                        return null;
                                      },
                                      keyboardType: TextInputType.number,
                                      onChanged: (value) {
                                        Timer(Duration(milliseconds: 1500), () {
                                          setState(() {
                                            widget.barangTransaksi[index]
                                                    .jumlah =
                                                int.parse(
                                                    _controller[index].text);
                                          });
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: 80,
                                ),
                                Text(
                                  'Total          :',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  Rupiah.format(
                                      widget.barangTransaksi[index].total),
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
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
        ),
      ],
    );
  }
}
