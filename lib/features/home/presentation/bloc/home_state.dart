part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class GetAllProductLoadingState extends HomeState {}

class GetAllProductSuccessState extends HomeState {
  final List<ProductEntity> products;
  const GetAllProductSuccessState({
    required this.products,
  });
}

class GetAllProductErrorState extends HomeState {
  final String error;

  const GetAllProductErrorState({required this.error});
}
