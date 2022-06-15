import 'dart:convert';

import 'package:app/model/model.dart';
import 'package:http/http.dart' as http;

List<ProductModel> list = [];
late ProductModel model;

getData() async {
  var response = await http.get(Uri.parse(
      "https://picsum.photos/v2/list?fbclid=IwAR2qk2kE60PcFr1S3OdDKwH9v6bhfWzmIaByJTvViW2iVnLMtDC4Lg7IyeI"));
  print(response.body);

  if (response.statusCode == 200) {
    print("data get success");
  } else {
    print("data get fail");
  }
  var data = jsonDecode(response.body);
  for (var item in data) {
    model = ProductModel.fromJson(item);
    list.add(model);
  }

  return list;
}
