import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class TaskHelper {
  static final TaskHelper _instance = TaskHelper.internal();

  factory TaskHelper() => _instance;

  TaskHelper.internal();

  Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await initDb();
      return _db;
    }
  }

  Future<Database> initDb() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, "to_do.db");

    return openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
      await db.execute("CREATE TABLE task("
          "id INTEGER PRIMARY KEY, "
          "title TEXT, "
          "desc TEXT, "
          "isDone INTEGER)");
    });
  }
}
