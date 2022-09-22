import 'package:http/http.dart' as http;

class ApiServices {
  // Rice
  // pulses

  getProducts({String? searchValue = '', String? pageUrl = ''}) async {
    String baseUrl;
    if (pageUrl == '') {
      baseUrl =
          "https://panel.supplyline.network/api/product/search-suggestions/?format=json&limit=10&search=$searchValue";
    } else {
      baseUrl = pageUrl!;
    }

    final response = await http
        .get(Uri.parse(baseUrl), headers: {'Content-Type': 'application/json'});
    // print(response.body);
    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw Exception("Failed to load Products");
    }
  }

  getProductBySlug({
    String? slugValue = '',
  }) async {
    String baseUrl =
        "https://panel.supplyline.network/api/product-details/$slugValue/?format=json";

    final response = await http
        .get(Uri.parse(baseUrl), headers: {'Content-Type': 'application/json'});
    // print(response.body);
    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw Exception("Failed to load Products");
    }
  }
}
