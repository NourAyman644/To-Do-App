import 'package:sqflite/sqflite.dart';
import 'package:to_do_app/features/Task/data/models/Task_Model.dart';

class SqfliteHelper {
  late Database db;

// create database
// create t able
//crud operation

//init database
  void initDb() async {
    //create database
    await openDatabase(
      'Tasks.db',
      version: 1,
      onCreate: (Database db, int v) async {
        // create table
        await db
            .execute('''CREATE TABLE Tasks(id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT, 
    note TEXT,
    date TEXT,
    startTime TEXT,
    endTime TEXT,
    color INTEGER,
    Complete INTEGER
 
     )
        
        ''').then((value) => print('create successfully'));
      },
      onOpen: (db) => print('Database opened'),
    ).then((value) => db = value).catchError((e) {
      print(e.toString());
    });
  }

  //get
  Future<List<Map<String, Object?>>> getFromDB() async {
    return await db.rawQuery('SELECT * FROM Tasks');
  }

  // insert
  Future<int> insertToDB(TaskModel model) async {
    return await db.rawInsert('''
     INSERT INTO Tasks(
    title, 
    note ,
    date ,
    startTime ,
    endTime ,
    color ,
    Complete ) VALUES('${model.title}', '${model.note}', '${model.date}','${model.startTime}',
   ' ${model.endTime}','${model.color}','${model.isCompleted}')     
      ''');
  }

  //delete
  Future<int> DeleteFromDB(int id) async {
    return await db.rawDelete('''
    DELETE FROM Tasks WHERE id = ?
 ''', [id]);
  }

  // update
  Future<int> UpdateDB(int id) async {
    return await db.rawUpdate('''
    UPDATE Tasks
    SET Complete = ?
    WHERE id = ?
   ''', [1, id]);
  }
}
