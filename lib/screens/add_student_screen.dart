import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sp_demo_batch3/db/db_helper.dart';
import 'package:sp_demo_batch3/model/student.dart';
import 'package:sp_demo_batch3/screens/student_list_screen.dart';

class AddStudentScreen extends StatefulWidget {
  const AddStudentScreen({super.key});

  @override
  State<AddStudentScreen> createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  var nameC = TextEditingController();
  var courseC = TextEditingController();
  var mobileC = TextEditingController();
  var totalFeeC = TextEditingController();
  var feePaidC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Student'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 16.0, // flutter 3.27
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: nameC,
                decoration: InputDecoration(
                  hintText: "Name",
                  border: OutlineInputBorder(),
                ),
              ),
              TextField(
                controller: courseC,
                decoration: InputDecoration(
                  hintText: "Course",
                  border: OutlineInputBorder(),
                ),
              ),
              TextField(
                controller: mobileC,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: "Mobile",
                  border: OutlineInputBorder(),
                ),
              ),
              TextField(
                controller: totalFeeC,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Total Fee",
                  border: OutlineInputBorder(),
                ),
              ),
              TextField(
                controller: feePaidC,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Fee Paid",
                  border: OutlineInputBorder(),
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    String? name = nameC.text.trim();
                    String course = courseC.text.trim();
                    String mobile = mobileC.text.trim();
                    String totalFee = totalFeeC.text.trim();
                    String feePaid = feePaidC.text.trim();

                    // front end validation
                    if( name.isEmpty){
                      print('Please provide name');
                      Fluttertoast.showToast(msg: "Name required");
                      return;
                    }

                    // DB ka kaam yaha nahe karengay

                    Student s = Student(
                      name: name,
                      course: course,
                      mobile: mobile,
                      totalFee: int.parse(totalFee),
                      feePaid: int.parse(feePaid),
                    );

                    // DBHelper
                    // function saveStudent

                    int result = await DatabaseHelper.instance.saveStudent(s);

                    if( result > 0 ){
                      Fluttertoast.showToast(msg: 'Saved');
                    }else{
                      Fluttertoast.showToast(msg: 'Failed');
                    }

                    },
                  child: const Text('Save')),
              ElevatedButton(onPressed: () {

                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return StudentListScreen();
                }));
              }, child: const Text('Show All')),
            ],
          ),
        ),
      ),
    );
  }
}
