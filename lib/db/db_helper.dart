import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../model/student.dart';

class DatabaseHelper {


  // database
  // singleton
  DatabaseHelper._privateConstructor(); // Name constructor to create instance of database
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // private
  static Database? _database;

  // getter for database

  Future<Database> get database async {
    _database ??= await initializeDatabase();
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    // Get the directory path for both Android and iOS
    // to store database

    Directory directory = await getApplicationDocumentsDirectory();
    String path = '${directory.path}/akti3.db'; // database name

    // open/ create database at a given path
    var studentsDatabase = await openDatabase(
      path,
      version: 1,
      onCreate: _createDb,
    );

    return studentsDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute('''Create TABLE tbl_student (
                  id INTEGER PRIMARY KEY AUTOINCREMENT,
                  name TEXT NOT NULL,
                  course TEXT,
                  mobile TEXT,
                  totalFee INTEGER,
                  feePaid INTEGER
                   );
        ''');
  }

  // function

  Future<int> saveStudent( Student s) async {

      // get a reference to the database
    Database db = await this.database;

    // String insertQuery = '''
    // INSERT INTO tbl_student ( name, course, mobile, totalFee, feePaid )
    // VALUES (?, ?, ?, ?, ?)
    // ''';
    // int result = await db.rawInsert(insertQuery, [s.name, s.course, s.mobile, s.totalFee, s.feePaid]);

    // helper function
    int result = await db.insert('tbl_student', s.toMap());
    return result;
  }

  Future<List<Student>> getAllStudents() async {
    Database db = await this.database;

    List<Map<String, dynamic>>  listOfStudentMaps = await db.rawQuery("SELECT * from tbl_student");

    List<Student> students = [];
    // logic to convert student map to student object

    for( var map in listOfStudentMaps){

      Student s = Student.fromMap(map);

      students.add(s);
    }

    // await Future.delayed(Duration(seconds: 2));

    return students;
  }

  Future<int> deleteStudent(Student s) async {

    Database db = await this.database;

    int result = await db.rawDelete("DELETE from tbl_student where id=?", [s.id] );

    return result;
  }

  // update record
  Future<int> updateStudent(Student s) async {

    Database db = await this.database;

    int result = await db.update('tbl_student', s.toMap(), where: "id=?", whereArgs: [s.id]);

    return result;
  }

}