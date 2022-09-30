import '../database/database_manager.dart';
import '../models/vehicles.dart';

class VehiclesRepository {
  Future<List<Vehicles>> listarVehicles() async {
    final db = await DatabaseManager().getDatabase();
    final List<Map<String, dynamic>> rows = await db.rawQuery('''
          SELECT 
            vehicles.id, 
            vehicles.name,
            vehicles.model,
            vehicles.plate, 
            vehicles.value,
            vehicles.description
          FROM vehicles
''');
    return rows
        .map(
          (row) => Vehicles(
              id: row['id'],
              name: row['name'],
              model: row['model'],
              plate: row['plate'],
              value: row['value'],
              description: row['description']),
        )
        .toList();
  }

  Future<void> addVehicle(Vehicles vehicles) async {
    final db = await DatabaseManager().getDatabase();

    db.insert("vehicles", {
      "id": vehicles.id,
      "name": vehicles.name,
      "plate": vehicles.plate,
      "model": vehicles.model,
      "value": vehicles.value,
      "description": vehicles.description,
    });
  }

  Future<void> removeVehicle(int id) async {
    final db = await DatabaseManager().getDatabase();
    await db.delete('vehicles', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> editVehicle(Vehicles vehicles) async {
    final db = await DatabaseManager().getDatabase();
    return db.update(
        'vehicles',
        {
          "id": vehicles.id,
          "name": vehicles.name,
          "plate": vehicles.plate,
          "model": vehicles.model,
          "value": vehicles.value,
          "description": vehicles.description
        },
        where: 'id = ?',
        whereArgs: [vehicles.id]);
  }
}
