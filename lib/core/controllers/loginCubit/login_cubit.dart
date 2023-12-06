import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../models/user_model.dart';
import '../../network/constant.dart';
import '../../network/remote/dio_helper.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);

  UserModel?userModel;
  void PostLogin({required email,required password}){
    emit(LoadingLogin());
    DioHelperStore.postData(url:ApiConstants.loginApi, data:{
      "email":email,
      "password":password,
    }).then((value){
      userModel = UserModel.fromJson(value.data);
      print(userModel!.user!.name!);
      emit(LoginDone(userModel!));
    }).catchError((error){
      print(error.toString());
      emit(LoginError());
    });
  }

}
