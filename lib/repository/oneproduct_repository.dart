import 'package:creativa_second/models/oneproduct_repo.dart';
import 'package:dio/dio.dart';
class OneRepository {
  Future<ProductOne> getSingleProduct(int productId) async {
    final response =
    await Dio().get('https://dummyjson.com/products/$productId');

    final product = ProductOne.fromJson(response.data);

    return product;
  }
}