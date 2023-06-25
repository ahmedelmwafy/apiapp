class EventsModel {
  bool? status;
  String? message;
  Result? result;
  int? errorCode;

  EventsModel({this.status, this.message, this.result, this.errorCode});

  EventsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    result =
        json['result'] != null ? Result.fromJson(json['result']) : null;
    errorCode = json['errorCode'];
  }
}

class Result {
  List<Data>? data;

  Result({this.data, });

  Result.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }
}

class Data {
  int? id;
  String? title;
  String? image;
  String? bio;
  String? content;
  String? startAt;
  String? endAt;
  String? address;
  String? reservation;
  String? status;
  List<Sessions>? sessions;
  
  List<void>? files;

  Data(
      {this.id,
      this.title,
      this.image,
      this.bio,
      this.content,
      this.startAt,
      this.endAt,
      this.address,
      this.reservation,
      this.status,
      this.sessions,
      this.files});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    bio = json['bio'];
    content = json['content'];
    startAt = json['start_at'];
    endAt = json['end_at'];
    address = json['address'];
    reservation = json['reservation'];
    status = json['status'];
    if (json['sessions'] != null) {
      sessions = <Sessions>[];
      json['sessions'].forEach((v) {
        sessions!.add(Sessions.fromJson(v));
      });
    }
  }
}

class Sessions {
  int? id;
  String? title;
  Speaker? speaker;
  String? image;
  String? content;
  String? startAt;
  String? endAt;
  String? timeStartAt;
  String? timeEndAt;
  String? dateStartAt;
  String? dateEndAt;

  Sessions({
    this.id,
    this.title,
    this.speaker,
    this.image,
    this.content,
    this.startAt,
    this.endAt,
    this.timeStartAt,
    this.timeEndAt,
    this.dateStartAt,
    this.dateEndAt,
  });

  Sessions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    speaker =
        json['speaker'] != null ? Speaker.fromJson(json['speaker']) : null;
    image = json['image'];
    content = json['content'];
    startAt = json['start_at'];
    endAt = json['end_at'];
    timeStartAt = json['time_start_at'];
    timeEndAt = json['time_end_at'];
    dateStartAt = json['date_start_at'];
    dateEndAt = json['date_end_at'];
    if (json['speakers'] != null) {}
  }
}

class Speaker {
  int? id;
  String? photo;
  String? name;
  String? company;
  String? about;

  Speaker({this.id, this.photo, this.name, this.company, this.about});

  Speaker.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    photo = json['photo'];
    name = json['name'];
    company = json['company'];
    about = json['about'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['photo'] = photo;
    data['name'] = name;
    data['company'] = company;
    data['about'] = about;
    return data;
  }
}


class Type {
  int? id;
  String? name;

  Type({this.id, this.name});

  Type.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

