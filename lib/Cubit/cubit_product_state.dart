part of 'cubit_product_cubit.dart';


@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class GetProductSuccess extends  ProductState {
  final ProductOne productOne;
  GetProductSuccess(this.productOne);
}
