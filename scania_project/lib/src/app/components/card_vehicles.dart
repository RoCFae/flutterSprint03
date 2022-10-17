import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/vehicles.dart';

class VehiclesListItem extends StatelessWidget {
  final Vehicles vehicles;
  const VehiclesListItem({Key? key, required this.vehicles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: Color.fromARGB(255, 184, 39, 7),
        child: Icon(
          Icons.car_rental,
          size: 20,
          color: Colors.white,
        ),
      ),
      title: Text(vehicles.name),
      subtitle: Text(vehicles.description),
      trailing: Text(
        NumberFormat.simpleCurrency(locale: 'pt_BR').format(vehicles.value),
        style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 15,
            color: Color.fromARGB(255, 168, 14, 7)),
      ),
      onTap: () {
        Navigator.pushNamed(context, '/vehicles-info', arguments: vehicles);
      },
    );
  }
}
