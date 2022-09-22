import 'dart:convert';

import 'package:arm_product/app/models/ProductDetailsModel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../services/api_service.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final ApiServices apiServices;
  ProductDetailsCubit({required this.apiServices})
      : super(ProductDetailsInitial());

  Future<void> fetchProductDetails({
    String? slug,
  }) async {
    emit(ProductDetailsLoading());
    // try {
    final resonseData = await apiServices.getProductBySlug(
      slugValue: slug,
    );

    final Map<String, dynamic> parsed = json.decode(utf8.decode(resonseData));

    var dataProductDetails =
        ProductDetailsModel.fromJson(jsonDecode(jsonEncode(parsed)));

    print(dataProductDetails);
    emit(ProductDetailsLoaded(
      productDetails: dataProductDetails,
    ));
    // }
    //  catch (err) {
    //   if (kDebugMode) {
    //     print("Error :$err");
    //   }
    // }
  }
}
