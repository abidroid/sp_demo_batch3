import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sp_demo_batch3/db/db_helper.dart';
import 'package:sp_demo_batch3/model/student.dart';
import 'package:sp_demo_batch3/screens/update_student_screen.dart';

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
                            Text(students[index].id.toString()),
                            Text(students[index].name),
                            Text(students[index].course),
                            Text(students[index].mobile),
                            Text(students[index].totalFee.toString()),
                            Text(students[index].feePaid.toString()),
                            Row(
                              spacing: 10,
                              children: [
                                Expanded(child: ElevatedButton(onPressed: (){
                                  // alert dialog

                                  showDialog(context: context, builder: (context){
                                    return AlertDialog(
                                      title: Text('Confirmation!!!'),
                                      content: Row(
                                        spacing: 10,
                                        children: [
                                          Icon(Icons.delete, color: Colors.red,),
                                          Text('Are you sure to delete ?'),
                                        ],
                                      ),

                                      actions: [
                                        TextButton(onPressed: (){
                                          Navigator.pop(context);
                                        }, child: const Text('No')),
                                        TextButton(onPressed: () async {
                                          Navigator.pop(context);

                                          // delete logic here

                                          int result = await DatabaseHelper.instance.deleteStudent(students[index]);

                                          if( result > 0){
                                            Fluttertoast.showToast(msg: 'Deleted');
                                            setState(() {

                                            });
                                          }
                                          else{
                                            Fluttertoast.showToast(msg: 'Failed');
                                          }

                                        }, child: const Text('Yes')),

                                      ],

                                    );
                                  });

                                }, child: const Text('Delete'))),
                                Expanded(child: ElevatedButton(onPressed: () async{

                                  bool? updated = await Navigator.of(context).push(MaterialPageRoute(builder: (context){
                                    return UpdateStudentScreen(student: students[index],);
                                  }));

                                  if( updated != null && updated){
                                    setState(() {

                                    });
                                  }

                                }, child: const Text('Update')))
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
