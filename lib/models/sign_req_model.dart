class SignReqModel {
  String? name;
  String? email;
  String? pass;

  SignReqModel({
    this.name,
    this.email,
    this.pass,
  });

  SignReqModel.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    email = json["email"];
    pass = json["pass"];
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "pass": pass,
      };
}
