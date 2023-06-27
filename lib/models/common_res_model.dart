class CommonResModel {
  int? status;
  String? message;

  CommonResModel({
    this.status,
    this.message,
  });

  CommonResModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
