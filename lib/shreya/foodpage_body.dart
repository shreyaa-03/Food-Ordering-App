import 'package:canteen_app/models/submenu.dart';
import 'package:canteen_app/screens/home/widgets/submenu_homepage.dart';
import 'package:canteen_app/searchpanel/searchPanel.dart';
import 'package:canteen_app/shreya/popular_food_details.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../constants/big_text.dart';
import '../constants/colors.dart';
import '../constants/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //slider section
        Container(
          height: 320,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              }),
        ),
        new DotsIndicator(
          dotsCount: 5,
          position: _currPageValue,
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeColor: Color(0xFF9294cc),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
        SizedBox(
          height: 25,
        ),
        //Popular text
        Container(
          margin: EdgeInsets.only(
            left: 30,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Popular"),
              SizedBox(
                width: 10,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 1),
                child: BigText(
                  text: ".",
                  size: 25,
                  color: Colors.black26,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 1),
                child: SmallText(
                  text: "food menu",
                  color: Colors.black26,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) {
              final subMenu = SubMenu.generatesSubMenu();
              return Container(
                margin: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: 10,
                ),
                child: Row(
                  children: [
                    Container(
                      height: 110,
                      width: 110,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white38,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(subMenu.imageurl))),
                    ),
                    Expanded(
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 10, top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BigText(
                                text: subMenu.name,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SmallText(text: subMenu.desc),
                              SizedBox(
                                height: 10,
                              ),
                              Row(crossAxisAlignment: CrossAxisAlignment.start,
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SubMenuHomePage()));
                                      },
                                      child: Container(
                                          width: 60,
                                          height: 25,
                                          // margin: EdgeInsets.only(left: 75, top: 10),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Color.fromARGB(
                                                255, 161, 230, 210),
                                          ),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 8,
                                              ),
                                              Center(
                                                child: SmallText(
                                                  text: "View",
                                                  color: Colors.white,
                                                  size: 18,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              // Icon(
                                              //   Icons.add,
                                              //   color: AppColors.iconColor1,
                                              // ),
                                            ],
                                          )),
                                    )
                                  ])
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            }),
        //list of food and images
      ],
    );
  }

  Widget _buildPageItem(int index) {
    return Stack(
      children: [
        Container(
          height: 220,
          margin: EdgeInsets.only(left: 5, right: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/paneer-butter.jpg")),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 125,
            margin: EdgeInsets.only(left: 35, right: 35, bottom: 25),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFe8e8e8), //color of shadow
                    // spreadRadius: 1, //spread radius
                    blurRadius: 5.0, // blur radius
                    offset: Offset(0, 5),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, 0),
                  )
                ]),
            child: Container(
              padding: EdgeInsets.only(top: 10, left: 35, right: 35),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BigText(
                      text: "Jeera Rice & Chass",
                      crossAxisAlignment: CrossAxisAlignment.center,
                    ),
                    SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SmallText(
                          text: "₹120",
                          size: 19,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  width: 80,
                                  height: 35,
                                  // margin: EdgeInsets.only(left: 75, top: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Color(0xFF9294cc),
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PopularFoodDetail()));
                                    },
                                    child: Container(
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 8,
                                          ),
                                          SmallText(
                                            text: "view",
                                            color: Colors.white,
                                            size: 18,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Icon(
                                            Icons.food_bank,
                                            size: 22,
                                            color: AppColors.iconColor1,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ))
                            ])
                      ],
                    )
                  ]),
            ),
          ),
        )
      ],
    );
  }
}
