import 'package:shop_app/src/core/tools/file_importers.dart';

enum StorageKeys {
  languageCode('languageCode'),
  isLogin('isLogin'),
  address('address'),
  userId('userId');

  const StorageKeys(this.key);
  final String key;
}

late final SharedPreferences $storage;
late final Database $database;

class DBService {
  static Future<void> initialize() async {
    $storage = await SharedPreferences.getInstance();
    $database = await openDatabase(
        join(await getDatabasesPath(), 'app_database.db'),
        onCreate: (db, version) => _createTables(db),
        version: 1);
  }

  static Future<void> _createTables(Database db) async {
    await db.execute(
      'CREATE TABLE ${StorageKeys.address.key}('
      'id INTEGER PRIMARY KEY AUTOINCREMENT,'
      'latitude REAL,'
      'longitude REAL,'
      'address TEXT,'
      'name TEXT,'
      'homeNumber TEXT,'
      'flatNumber TEXT,'
      'intercomCode TEXT,'
      'additionalPhoneNumber TEXT,'
      'comment TEXT)',
    );
  }

  static void insertLocation(LocationModel location) async {
    await $database.insert('locations', location.toJson());
  }

  static Future<List<LocationModel>> getAllLocations() async {
    final List<Map<String, dynamic>> maps =
        await $database.query(StorageKeys.address.key);
    return List.generate(maps.length, (index) {
      return LocationModel.fromJson(maps[index]);
    });
  }

  static void updateLocation(LocationModel location) async {
    await $database.update(
      StorageKeys.address.key,
      location.toJson(),
      where: 'id = ?',
      whereArgs: [location.id],
    );
  }

  static void deleteLocation(int id) async {
    await $database.delete(
      StorageKeys.address.key,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  static String get userId {
    return $storage.getString(StorageKeys.userId.name) ?? '';
  }

  static set userId(String id) {
    $storage.setString(StorageKeys.userId.name, id);
  }

  static bool get isLogin {
    return $storage.getBool(StorageKeys.isLogin.name) ?? false;
  }

  static set isLogin(bool value) {
    $storage.setBool(StorageKeys.isLogin.name, value);
  }

  static String get languageCode {
    return $storage.getString(StorageKeys.languageCode.name) ?? 'ru';
  }

  static set languageCode(String value) {
    $storage.setString(StorageKeys.languageCode.name, value);
  }
}
