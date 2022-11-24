import 'package:cached_network_image/cached_network_image.dart';
import 'package:fashion_mobile_app/domain/models/models.dart';
import 'package:fashion_mobile_app/presentation/bags/bags.dart';
import 'package:fashion_mobile_app/presentation/resources/color_manager.dart';
import 'package:fashion_mobile_app/presentation/resources/font_manager.dart';
import 'package:fashion_mobile_app/presentation/resources/icon_broken.dart';
import 'package:fashion_mobile_app/presentation/resources/string_manager.dart';
import 'package:flutter/material.dart';

import '../resources/values_manager.dart';

class ItemDetails extends StatefulWidget {
  final Item item ;
  const ItemDetails({ required this.item}) ;

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {

  int currentIndex = 0;
  List<String> categories = [AppStrings.newIn,AppStrings.clothing,AppStrings.boss,AppStrings.other];
  List<Color> colors = [ColorManager.orange,ColorManager.black,ColorManager.violet,ColorManager.orange];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(

                children: [
                  Container(
                    height: MediaQuery.of(context).size.height*0.55,
                    child: PageView.builder(
                      onPageChanged: (int index){
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      scrollDirection: Axis.horizontal,
                        itemCount:4,
                        itemBuilder: (context,index){

                      return Container(
                        height: MediaQuery.of(context).size.height*0.55,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.teal,
                        child: CachedNetworkImage(
                          fit: BoxFit.fill,
                          imageUrl: widget.item.image,
                          progressIndicatorBuilder: (context,url,downlaodProgress) =>
                              Center(child: CircularProgressIndicator(value:downlaodProgress.progress)),
                          errorWidget: (context,url,error)=>Icon(IconBroken.Danger),
                        ),
                      );

                      }

                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: AppPadding.p40),
                            child: Container(
                              height: AppSize.s45,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color:ColorManager.transaprentWhite,
                                borderRadius: BorderRadius.circular(AppSize.s10)
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: AppPadding.p10),
                                    child: Container(
                                      height: AppSize.s30,
                                      width: AppSize.s60,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(AppSize.s05),
                                        color: ColorManager.pink,
                                      ),
                                      child: Center(
                                        child: Text(
                                          AppStrings.klarna,
                                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                            height: AppSize.s1
                                          ),
                                          textAlign: TextAlign.justify,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: AppSize.s10),
                                  Text(
                                    AppStrings.textDesc,
                                    style:Theme.of(context).textTheme.titleMedium?.copyWith(
                                        height: AppSize.s1,
                                        fontSize: FontSize.s14
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: AppSize.s20,
                          ),
                          Container(
                            height: AppSize.s05,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.separated(

                                shrinkWrap: true,
                                padding: EdgeInsets.symmetric(horizontal: AppPadding.p40),
                                itemBuilder: (context,index){

                                  return Container(
                                    height: AppSize.s05,
                                    width: AppSize.s80,
                                    color: currentIndex == index ? ColorManager.black : ColorManager.white,
                                  );
                                },
                                separatorBuilder: (context,index){
                                  return SizedBox(
                                    width: 5,
                                  );
                                },
                                itemCount: 4,
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                          SizedBox(
                            height: AppSize.s20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: AppPadding.p10),
                    child: IconButton(onPressed: (){
                      Navigator.pop(context);
                    },
                        icon: Icon(IconBroken.Arrow___Left)
                    ),
                  )
                ],
              ),
              SizedBox(height: AppSize.s20),
              Padding(
                padding: const EdgeInsets.only(left: AppPadding.p20),
                child: Text("\$ ${widget.item.price}",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: FontSize.s20,
                    fontWeight: FontWeightManager.medium
                  ),
                ),
              ),
              SizedBox(height: AppSize.s10),
              Padding(
                padding: const EdgeInsets.only(left: AppPadding.p20),
                child: Text("${widget.item.title}".toUpperCase(),
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: ColorManager.black
                  ),
                ),
              ),
              SizedBox(height: AppSize.s10),
              Container(
                padding: EdgeInsets.only(left: AppPadding.p10),
                height: AppSize.s45,
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
                              color: colors[index],
                              borderRadius: BorderRadius.circular(AppSize.s10)
                          ),
                          child: Center(
                              child: Text(
                                categories[index],
                                style: TextStyle(
                                  color:ColorManager.white,
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
              SizedBox(height: AppSize.s10),
              Padding(
                padding: const EdgeInsets.only(left: AppPadding.p20),
                child: Text(AppStrings.detail,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: FontSize.s18,
                      fontWeight: FontWeightManager.semiBold
                  ),
                ),
              ),
              SizedBox(height: AppSize.s10),
              Padding(
                padding: const EdgeInsets.only(left: AppPadding.p20),
                child: Text(widget.item.description,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: FontSize.s16,
                      fontWeight: FontWeightManager.medium
                  ),
                ),
              ),
              SizedBox(height: AppSize.s10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Bags(item: widget.item)));
                  },
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
                        Icon(IconBroken.Bag,color: ColorManager.white),
                        SizedBox(width: AppPadding.p10),
                        Text(AppStrings.addToShopping,
                          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            fontWeight: FontWeightManager.medium,
                            fontSize: FontSize.s18
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: AppSize.s10),
            ],
          ),
        )
      ),
    );
  }
}
