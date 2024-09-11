import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rest_full_api/model/cat_model.dart';

Future<List<CatImage>> fetchCatImages() async {
  final response = await http.get(
    Uri.parse(
        'https://api.thecatapi.com/v1/images/search?limit=10&breed_ids=beng&api_key=live_3lQ39SfpUk3zeFzBo8B8DoDKON1Hqtx06RdKF3FcodTEWp2EoPfMOkPE6hC3FLkh'),
  );

  if (response.statusCode == 200) {
    List<dynamic> jsonData = jsonDecode(response.body);
    return jsonData.map((json) => CatImage.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load cat images');
  }
}
