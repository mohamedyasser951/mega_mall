import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_mall/config/theme.dart';
import 'package:mega_mall/features/home/data/datasources/remote_data_source.dart';
import 'package:mega_mall/features/home/data/repositories/product_repo_implem.dart';
import 'package:mega_mall/features/home/domain/usecases/get_all_product_usecase.dart';
import 'package:mega_mall/features/home/presentation/bloc/home_bloc.dart';
import 'package:mega_mall/features/home/presentation/pages/home.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create: (context) => HomeBloc(
              allProducts: GetAllProductsUseCase(
                  productsRepo: ProductsRepoImplem(
                      remoteDataSource: RemoteDataSourceImplement(dio: Dio()))))
            ..add(GetAllProductEvent()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        home: const HomePage(),
      ),
    );
  }
}
