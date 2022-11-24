import 'dart:async';
import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fashion_mobile_app/app/constants.dart';
import 'package:fashion_mobile_app/app/di.dart';
import 'package:fashion_mobile_app/domain/models/models.dart';
import 'package:fashion_mobile_app/domain/usecases/getItems_usecase.dart';
import 'package:fashion_mobile_app/presentation/items_details/item_details.dart';
import 'package:fashion_mobile_app/presentation/resources/color_manager.dart';
import 'package:fashion_mobile_app/presentation/resources/icon_broken.dart';
import 'package:fashion_mobile_app/presentation/resources/provider.dart';
import 'package:fashion_mobile_app/presentation/resources/routes_manager.dart';
import 'package:fashion_mobile_app/presentation/resources/string_manager.dart';
import 'package:fashion_mobile_app/presentation/resources/values_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:riverpod/riverpod.dart';
class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final getItemsUseCase _getItem = instance<getItemsUseCase>();

  List<String> categories = [AppStrings.newIn,AppStrings.clothing,AppStrings.boss,AppStrings.other];

  int currentIndex = 0 ;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(
            height: AppSize.s1_5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              iconWidget(IconBroken.Scan),
              Container(
                padding: EdgeInsets.all(AppPadding.p05),
                height: AppSize.s60,
                decoration: BoxDecoration(
                    border: Border.all(color: ColorManager.lightGrey,width: AppSize.s1_5),
                    color: ColorManager.white,
                    borderRadius: BorderRadius.circular(AppSize.s10)
                ),
                child: ToggleSwitch(
                  initialLabelIndex: 0,
                  totalSwitches: 2,
                  activeBgColor: [
                    ColorManager.black,
                    ColorManager.black
                  ],
                  inactiveBgColor: ColorManager.white,
                  labels: [AppStrings.man, AppStrings.woman],
                  onToggle: (index) {
                    print('switched to: $index');
                  },
                ),
              ),
              iconWidget(IconBroken.Search),
            ],
          ),
          const SizedBox(
            height: AppSize.s20,
          ),
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppPadding.p10),
                child: Container(
                  width: double.infinity,
                  height: AppSize.s160,
                  decoration: BoxDecoration(
                    color: Colors.red,
                      borderRadius: BorderRadius.circular(AppSize.s20),
                  ),
                  child: ClipRRect(
                    borderRadius:BorderRadius.circular(AppSize.s20) ,
                    child: CachedNetworkImage(
                      fit: BoxFit.fill,
                      imageUrl: Constants.dashboardImage,
                      progressIndicatorBuilder: (context,url,downlaodProgress) =>
                          Center(child: CircularProgressIndicator(value:downlaodProgress.progress)),
                      errorWidget: (context,url,error)=>Icon(IconBroken.Danger),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: AppPadding.p40,top: AppPadding.p20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppStrings.homeStackTitle,
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.displayLarge
                    ),
                    const SizedBox(
                      height: AppSize.s10,
                    ),
                    ElevatedButton(
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorManager.orange
                        ),
                        child: const Text(AppStrings.shopNow)
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: AppSize.s20,
          ),
          Container(
            padding: EdgeInsets.only(left: AppPadding.p10),
            height: AppSize.s50,
            child: ListView.separated(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index)=>
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    child: Container(
                      width: AppSize.s120,
                      padding: EdgeInsets.symmetric(horizontal: AppSize.s10),
                      decoration: BoxDecoration(
                          color: currentIndex == index ? ColorManager.black: ColorManager.white,
                          border: Border.all(color: ColorManager.lightGrey,width:AppSize.s02 ),
                          borderRadius: BorderRadius.circular(AppSize.s10)
                      ),
                      child: Center(
                          child: Text(
                            categories[index],
                            style: TextStyle(
                              color:currentIndex == index ? ColorManager.white: ColorManager.black,
                            ),
                          )
                      ),
                    ),
                  ),
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: AppSize.s10,
                );
              },
            ),
          ),
          const SizedBox(
            height: AppSize.s20,
          ),
          ItemList(),
        ],
      ),
    );
  }


  Widget iconWidget(IconData icon) {
    return Container(
              width: AppSize.s60,
              height: AppSize.s60,
              decoration: BoxDecoration(
                border:Border.all(color: ColorManager.lightGrey,width:AppSize.s1_5 ),
                color:ColorManager.white,
                borderRadius: BorderRadius.circular(AppSize.s20)
              ),
              child: Icon(icon,
                size: AppSize.s30,
                color: ColorManager.lightBlack,
              ),
            );
  }
}

class ItemList extends ConsumerWidget {

  @override
  Widget build(BuildContext context, ref) {
    final itemApiProvider = ref.watch(itemDataProvider);
    return itemApiProvider.when(
        data: (data){
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p10),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: AppPadding.p20,
                mainAxisSpacing: AppPadding.p20,
                children: List.generate(data.getOrElse(()=>[]).length, (index) {
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ItemDetails(item:data.getOrElse(()=>[])[index])));
                    },
                      child: CardItem(item :data.getOrElse(()=>[])[index],index: index)
                  );
                })
              ),
            ),
          );
        },
        error: (failure,_){
          print(failure.toString());
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content:Text("Sending confirmation code"),
              duration: Duration(seconds: 2),
            ),
          );
          return Container();
        },
        loading: ()=> CircularProgressIndicator()
    );
  }
}

class CardItem extends StatelessWidget {
  final Item item ;
  final int index;
  const CardItem({required this.item, required this.index});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s10),

          ),
          child: Center(
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl: item.image,
              progressIndicatorBuilder: (context,url,downlaodProgress) =>
              Center(child: CircularProgressIndicator(value:downlaodProgress.progress)),
              errorWidget: (context,url,error)=>Icon(IconBroken.Danger),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: AppPadding.p20,bottom:AppPadding.p30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSize.s10),
                    color: index % 2 == 0 ? ColorManager.orange : ColorManager.violet
                ),
                width:index % 2 == 0 ? AppSize.s60 : AppSize.s80,
                height: 30,
                child: Center(child: Text(
                    index % 2 == 0 ? AppStrings.newWord : AppStrings.sale_40,
                  style:Theme.of(context).textTheme.displaySmall ,
                )),
              ),
              SizedBox(
                height: AppSize.s10,
              ),
              Text("\$ ${item.price}",
                style: Theme.of(context).textTheme.displayMedium,
              ),
              Text(
                  item.description.toUpperCase(),
                style: Theme.of(context).textTheme.displayMedium,
                overflow: TextOverflow.ellipsis,
              ),

            ],
          ),
        ),
      ],
    );
  }
}