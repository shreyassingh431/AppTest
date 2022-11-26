import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:textrade/model/Reminder.dart';

class DBHelper {
  static const _databaseName = 'reminder.db';
  static const _reminder_table = 'reminder_table';
  static const _databaseVersion = 1;
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDB();
    return _database!;
  }

  _initDB() async {
    String path = join(await getDatabasesPath(), _databaseName);

    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  _onCreate(Database db, int version) async {
    await db.execute('CREATE TABLE $_reminder_table('
        'id INTEGER PRIMARY KEY AUTOINCREMENT, name STRING, description STRING, date STRING, time STRING,  imgPath STRING, isCompleted INTEGER'
        ')');
  }

  Future<int> insertTask(Reminder reminder) async {
    Database? db = await DBHelper._database;
    return await db!.insert(_reminder_table, {
      'name': reminder.name,
      'description': reminder.description,
      'date': reminder.date,
      'time': reminder.time,
      'imgPath': reminder.imgPath,
    });
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database? db = await DBHelper._database;
    return await db!.query(_reminder_table);
  }

  Future<int> delete(int id) async {
    Database? db = await DBHelper._database;
    return await db!.delete(_reminder_table, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteAllReminder() async {
    Database? db = await DBHelper._database;
    return await db!.delete(_reminder_table);
  }

  // Future<int> update(int id)async{
  //   return await _database!.rawUpdate('''
  //   UPDATE $_reminder_table
  //   SET isCompleted = ?, color = ?
  //   WHERE id = ?
  //   ''',[1, 1, id]);
  // }

}
