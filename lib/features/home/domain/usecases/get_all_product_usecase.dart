import 'package:dartz/dartz.dart';
import 'package:mega_mall/config/Network/failure.dart';
import 'package:mega_mall/features/home/domain/entities/product_entity.dart';
import 'package:mega_mall/features/home/domain/repositories/products_repo.dart';

class GetAllProductsUseCase {
  ProductsRepo productsRepo;
  GetAllProductsUseCase({
    required this.productsRepo,
  });

  Future<Either<Failure, List<ProductEntity>>> call() async {
    return await productsRepo.getAllProducts();
  }
}
