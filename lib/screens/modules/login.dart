import 'package:ecommerce_training/core/controllers/loginCubit/login_cubit.dart';
import 'package:ecommerce_training/core/controllers/register_cubit/register_cubit.dart';
import 'package:ecommerce_training/core/controllers/register_cubit/register_states.dart';
import 'package:ecommerce_training/core/managers/nav.dart';
import 'package:ecommerce_training/core/managers/values.dart';
import 'package:ecommerce_training/core/network/local/cache_helper.dart';
import 'package:ecommerce_training/screens/modules/home_screen.dart';
import 'package:ecommerce_training/screens/modules/login.dart';
import 'package:ecommerce_training/screens/modules/register.dart';
import 'package:ecommerce_training/screens/widgets/botton.dart';
import 'package:ecommerce_training/screens/widgets/text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class LoginScreen extends StatelessWidget{
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit,LoginState>(listener:(context,state) {
      if (state is LoginDone) {
        if (state.userModel.status == "success") {
          print(state.userModel.message);
          //showToast(state.userModel.message!, ToastStates.SUCCESS);
          print(state.userModel.user!.token);
          CacheHelper.saveData(
              key: 'userId', value: state.userModel.user!.nationalId)
              .then((value) {
            natoinalId = state.userModel.user!.nationalId;
          });
          CacheHelper.saveData(
            key: 'token',
            value: state.userModel.user!.token,
          ).then((value) {
            token = state.userModel.user!.token!;
            navigateAndFinishThisScreen(
              context,
               HomeScreen(),
            );
          });
        } else {
          print(state.userModel.message);
        }
      }
    },
      builder:(context,state){
        var cubit = LoginCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Login',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),
                      SizedBox(
                        height: 100,
                      ),
                      DefaultFieldForm(
                        labelStyle: TextStyle(color:Colors.black),
                        controller: emailController,
                        keyboard: TextInputType.emailAddress,
                        valid: (value) {
                          if (value.isEmpty) {
                            return 'Please Enter your Email';
                          }
                          return null;
                        },
                        label: 'Email Address',
                        prefix: Icons.email,
                        hint: 'Email Address',
                        hintStyle: const TextStyle(color: Colors.grey),
                        show: false,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      DefaultFieldForm(
                        labelStyle: TextStyle(color:Colors.black),
                        controller: passwordController,
                        keyboard: TextInputType.visiblePassword,
                        valid: (value) {
                          if (value.isEmpty) {
                            return 'Please Enter Your Password';
                          }
                          return null;
                        },
                        label: 'Password',
                        prefix: Icons.password,
                        hint: 'Password',
                        hintStyle: const TextStyle(color: Colors.grey),
                        show: false,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(height: 10,),
                      DefaultButton(
                          backgroundColor:Colors.black,
                          borderColor: Colors.transparent,
                          buttonWidget: const Text(
                            'Login in',
                            style: TextStyle(color: Colors.white),
                          ),
                          function: () {
                            if (formKey.currentState!.validate()) {
                              cubit.PostLogin(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            }
                          }
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Text("Don't have an account?",style: TextStyle(color: Colors.black),),
                          TextButton(onPressed: (){
                            navigateAndFinishThisScreen(context, RegisterScreen());
                          }, child: Text('Sign Up')),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },);
  }
}
