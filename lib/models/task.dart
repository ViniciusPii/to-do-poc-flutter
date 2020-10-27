class Task {
  int id;
  String title;
  String desc;
  bool isDone;

  Task({
    this.id,
    this.title,
    this.desc,
    this.isDone,
  });

  factory Task.fromMap(Map<String, dynamic> json) => new Task(
        id: json["id"],
        title: json["title"],
        desc: json["desc"],
        isDone: json["isDone"],
      );

  Map<String, dynamic> toMap() =>
      {"id": id, "title": title, "desc": desc, "isDone": isDone};
}
