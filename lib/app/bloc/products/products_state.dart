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

  const ProductFetchLoaded({
    required this.postList,
  });

  @override
  List<Object> get props => [...postList];
}

class ProductFetchError extends ProductsState {}
