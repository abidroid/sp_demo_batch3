class Student {
  int? id;
  String name;
  String course;
  String mobile;
  int totalFee;
  int feePaid;

  Student({
    this.id,
    required this.name,
    required this.course,
    required this.mobile,
    required this.totalFee,
    required this.feePaid,
  });

  Map<String, dynamic> toMap() {

    return {
      'id': id,
      'name': name,
      'course': course,
      'mobile':mobile,
      'totalFee': totalFee,
      'feePaid': feePaid,
    };
  }
}
