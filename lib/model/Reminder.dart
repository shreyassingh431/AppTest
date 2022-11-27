
class Reminder {
  int? id;
  String? name, description, date, time;
  String? imgPath;

  Reminder({
    this.id,
    this.name,
    this.description,
    this.date,
    this.time,
    this.imgPath,
  });

  Reminder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    date = json['date'];
    time = json['time'];
    imgPath = json['imgPath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['date'] = this.date;
    data['time'] = this.time;
    data['imgPath'] = this.imgPath;
    return data;
  }
}
