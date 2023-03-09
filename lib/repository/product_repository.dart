import 'package:creativa_second/models/product_repo.dart';
import 'package:dio/dio.dart';

class ProductRepository{
  Future<List<CategoryProduct>> getProducts() async{
    final response = await Dio().get('https://dummyjson.com/products/');

    print('response.data : ${response.data}');
    final categoryProducts = CategoryProducts.fromJson(response.data);

    return categoryProducts.products;
  }
}
