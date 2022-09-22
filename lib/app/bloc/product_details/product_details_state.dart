part of 'product_details_cubit.dart';

abstract class ProductDetailsState extends Equatable {
  const ProductDetailsState();

  @override
  List<Object> get props => [];
}

class ProductDetailsInitial extends ProductDetailsState {}

class ProductDetailsLoading extends ProductDetailsState {}

class ProductDetailsLoaded extends ProductDetailsState {
  final ProductDetailsModel productDetails;

  final List? pagination;

  const ProductDetailsLoaded({
    required this.productDetails,
    this.pagination,
  });

  @override
  List<Object> get props => [productDetails];
}

class ProductDetailsError extends ProductDetailsState {}
