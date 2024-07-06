import 'dart:convert';

import 'package:adv_flutter_exam_1/screens/controller/apiservice.dart';
import 'package:flutter/material.dart';

import '../../model/modelclass.dart';

class ApiProvider extends ChangeNotifier {
  Recipes? recipes;
  bool isLoading = false;
  int index = 0;

  Future<void> fetchData() async {
    isLoading = true;
    notifyListeners();

    String? jsonData = await ApiService.apiService.getData();
    if (jsonData != null) {
      Map dataList = jsonDecode(jsonData);
      recipes = Recipes.fromJson(dataList);
    }

    isLoading = false;
    notifyListeners();
  }
  void onChangeIndex(index){
    this.index = index;
    notifyListeners();
  }
  ApiProvider() {
    fetchData();
  }
}
