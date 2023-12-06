import 'package:carousel_slider/carousel_controller.dart';
import 'package:ecommerce_training/core/controllers/ProductCubit/product_cubit.dart';
import 'package:ecommerce_training/core/managers/nav.dart';
import 'package:ecommerce_training/models/product_model.dart';
import 'package:ecommerce_training/screens/modules/prducts_screen.dart';
import 'package:ecommerce_training/screens/widgets/Components/components.dart';
import 'package:ecommerce_training/screens/widgets/Widgets/Buttom/button.dart';
import 'package:ecommerce_training/screens/widgets/Widgets/Text/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
class ProductDetailsScreen extends StatelessWidget {
  Product?details;
   ProductDetailsScreen({super.key,required this.details});
  CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocConsumer<ProductCubit, ProductState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    var cubit = ProductCubit.get(context);
    return Scaffold(
      backgroundColor: HexColor("EFF3FF"),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title:Text('Details'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {navigateAndFinishThisScreen(context, ProductScreen());},),

      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height*0.5,
                width: width,
                child: BuildSlider(
                    width: width,
                    height: height,
                    carouselController: carouselController,
                    length: details!.images!.length,
                    cubit: cubit,
                    items: details!.images!,
                ),
                ),
              Row(
                children: [
                  BuildText(
                    text:'${details!.price!.toString()}\$',
                    color: Colors.black,
                    bold: true,
                    size: 25,
                  ),
                  Spacer(),
                  Container(
                    height: height*0.05,
                    width: height*0.08,
                    decoration: BoxDecoration(
                      color: HexColor('FE798C'),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Center(
                      child: BuildText(
                        text: '4.5',
                        color: Colors.white,
                        bold: true,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height:height *0.03,),
              BuildText(
                  text: details!.name!,
                  color: Colors.black,
                bold: true,
              ),
              SizedBox(height: height*0.01,),
              BuildText(
                text: "Status: ${details!.status!}",
                color: Colors.black,
                bold: true,
              ),
              SizedBox(height: height*0.01,),
              BuildText(
                text: details!.description!,
                color: Colors.grey,
                bold: true,
              ),
              SizedBox(height: height*0.03,),
              BuildButton(
                  height: height*0.1,
                  width: width,
                  text: 'ADD TO CART',
                  function: (){},
              ),
            ],
          ),
        ),
      ),
    );
  },
);
  }
}
