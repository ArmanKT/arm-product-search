import 'dart:convert';

import 'package:arm_product/app/services/api_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/SearchProductModel.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ApiServices apiServices;

  ProductsCubit({required this.apiServices}) : super(ProductFetchInitial());

  Future<void> fetchProductApi({String? searchData, String? url = ''}) async {
    emit(ProductFetchLoading());
    try {
      final resonseData =
          await apiServices.getProducts(searchValue: searchData, pageUrl: url);

      final Map<String, dynamic> parsed = json.decode(utf8.decode(resonseData));

      var dataProductLIst =
          parseProducts(jsonEncode(parsed['data']['products']['results']));

      emit(ProductFetchLoaded(postList: dataProductLIst, pagination: [
        '${parsed['data']['products']['next']}',
        '${parsed['data']['products']['previous']}'
      ]));
    } catch (err) {
      if (kDebugMode) {
        print("Error :$err");
      }
    }
  }
}
