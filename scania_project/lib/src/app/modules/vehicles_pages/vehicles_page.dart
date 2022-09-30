import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:scania_project/src/app/modules/vehicles_pages/vehicle_information.dart';
import 'package:scania_project/src/app/modules/vehicles_pages/vehicles_register.dart';

import '../../components/card_vehicles.dart';
import '../../components/side_bar.dart';
import '../../models/vehicles.dart';
import '../../repository/vehicles_repository.dart';

class VehiclesListPage extends StatefulWidget {
  const VehiclesListPage({Key? key}) : super(key: key);

  @override
  State<VehiclesListPage> createState() => _VehiclesListPageState();
}

class _VehiclesListPageState extends State<VehiclesListPage> {
  final _vehicleRepository = VehiclesRepository();
  late Future<List<Vehicles>> _futureVehicles;

  @override
  void initState() {
    carregarVehicles();
    super.initState();
  }

  void carregarVehicles() {
    _futureVehicles = _vehicleRepository.listarVehicles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: const Text(
          "Veículos",
          style: TextStyle(color: Color.fromARGB(255, 180, 70, 82)),
        ),
        backgroundColor: const Color.fromARGB(255, 15, 19, 60),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Vehicles>>(
        future: _futureVehicles,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            final vehicles = snapshot.data ?? [];
            return ListView.separated(
              itemCount: vehicles.length,
              itemBuilder: (context, index) {
                final vehicle = vehicles[index];
                return Slidable(
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) async {
                          await _vehicleRepository.removeVehicle(vehicle.id!);

                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('Lançamento removido com sucesso')));

                          setState(() {
                            vehicles.removeAt(index);
                          });
                        },
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Remover',
                      ),
                      SlidableAction(
                        onPressed: (context) async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  VehiclesFormPage(vehicleToEdit: vehicle),
                            ),
                          );
                        },
                        backgroundColor: const Color.fromARGB(255, 15, 19, 60),
                        foregroundColor: Colors.white,
                        icon: Icons.edit,
                        label: 'Editar',
                      ),
                    ],
                  ),
                  child: VehiclesListItem(vehicles: vehicle),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
            );
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 15, 19, 60),
          foregroundColor: const Color.fromARGB(255, 180, 70, 82),
          onPressed: () async {
            bool? vehicleCadastrado = await Navigator.of(context)
                .pushNamed('/vehicles-form') as bool?;

            if (vehicleCadastrado != null && vehicleCadastrado) {
              setState(() {
                carregarVehicles();
              });
            }
          },
          child: const Icon(Icons.add)),
    );
  }
}
