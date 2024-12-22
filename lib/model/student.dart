class Student {
  int? rollNo;
  String name;
  String course;
  String mobile;
  int totalFee;
  int feePaid;

  Student({
    this.rollNo,
    required this.name,
    required this.course,
    required this.mobile,
    required this.totalFee,
    required this.feePaid,
  });
}
