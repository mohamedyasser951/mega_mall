import 'package:dio/dio.dart';
import 'package:mega_mall/config/Network/exception.dart';

import 'package:mega_mall/features/home/data/models/product_model.dart';

abstract class RemoteDataSource {
  Future<List<ProductModel>> getAllProducts();
}

class RemoteDataSourceImplement implements RemoteDataSource {
  Dio dio;
  String basicUrl = "https://fakestoreapi.com/";
  RemoteDataSourceImplement({
    required this.dio,
  });
  @override
  Future<List<ProductModel>> getAllProducts() async {
    final response = await dio.get('${basicUrl}products');
    if (response.statusCode == 200) {
      final List productsData = response.data as List;
      List<ProductModel> products = productsData
          .map((product) => ProductModel.fromJson(product))
          .toList();

      return products;
    } else {
      throw ServerException();
    }
  }
}
