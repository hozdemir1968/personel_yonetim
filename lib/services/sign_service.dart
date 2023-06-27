import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../configs/statics.dart';
import '../models/sign_req_model.dart';
import '../models/sign_res_model.dart';

class SignService extends GetConnect {
  Future<SignResModel?> signup(SignReqModel signReqModel) async {
    Map<String, String> reqHeaders = {"Content-Type": "application/json; charset=UTF-8"};
    final response = await http.post(
      Uri.parse(userUrl + signupPath),
      headers: reqHeaders,
      body: jsonEncode(signReqModel),
    );
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      return SignResModel.fromJson(result);
    } else {
      throw ('Bir sorun oluştu ${response.statusCode}');
    }
  }

  Future<SignResModel?> signin(SignReqModel signReqModel) async {
    Map<String, String> reqHeaders = {"Content-Type": "application/json; charset=UTF-8"};
    final response = await http.post(
      Uri.parse(userUrl + signinPath),
      headers: reqHeaders,
      body: jsonEncode(signReqModel),
    );
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      return SignResModel.fromJson(result);
    } else {
      throw ('Bir sorun oluştu ${response.statusCode}');
    }
  }
}
