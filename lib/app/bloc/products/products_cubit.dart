import 'dart:convert';

import 'package:arm_product/app/services/api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/SearchProductModel.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ApiServices apiServices;

  ProductsCubit({required this.apiServices}) : super(ProductFetchInitial());

  Future<void> fetchPostApi({String? searchData}) async {
    emit(ProductFetchLoading());
    try {
      final resonseData =
          await apiServices.getProducts(searchValue: searchData);

      final Map<String, dynamic> parsed = json.decode(utf8.decode(resonseData));

      var dataProductLIst =
          parseProducts(jsonEncode(parsed['data']['products']['results']));

      emit(ProductFetchLoaded(postList: dataProductLIst));
      // }
      // catch (err) {
      // emit(PostFetchError(failure: err));
      // }
    } catch (err) {
      print("Error :$err");
    }
  }
}
