import 'package:bloc/bloc.dart';
import 'package:creativa_second/models/oneproduct_repo.dart';
import 'package:creativa_second/repository/oneproduct_repository.dart';
import 'package:meta/meta.dart';

part 'cubit_product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  void getSingleProduct(int productId) async {
    final productData = await OneRepository().getSingleProduct(productId);
    emit(GetProductSuccess(productData));
  }
}
