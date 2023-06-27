class SignResModel {
  int? status;
  dynamic id;
  String? message;

  SignResModel({
    this.status,
    this.id,
    this.message,
  });

  SignResModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    id = json["id"];
    message = json["message"];
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "id": id,
        "message": message,
      };
}
