import 'package:flutter/material.dart';
import 'package:scania_project/src/app/components/custom_cards.dart';
import 'package:scania_project/src/app/components/custom_pages.dart';
import 'package:scania_project/src/app/modules/create_account/create_account.dart';
import 'package:scania_project/src/app/modules/vehicles_pages/vehicles_page.dart';

import '../../../utils/ui_text.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StandardPage(
      pageTile: homeCaps,
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => VehiclesListPage()),
                  ),
                );
              },
              child: StandardCard(
                text: vehicles,
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
          ],
        ),
      ),
    );
  }
}
