import 'dart:developer';
import 'package:daraz_app/features/home/model/all_product_list_response.dart';
import 'package:dio/dio.dart';
import '../../../networks/dio/dio.dart';
import '/networks/endpoints.dart';

class GetAllProductApi {
  static final GetAllProductApi _singleton = GetAllProductApi._internal();
  GetAllProductApi._internal();
  static GetAllProductApi get instance => _singleton;

  Future<List<GetAllProductListResposne>> getAllProduct() async {
    try {
      // Make request
      Response response = await getHttp(Endpoints.products());

      if (response.statusCode == 200) {
        final data = response.data as List;
        return data
            .map((json) => GetAllProductListResposne.fromJson(json))
            .toList();
      } else {
        throw Exception("Failed to load products");
      }
    } catch (e) {
      log("Error in API: $e");
      rethrow;
    }
  }
}