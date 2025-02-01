import 'dart:convert';

import 'package:ygo_box_pricer/ygo_set.dart';
import 'package:http/http.dart' as http;

class YgoPriceServices {
  static Future<YgoSetData?> getSetData(String setName) async {
    if (setName.isEmpty) {
      return null;
    }
    var endPoint = "http://yugiohprices.com/api/set_data/";

    var headers = {
      'Content-Type': 'application/json',
    };

    var response =
        await http.get(Uri.parse(endPoint + setName), headers: headers);

    if (response.statusCode == 200) {
      var data = YgoSetData.fromJson(jsonDecode(response.body));
      return data;
    } else {
      print(
          'Failed to load set data ${response.statusCode} \n ${response.body}');
      return null;
    }
  }
}
