part of 'product_cubit.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}

class LoadingFetchProducts extends ProductState{}
class FetchProducts extends ProductState{}
class ErrorFetchProducts extends ProductState{}
class ChangeIndexSlider extends ProductState{}