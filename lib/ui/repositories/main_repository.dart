import 'dart:convert';

import "package:flutter/services.dart" as svcString;
import 'package:sleep_baby/ui/models/res_category.dart';
import 'package:sleep_baby/ui/models/res_voice.dart';
import 'package:yaml/yaml.dart';

class MainRepository {

  
  Future<List<ResVoice>> getData(int categoryId) async {
    final data = await svcString.rootBundle.loadString('assets/data/data_set.yaml');
    var doc = loadYaml(data);

    var result = json.encode(doc);
    var pictures = (json.decode(result));

    var resp = (pictures["voices"] as List)
        .map((e) => ResVoice.fromJson(e))
        .where((element) => categoryId == 0 ? true : element.categoryId == categoryId)
        .toList();
    return resp;
  }

  Future<List<ResCategory>> getCategories() async {
    final data = await svcString.rootBundle.loadString('assets/data/category.yaml');
    var doc = loadYaml(data);

    var result = json.encode(doc);
    var pictures = (json.decode(result));

    var resp = (pictures["categories"] as List)
        .map((e) => ResCategory.fromJson(e))
        .toList();
    return resp;
  }
}
