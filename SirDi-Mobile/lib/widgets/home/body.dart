import 'package:flutter/material.dart';

import 'header_pendapatan.dart';
import 'menu.dart';

class BodyPage extends StatelessWidget {
  const BodyPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            HeaderPendapatan(
              size: size,
            ),
            const Menu()
          ],
        ),
      ),
    );
  }
}
