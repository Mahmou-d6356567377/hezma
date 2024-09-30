import 'dart:convert';
import 'package:hezma/UI/presentation/Views/my_account_screans/addresses_screan/widgets/districtModel.dart';
import 'package:http/http.dart' as http;

class DistrictService {
  final String apiUrl = "https://hezma-traning.eltamiuz.net/api/v1/districts";

  Future<List<ModelOfDistractis>> fetchDistricts() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['status']) {
        List<dynamic> body = jsonResponse['data'];
        List<ModelOfDistractis> districts = body
            .map((dynamic item) => ModelOfDistractis.fromJson(item))
            .toList();
        return districts;
      } else {
        throw Exception('Failed to load districts');
      }
    } else {
      throw Exception('Failed to load districts');
    }
  }
}