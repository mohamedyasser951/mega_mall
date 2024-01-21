import 'package:dartz/dartz.dart';
import 'package:mega_mall/config/Network/failure.dart';
import 'package:mega_mall/features/home/domain/entities/product_entity.dart';

abstract class ProductsRepo {
  Future<Either<Failure,List<ProductEntity>>> getAllProducts();
}
