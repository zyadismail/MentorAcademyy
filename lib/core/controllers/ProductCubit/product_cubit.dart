import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../models/product_model.dart';
import '../../network/constant.dart';
import '../../network/remote/dio_helper.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());
  static ProductCubit get(context) => BlocProvider.of(context);
  LaptopsModel? laptopsModel;
  int currentIndexslider = 0;
  void changeIndexSlider(int index){
    currentIndexslider = index;
    emit(ChangeIndexSlider());
  }
  void getHomeProducts(){
    emit(LoadingFetchProducts());
    DioHelperStore.getData(url:ApiConstants.homeApi).then((value){
      laptopsModel = LaptopsModel.fromJson(value.data);
      print(laptopsModel!.product!.length);
      emit(FetchProducts());
    }).catchError((error){
      print(error.toString());
      emit(ErrorFetchProducts());
    });
  }
}
