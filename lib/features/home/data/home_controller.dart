import 'package:get/get.dart';
import 'package:daraz_app/networks/api_acess.dart';
import '../model/all_product_list_response.dart';

class HomeController extends GetxController {

  var isLoading = true.obs;
  var products = <GetAllProductListResposne>[].obs;
  var categories = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadProducts();
  }

  Future<void> loadProducts() async {
    isLoading.value = true;

    await getAllProductRx.getAllProduct();
    products.value = getAllProductRx.dataFetcher.valueOrNull ?? [];

    // Dynamic category extract
    final tempCategories = <String>{"All"};
    for (var p in products) {
      if (p.category != null) {
        tempCategories.add(p.category!);
      }
    }

    categories.value = tempCategories.toList();
    isLoading.value = false;
  }

  Future<void> refresh() async {
    await loadProducts();
  }

  List<GetAllProductListResposne> filterProducts(String category) {
    if (category == "All") return products;
    return products
        .where((p) =>
            p.category != null &&
            p.category!.toLowerCase() == category.toLowerCase())
        .toList();
  }
}