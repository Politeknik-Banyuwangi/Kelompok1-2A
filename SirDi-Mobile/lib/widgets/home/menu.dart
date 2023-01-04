import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: <Widget>[
        GestureDetector(
            child: Container(
              padding: const EdgeInsets.all(8),
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                  width: 2,
                ),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Text(
                    "Kasir",
                    style: TextStyle(
                      fontSize: 18,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Image.asset(
                    'assets/logo/penjualan.png',
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            onTap: () => Navigator.pushNamed(context, '/penjualan')),
        GestureDetector(
          child: Container(
            padding: const EdgeInsets.all(8),
            width: 110,
            height: 110,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                  width: 2,
                ),
                color: Colors.white),
            child: Column(
              children: [
                Text(
                  "Barang",
                  style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Image.asset(
                  'assets/logo/stok.png',
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          onTap: () => Navigator.pushNamed(context, '/stokpage'),
        ),
        GestureDetector(
          child: Container(
            padding: const EdgeInsets.all(8),
            width: 110,
            height: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Theme.of(context).primaryColor,
                width: 2,
              ),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Text(
                  "Daftar Supplier",
                  style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 5,
                ),
                const Icon(
                  Icons.people_outline,
                  size: 120,
                  color: Colors.blue,
                ),
              ],
            ),
          ),
          onTap: () => Navigator.pushNamed(context, '/supplier'),
        ),
        GestureDetector(
          child: Container(
            padding: const EdgeInsets.all(8),
            width: 110,
            height: 110,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                  width: 2,
                ),
                color: Colors.white),
            child: Column(
              children: [
                Text(
                  "Laporan",
                  style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Image.asset(
                  'assets/logo/laporan.png',
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          onTap: () => Navigator.pushNamed(context, '/laporan'),
        ),
      ],
    );
  }
}
