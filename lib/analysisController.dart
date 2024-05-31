import 'dart:convert';

import 'package:flusk_app/AnalysisResponseModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AnalysisController extends GetxController{
  var responseModel = AnalysisResponseModel().obs;
  var selectedAnalysis = Analysis().obs;

  Future<void> fetchData() async {
    await Future.delayed(Duration(seconds: 2));
    final response = await http.get(Uri.parse('http://10.0.2.2:5000/api/getData'));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      responseModel.value = AnalysisResponseModel.fromJson(jsonData);
    } else {
      throw Exception('Failed to load data');
    }
  }
}