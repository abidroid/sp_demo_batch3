import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sp_demo_batch3/db/db_helper.dart';
import 'package:sp_demo_batch3/model/student.dart';

class UpdateStudentScreen extends StatefulWidget {
  final Student student;
  const UpdateStudentScreen({super.key, required this.student});

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
  void initState() {
    super.initState();
    nameC.text = widget.student.name;
    courseC.text = widget.student.course;
    mobileC.text = widget.student.mobile;
    totalFeeC.text = widget.student.totalFee.toString();
    feePaidC.text = widget.student.feePaid.toString();
  }

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
                  onPressed: () async {
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
                      id: widget.student.id,
                      name: name,
                      course: course,
                      mobile: mobile,
                      totalFee: int.parse(totalFee),
                      feePaid: int.parse(feePaid),
                    );

                    // DBHelper
                    // function update

                    int result = await DatabaseHelper.instance.updateStudent(s);

                    if( result > 0){
                      Fluttertoast.showToast(msg: 'Updated');
                      Navigator.of(context).pop(true);
                    }
                    else{
                      Fluttertoast.showToast(msg: 'Failed');
                    }
                  },
                  child: const Text('Update')),

            ],
          ),
        ),
      ),
    );
  }
}
