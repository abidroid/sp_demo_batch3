import 'package:flutter/material.dart';
import 'package:sp_demo_batch3/model/student.dart';

class UpdateStudentScreen extends StatefulWidget {
  const UpdateStudentScreen({super.key});

  @override
  State<UpdateStudentScreen> createState() => _UpdateStudentScreenState();
}

class _UpdateStudentScreenState extends State<UpdateStudentScreen> {
  var nameC = TextEditingController();
  var courseC = TextEditingController();
  var mobileC = TextEditingController();
  var totalFeeC = TextEditingController();
  var feePaidC = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Student'),
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
                  onPressed: () {
                    String name = nameC.text.trim();
                    String course = courseC.text.trim();
                    String mobile = mobileC.text.trim();
                    String totalFee = totalFeeC.text.trim();
                    String feePaid = feePaidC.text.trim();

                    // validation
                    if( name.isEmpty){
                      print('Please provide name');
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

                    //DbHelper().saveStudent(s);
                  },
                  child: const Text('Update')),

            ],
          ),
        ),
      ),
    );
  }
}
