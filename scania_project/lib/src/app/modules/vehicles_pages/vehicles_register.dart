import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:intl/intl.dart';

import '../../components/red_button.dart';
import '../../components/side_bar.dart';
import '../../models/vehicles.dart';
import '../../repository/vehicles_repository.dart';

class VehiclesFormPage extends StatefulWidget {
  Vehicles? vehicleToEdit;
  VehiclesFormPage({Key? key, this.vehicleToEdit}) : super(key: key);

  @override
  State<VehiclesFormPage> createState() => _VehiclesFormPageState();
}

class _VehiclesFormPageState extends State<VehiclesFormPage> {
  final _vehicleRepository = VehiclesRepository();
  final _valueController = MoneyMaskedTextController(
      decimalSeparator: ',', thousandSeparator: '.', leftSymbol: 'R\$');

  final _nameController = TextEditingController();
  final _plateController = TextEditingController();
  final _modelController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();

    final vehicles = widget.vehicleToEdit;
    if (vehicles != null) {
      _nameController.text = vehicles.name;
      _plateController.text = vehicles.plate;
      _modelController.text = vehicles.model;
      _descriptionController.text = vehicles.description;
      _valueController.text =
          NumberFormat.simpleCurrency(locale: 'pt_BR').format(vehicles.value);
    }
  }

  final _formKey = GlobalKey<FormState>();
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
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                _buildName(),
                const SizedBox(height: 20),
                _buildPlate(),
                const SizedBox(height: 20),
                _buildValue(),
                const SizedBox(height: 20),
                _buildModel(),
                const SizedBox(height: 20),
                _buildDescription(),
                const SizedBox(height: 20),
                _buildButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox _buildButton() {
    return SizedBox(
      width: double.infinity,
      child: StandardButton(
        onPressed: () async {
          final isValid = _formKey.currentState!.validate();
          if (isValid) {
            final name = _nameController.text;
            final plate = _plateController.text;
            final model = _modelController.text;
            final description = _descriptionController.text;
            final value = NumberFormat.currency(locale: 'pt_BR')
                .parse(_valueController.text.replaceAll('R\$', ''))
                .toDouble();

            final vehicle = Vehicles(
              name: name,
              plate: plate,
              model: model,
              description: description,
              value: value,
            );

            try {
              if (widget.vehicleToEdit != null) {
                vehicle.id = widget.vehicleToEdit!.id;
                await _vehicleRepository.editVehicle(vehicle);
              } else {
                await _vehicleRepository.addVehicle(vehicle);
              }

              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('$name cadastrado com sucesso!'),
              ));

              Navigator.of(context).pop(true);
            } catch (e) {
              Navigator.of(context).pop(false);
            }
          }
        },
        buttonText: 'Cadastrar',
      ),
    );
  }

  TextFormField _buildName() {
    return TextFormField(
      controller: _nameController,
      decoration: const InputDecoration(
        hintText: 'Informe o nome do veículo',
        labelText: 'Nome',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.abc),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Informe um nome';
        }
        if (value.length < 3 || value.length > 10) {
          return 'O nome deve ter entre 3 a 10 caracteres';
        }
        return null;
      },
    );
  }

  TextFormField _buildPlate() {
    return TextFormField(
      controller: _plateController,
      decoration: const InputDecoration(
        hintText: 'Informe a placa do veículo',
        labelText: 'Placa',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.source),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Informe a placa';
        }
        if (value.length != 7) {
          return 'A placa deve ter 7 digítos';
        }
        return null;
      },
    );
  }

  TextFormField _buildModel() {
    return TextFormField(
      controller: _modelController,
      decoration: const InputDecoration(
        hintText: 'Informe o modelo do veículo',
        labelText: 'Modelo',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.commute),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Informe o modelo do veículo';
        }
        if (value.length < 3 || value.length > 14) {
          return 'O modelo do carro deve ser entre 3 e 14 digítos';
        }
        return null;
      },
    );
  }

  TextFormField _buildDescription() {
    return TextFormField(
      controller: _descriptionController,
      decoration: const InputDecoration(
          hintText: 'Informe a descrição do veículo',
          labelText: 'Descrição',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.add_comment)),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Informe a descrição';
        }
        if (value.length < 3 || value.length > 14) {
          return 'A descrição deve ser entre 2 e 24 digítos';
        }
        return null;
      },
    );
  }

  TextFormField _buildValue() {
    return TextFormField(
      controller: _valueController,
      decoration: const InputDecoration(
        hintText: 'Informe o valor',
        labelText: 'Valor',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.money),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Informe um valor';
        }
        final valor = NumberFormat.currency(locale: 'pt_BR')
            .parse(_valueController.text.replaceAll('R\$', ''));
        if (valor <= 0) {
          return 'Informe um valor maior que 0';
        }

        return null;
      },
    );
  }
}
