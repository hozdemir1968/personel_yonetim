import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../configs/statics.dart';
import '../models/common_res_model.dart';
import '../models/personel_req_model.dart';
import '../models/personel_res_model.dart';

class PersonelService extends GetConnect {
  Future<List<Message>> getPersonels(String token) async {
    Map<String, String> reqHeaders = {
      "Content-Type": "application/json; charset=UTF-8",
      'Authorization': token,
    };
    final response = await http.get(
      Uri.parse(personelUrl + personelGetallPath),
      headers: reqHeaders,
    );
    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      final result2 = json.decode(json.encode(result['message']));
      final result3 = result2.map<Message>((e) => Message.fromJson(e)).toList();
      return result3;
    } else {
      throw ('Bir sorun oluştu: ${response.statusCode}');
    }
  }

  Future<CommonResModel> addPersonel(
      PersonelReqModel personelReqModel, String token) async {
    Map<String, String> reqHeaders = {
      "Content-Type": "application/json; charset=UTF-8",
      'Authorization': token,
    };
    final response = await http.post(
      Uri.parse(personelUrl + personelAddPath),
      headers: reqHeaders,
      body: jsonEncode(personelReqModel),
    );
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      return CommonResModel.fromJson(result);
    } else {
      throw ('Bir sorun oluştu ${response.statusCode}');
    }
  }
}
