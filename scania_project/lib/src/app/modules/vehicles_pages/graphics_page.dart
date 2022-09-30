import 'package:flutter/material.dart';
import 'package:scania_project/src/app/components/custom_pages.dart';

import '../../../utils/export.dart';

class VehicleCharts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StandardPage(
      pageTile: charts,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              'Emissão de CO2 por KM',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25, color: Color.fromARGB(255, 63, 59, 60)),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Image.asset('images/chart.png'),
          ],
        ),
      ),
    );
  }
}
