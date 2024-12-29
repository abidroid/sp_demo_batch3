import 'package:flutter/material.dart';
import 'package:sp_demo_batch3/db/db_helper.dart';
import 'package:sp_demo_batch3/model/student.dart';

class StudentListScreen extends StatefulWidget {
  const StudentListScreen({super.key});

  @override
  State<StudentListScreen> createState() => _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Students List'),
      ),
      body: FutureBuilder<List<Student>>(
          future: DatabaseHelper.instance.getAllStudents(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Student> students = snapshot.data!;

              return ListView.builder(
                  itemCount: students.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
                      color: Colors.amber,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          spacing: 10,
                          children: [
                            Text(students[index].name),
                            Text(students[index].course),
                            Text(students[index].mobile),
                            Text(students[index].totalFee.toString()),
                            Text(students[index].feePaid.toString()),
                            Row(
                              spacing: 10,
                              children: [
                                Expanded(child: ElevatedButton(onPressed: (){}, child: const Text('Delete'))),
                                Expanded(child: ElevatedButton(onPressed: (){}, child: const Text('Update')))
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
