import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../components/side_bar.dart';
import '../../models/vehicles.dart';

class VehiclesInfo extends StatelessWidget {
  const VehiclesInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vehicle = ModalRoute.of(context)!.settings.arguments as Vehicles;

    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: const Text(
          "Veículo",
          style: TextStyle(color: Color.fromARGB(255, 180, 70, 82)),
        ),
        backgroundColor: const Color.fromARGB(255, 15, 19, 60),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: const Text('Nome'),
              subtitle: Text(vehicle.name),
            ),
            ListTile(
              title: const Text('Descrição'),
              subtitle: Text(vehicle.description),
            ),
            ListTile(
              title: const Text('Modelo'),
              subtitle: Text(vehicle.model),
            ),
            ListTile(
              title: const Text('Valor'),
              subtitle: Text(NumberFormat.simpleCurrency(locale: 'pt_BR')
                  .format(vehicle.value)),
            ),
            ListTile(
              title: const Text('Placa'),
              subtitle: Text(vehicle.plate),
            ),
          ],
        ),
      ),
    );
  }
}
