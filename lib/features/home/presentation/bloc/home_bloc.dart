import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mega_mall/features/home/domain/entities/product_entity.dart';

import 'package:mega_mall/features/home/domain/usecases/get_all_product_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  GetAllProductsUseCase allProducts;
  HomeBloc({
    required this.allProducts,
  }) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      if (event is GetAllProductEvent) {
        print("4512");

        emit(GetAllProductLoadingState());
        final failureOrData = await allProducts();
        failureOrData.fold((error) {
          emit(GetAllProductErrorState(error: error.toString()));
        }, (products) {
          emit(GetAllProductSuccessState(products: products));
          print(products.length);
        });
      }
    });
  }
}
