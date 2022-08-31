import 'package:climb_app_base/data/list_places_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

const String tablePlace = 'Places';

class AppDatabasePlaces {
  static final AppDatabasePlaces instance = AppDatabasePlaces._init();

  static Database? _database;

  AppDatabasePlaces._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('app.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const namePlace = 'Text';
    const nameCity = 'Text';
    const distance = 'double';
    const lat = 'double';
    const lng = 'double';

    await db.execute('''
CREATE TABLE $tablePlace ( 
  ${PlacesModel.id} $idType, 
  ${PlacesModel.name} $namePlace;
  ${PlacesModel.city} $nameCity;
  ${PlacesModel.km} $distance;
  ${PlacesModel.lt} $lat;
  ${PlacesModel.lg} $lng;
  )
''');
  }
}
