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

  // converts map to object
  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id'],
      name: map['name'],
      course: map['course'],
      mobile: map['mobile'],
      totalFee: map['totalFee'],
      feePaid: map['feePaid'],
    );
  }

  // converts object to map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'course': course,
      'mobile': mobile,
      'totalFee': totalFee,
      'feePaid': feePaid,
    };
  }
}
