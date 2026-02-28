import 'dart:developer';
import 'package:rxdart/rxdart.dart';
import '../model/all_product_list_response.dart';
import 'api.dart';

class GetAllProductRx {
  final dataFetcher = BehaviorSubject<List<GetAllProductListResposne>>();

  Stream<List<GetAllProductListResposne>> get stream => dataFetcher.stream;

  Future<void> getAllProduct() async {
    try {
      final data = await GetAllProductApi.instance.getAllProduct();
      dataFetcher.sink.add(data);
      log("Products fetched: ${data.length}");
    } catch (e) {
      log("Error fetching products: $e");
      dataFetcher.sink.addError(e);
    }
  }
}

