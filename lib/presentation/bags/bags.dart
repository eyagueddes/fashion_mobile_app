import 'package:fashion_mobile_app/app/constants.dart';
import 'package:fashion_mobile_app/domain/models/models.dart';
import 'package:fashion_mobile_app/presentation/main/main.dart';
import 'package:fashion_mobile_app/presentation/resources/color_manager.dart';
import 'package:fashion_mobile_app/presentation/resources/font_manager.dart';
import 'package:fashion_mobile_app/presentation/resources/icon_broken.dart';
import 'package:fashion_mobile_app/presentation/resources/string_manager.dart';
import 'package:fashion_mobile_app/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class Bags extends StatelessWidget {
  final Item item ;

  const Bags({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        elevation: AppSize.s0,
        leading: IconButton(
          icon: Icon(IconBroken.Arrow___Left,color: ColorManager.black),
          onPressed: () {
            Navigator.of(context).pop();
          }
        ),
        centerTitle: true,
        title: Text(AppStrings.receipt,
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
            color: ColorManager.black
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            SizedBox(
              height: AppSize.s60,
            ),
            Container(
              height: AppSize.s60,
              width: AppSize.s120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s05),
                color: ColorManager.pink,
              ),
              child: Center(
                child: Text(
                  AppStrings.klarna,
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      height: AppSize.s1,
                    color: ColorManager.black,
                    fontSize: FontSize.s24
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            SizedBox(
              height: AppSize.s60,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppStrings.subtotal,
                    style:Theme.of(context).textTheme.displaySmall?.copyWith(
                        height: AppSize.s1,
                        color: ColorManager.black,
                        fontWeight: FontWeight.w500

                    ),
                  ),
                  Text("\$ ${item.price.toString()}",
                    style:Theme.of(context).textTheme.displaySmall?.copyWith(
                        height: AppSize.s1,
                        color: ColorManager.black,
                        fontWeight: FontWeight.w500

                    ),
                  ),

                ],
              ),

            ),
            SizedBox(height: AppSize.s20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppStrings.shipmentService,
                    style:Theme.of(context).textTheme.displaySmall?.copyWith(
                        height: AppSize.s1,
                        color: ColorManager.black,
                        fontWeight: FontWeight.w500

                    ),
                  ),
                  Text("\$ ${Constants.zeroDouble}",
                    style:Theme.of(context).textTheme.displaySmall?.copyWith(
                        height: AppSize.s1,
                        color: ColorManager.black,
                        fontWeight: FontWeight.w500

                    ),
                  ),

                ],
              ),

            ),
            SizedBox(height: AppSize.s20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppStrings.discount,
                    style:Theme.of(context).textTheme.displaySmall?.copyWith(
                        height: AppSize.s1,
                        color: ColorManager.black,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  Text("-\$ ${Constants.zeroDouble}",
                    style:Theme.of(context).textTheme.displaySmall?.copyWith(
                        height: AppSize.s1,
                        color: ColorManager.orange,
                        fontWeight: FontWeight.w500

                    ),
                  ),

                ],
              ),

            ),
            SizedBox(height: AppSize.s20),
             Padding(
              padding: EdgeInsets.symmetric(horizontal: AppPadding.p20),
              child: Divider(
                color:ColorManager.lightBlack,
                height:AppSize.s0_5,
              ),
            ),
            SizedBox(height: AppSize.s30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppStrings.totalPayment,
                    style:Theme.of(context).textTheme.displaySmall?.copyWith(
                        height: AppSize.s1,
                        color: ColorManager.black,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  Text("-\$ ${item.price.toString()}",
                    style:Theme.of(context).textTheme.displayLarge?.copyWith(
                        height: AppSize.s1,
                        color: ColorManager.black,
                    ),
                  ),

                ],
              ),

            ),
          ],
        ),
      ),
      bottomNavigationBar:Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20,vertical: AppPadding.p10),
        child: Container(
          width: double.infinity,
          height: AppSize.s60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s10),
            color: ColorManager.black,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(AppStrings.payNow,
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeightManager.medium,
                ),
              )
            ],
          ),
        ),
      ) ,
    );
  }
}
