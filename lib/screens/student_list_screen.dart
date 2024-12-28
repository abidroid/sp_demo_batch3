import 'package:flutter/material.dart';
import 'package:sp_demo_batch3/db/db_helper.dart';

class StudentListScreen extends StatefulWidget {
  const StudentListScreen({super.key});

  @override
  State<StudentListScreen> createState() => _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen> {


  rawakhla() async {
    DatabaseHelper.instance.getAllStudents();
  }

  @override
  Widget build(BuildContext context) {

    rawakhla();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Students List'),
      ),

      body: const Placeholder(),
    );
  }
}
