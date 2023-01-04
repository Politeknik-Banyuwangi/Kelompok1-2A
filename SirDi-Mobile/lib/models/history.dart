// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:pbl_kasir/models/barang.dart';
import 'package:pbl_kasir/models/barang_history.dart';
import 'package:pbl_kasir/models/user.dart';
part 'history.g.dart';

@JsonSerializable(explicitToJson: true)
class History {
  int history_transaksi_id;
  int user_id;
  int jumlah;
  int total;
  int laba;
  DateTime created_at;
  DateTime updated_at;
  List<BarangHistory> barang;
  User user;
  History({
    required this.history_transaksi_id,
    required this.user_id,
    required this.jumlah,
    required this.total,
    required this.laba,
    required this.created_at,
    required this.updated_at,
    required this.barang,
    required this.user,
  });
  factory History.fromJson(Map<String, dynamic> json) =>
      _$HistoryFromJson(json);
  Map<String, dynamic> toJson() => _$HistoryToJson(this);
}
