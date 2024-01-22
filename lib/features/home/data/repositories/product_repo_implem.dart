import 'package:dartz/dartz.dart';
import 'package:mega_mall/config/Network/exception.dart';
import 'package:mega_mall/config/Network/failure.dart';
import 'package:mega_mall/features/home/data/datasources/remote_data_source.dart';
import 'package:mega_mall/features/home/domain/entities/product_entity.dart';
import 'package:mega_mall/features/home/domain/repositories/products_repo.dart';

class ProductsRepoImplem implements ProductsRepo {
  final RemoteDataSource remoteDataSource;

  ProductsRepoImplem({required this.remoteDataSource});
  @override
  Future<Either<Failure, List<ProductEntity>>> getAllProducts() async {
    try {
      final remoteProducts = await remoteDataSource.getAllProducts();
      return Right(remoteProducts);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
