

class Post {
  int id;
  String salary;
  String age;
  String name;



  Post({this.id, this.salary, this.age, this.name});

  Post.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        age = json['age'],
        salary = json['salary'],
        name = json['name'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'age': age,
    'salary': salary,
    'name': name,
  };
}