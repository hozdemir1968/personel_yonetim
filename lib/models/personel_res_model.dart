import 'dart:convert';

PersonelResModel personelResModelFromJson(String str) =>
    PersonelResModel.fromJson(json.decode(str));

String personelResModelToJson(PersonelResModel data) => json.encode(data.toJson());

class PersonelResModel {
  int? status;
  List<Message>? message;

  PersonelResModel({
    this.status,
    this.message,
  });

  factory PersonelResModel.fromJson(Map<String, dynamic> json) => PersonelResModel(
        status: json["status"],
        message: json["message"] == null
            ? []
            : List<Message>.from(json["message"]!.map((x) => Message.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message":
            message == null ? [] : List<dynamic>.from(message!.map((x) => x.toJson())),
      };
}

class Message {
  int? id;
  String? name;
  String? surname;
  String? citizenNo;
  String? gender;
  String? phone;
  String? email;
  DateTime? birthDate;
  DateTime? employmentDate;
  dynamic dismissalDate;
  String? sgkType;
  String? department;
  String? duty;
  String? iban;

  Message({
    this.id,
    this.name,
    this.surname,
    this.citizenNo,
    this.gender,
    this.phone,
    this.email,
    this.birthDate,
    this.employmentDate,
    this.dismissalDate,
    this.sgkType,
    this.department,
    this.duty,
    this.iban,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        id: json["id"],
        name: json["name"],
        surname: json["surname"],
        citizenNo: json["citizenNo"],
        gender: json["gender"],
        phone: json["phone"],
        email: json["email"],
        birthDate: json["birthDate"] == null ? null : DateTime.parse(json["birthDate"]),
        employmentDate: json["employmentDate"] == null
            ? null
            : DateTime.parse(json["employmentDate"]),
        dismissalDate: json["dismissalDate"],
        sgkType: json["sgkType"],
        department: json["department"],
        duty: json["duty"],
        iban: json["iban"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "surname": surname,
        "citizenNo": citizenNo,
        "gender": gender,
        "phone": phone,
        "email": email,
        "birthDate":
            "${birthDate!.year.toString().padLeft(4, '0')}-${birthDate!.month.toString().padLeft(2, '0')}-${birthDate!.day.toString().padLeft(2, '0')}",
        "employmentDate":
            "${employmentDate!.year.toString().padLeft(4, '0')}-${employmentDate!.month.toString().padLeft(2, '0')}-${employmentDate!.day.toString().padLeft(2, '0')}",
        "dismissalDate": dismissalDate,
        "sgkType": sgkType,
        "department": department,
        "duty": duty,
        "iban": iban,
      };
}
