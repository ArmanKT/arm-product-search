part of 'products_cubit.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

class ProductFetchInitial extends ProductsState {}

class ProductFetchLoading extends ProductsState {}

class ProductFetchLoaded extends ProductsState {
  final List<SearchProductModel> postList;
 
  final List? pagination;

  const ProductFetchLoaded({
    required this.postList,
     this.pagination,
  });

  @override
  List<Object> get props => [...postList];
}

class ProductFetchError extends ProductsState {}
