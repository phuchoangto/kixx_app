import 'faculty_model.dart';

class Event {
  int? id;
  String? name;
  String? description;
  String? start;
  String? end;
  String? imageUrl;
  int? facultyId;
  Faculty? faculty;

  Event(
      {this.id,
      this.name,
      this.description,
      this.start,
      this.end,
      this.imageUrl,
      this.facultyId,
      this.faculty});

  Event.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    start = json['start'];
    end = json['end'];
    imageUrl = json['imageUrl'];
    facultyId = json['facultyId'];
    faculty =
        json['faculty'] != null ? new Faculty.fromJson(json['faculty']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['start'] = this.start;
    data['end'] = this.end;
    data['imageUrl'] = this.imageUrl;
    data['facultyId'] = this.facultyId;
    if (this.faculty != null) {
      data['faculty'] = this.faculty!.toJson();
    }
    return data;
  }
}
