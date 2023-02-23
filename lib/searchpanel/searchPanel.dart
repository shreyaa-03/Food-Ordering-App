import 'dart:ffi';
import 'dart:ui';

import 'package:canteen_app/constants/colors.dart';
import 'package:canteen_app/searchpanel/OnePageForAll.dart';
import 'package:canteen_app/searchpanel/OnePageForAllCategories.dart';
import 'package:canteen_app/searchpanel/cart.dart';
import 'package:flutter/material.dart';
import 'dart:collection';
import 'package:flutter/services.dart';

int n = 0; //provide indexing to give the appbar the title of categries
String namesOfCategories = ""; //to give the appbar title using the index
int noOfDishesOfCategories = 0; // to give the number of dishes in a category

class searchPanel extends StatefulWidget {
  const searchPanel({super.key});
  @override
  State<searchPanel> createState() => _searchPanelState();
}

// class Food1{
//   String nameClass="";
//   String priceClass="";
//   String descriptionClass="";
//   String timeClass="";
//   String imageurl="";

//   Food1 (this.nameClass,this.priceClass,this.descriptionClass,this.timeClass,this.imageurl){
//   nameClass="tea";
//   priceClass="15";
//   descriptionClass="very nice";
//   timeClass="5";
//   imageurl="fdfdsf";
//   }
// }

List alldishesOnSearch = [];
Map<String, int> dishforprices = {};
String price =
    ""; // when a dish is clicked from search and to display its price
String name =
    ""; // when a dish is clicked from search and to display its name on appbar
String nameforcat =
    ""; //to display name of individual dish on appbar when clicked from a category
String priceforcat =
    ""; //to display price of individual dish when clicked from a category
// List alldishes = [];
List dishesfordisplayCategory =
    []; //to show names of dishes for individual categories
List pricessfordisplayCategory =
    []; // to show prices of dishes for individual categories
Map<String, int> dishwithprices = {
  'tea!': 15,
  'coffee!': 19,
  'hot milk!': 26,
  'tea[half]!': 10,
  'tea[staff]!': 8,
  'samosa pav!': 20,
  'vada pav!': 20,
  'punjabi samosa[2 pcs]!': 37,
  'pav[single]!': 5,
  'butter pav!': 10,
  'batata vada[2 pcs]!': 32,
  'samosa usal[plate]!': 52,
  'vada usal[plate]': 47,
  'samosa usal[single]!': 26,
  'vada usal[single]!': 26,
  'vada samosa usal!': 52,
  'dahi samosa[single]!': 47,
  'usal pav!': 32,
  'misal pav!': 47,
  'bread pakoda!': 37,
  'idli sambar!': 37,
  'medu vada sambar!': 47,
  'idli vada sambar!': 47,
  'dahi idli!': 52,
  'butter idli!': 52,
  'idli fry!': 47,
  'dahi misal pav!': 63,
  'upma/poha!': 34,
  'single samosa/vada!': 18,
  'potato chips!': 47,
  'potato toast!': 47,
  'sabudana vada/khichdi!': 47,
  'alu jeera!': 47,
  'sada dosa!': 42,
  'butter sada dosa!': 58,
  'cheese sada dosa!': 73,
  'masala sada dosa!': 58,
  'cheese masala dosa!': 79,
  'mysore sada dosa!': 53,
  'mysore masala dosa!': 74,
  'cheese mysore sada dosa!': 79,
  'cheese mysore masala!': 94,
  'cheese sada dosa!': 47,
  'chinese dosa![noodles]': 79,
  'cheese chinese dosa!': 105,
  'sada uttappam!': 47,
  'butter sada uttappam!': 63,
  'cheese uttappam!': 84,
  'onion uttappam!': 53,
  'cheese onion uttappam!': 84,
  'masala uttappam!': 53,
  'cheese masala uttappam!': 84,
  'tomato uttappam!': 53,
  'cheese tomato uttappam!': 84,
  'four taste uttappam': 68,
  'tomato omlate!': 58,
  'bread butter!': 29,
  'toast bread butter!': 37,
  'veg sandwich!': 34,
  'veg cheese sandwich!': 84,
  'veg cheese toast sandwich!': 94,
  'only cheese sandwich!': 74,
  'tomato sandwich!': 34,
  'cheese club sandwich!': 105,
  'veg toast sandwich!': 58,
  'only cheese toast sandwich!': 89,
  'chinese toast sandwich': 63,
  'club sandwich!': 74,
  'cheese chinese toast sandwich!': 100,
  'veg grilled sandwich!': 79,
  'veg cheese grilled sandwich!': 100,
  'chinese grilled sandwich!': 79,
  'chinese Cheese grill sandwich!': 100,
  'bhel puri!': 37,
  'sev puri!': 37,
  'dahi potato puri!': 58,
  'bombay puri!': 63,
  'sukha bhel!': 38,
  'cheese bhel!': 79,
  'veg hakka noodles!': 84,
  'veg schezwan noodles!': 89,
  'veg singapore noodles!': 89,
  'veg manchow noodles!': 89,
  'veg manchurian noodles!': 94,
  'triple schezwan noodles': 94,
  'chineese bhel!': 73,
  'chineese cheese bhel!': 105,
  'veg fried rice!': 84,
  'veg schezwan rice!': 89,
  'veg singapore rice!': 89,
  'veg manchaow rice!': 89,
  'veg manchurian rice!': 94,
  'triple schezwan rice!': 94,
  'tomato rice[with dahi]!': 79,
  'l rice!': 63,
  'paneer chilly rice!': 115,
  'veg biryani rice!': 94,
  'paneer biryani rice!': 115,
  'veg manchurian!': 63,
  'veg chilly!': 63,
  'veg garlic!': 63,
  'paneer chilly[dry]!': 105,
  'idli chilly!': 63,
  'idli manchurian!': 63,
  'american choupsey!': 74,
  'schezwan choupsey!': 74,
  'chinese choupsey!': 74,
  'manchow soup!': 68,
  'tomato soup!': 68,
  'sweet corn soup!': 68,
  'chappati bhaji!': 58,
  'chappati paneer bhaji!': 74,
  'puri bhaji!': 58,
  'puri paneer bhaji!': 74,
  'potato bhaji!': 42,
  'paneer bhaji[full]!': 74,
  'sada bhaji[full]!': 53,
  'paneer bhaji[half]': 47,
  'sada bhaji[vati]': 37,
  'veg raita!': 32,
  'dahi[curd]!': 26,
  'puri[plate]!': 26,
  'single chappati!': 7,
  'dal fry!': 37,
  'lunch!': 74,
  'lunch with pulav!': 84,
  'lunch with jeera rice!': 84,
  'dal rice!': 42,
  'dal fry rice!': 68,
  'dal rice with Bhaji!': 63,
  'plain dahi rice!': 63,
  'dahi masala rice!': 74,
  'jeera rice with sambhar!': 63,
  'jeera rice with bhaji!': 73,
  'jeera rice with paneer bhaji!': 84,
  'pulav rice with paneer sambhar!': 73,
  'jeera rice with dal fry!': 79,
  'pulav rice with sada bhaji!': 79,
  'pulav rice with paneer bhaji!': 84,
  'pulav rice with dal fry!': 73,
  'jeera rice with raita!': 84,
  'masala rice with sambhar!': 73,
  'masala rice with raita!': 84,
  'masala rice with bhaji!': 84,
  'masala rice with paneer bhaji!': 89,
  'pav bhaji!': 84,
  'jain pav bhaji!': 84,
  'cheese pav bhaji!': 115,
  'masasla pav!': 63,
  'cheese masasla pav!': 105,
  'jain cheese masasla Pav!': 110,
  'tava pulav!': 100,
  'paneer tava pulav!': 115,
  'extra cheese!': 35,
  'extra butter!': 30,
  'extra vati dal!': 20,
  'extra vati sambar!': 20,
  'extra chatni!': 15,
  'extra sauce!': 10,
};

class _searchPanelState extends State<searchPanel> {
  TextEditingController texteditcontroller = TextEditingController();
  String s = ""; // it takes the input from user for searching

  List alldishes = [
    'Tea!',
    'Coffee!',
    'Hot Milk!',
    'Tea[Half]!',
    'Tea[Staff]!',
    'Samosa Pav!',
    'Vada Pav!',
    'Punjabi Samosa[2 pcs]!',
    'Pav[Single]!',
    'Butter Pav!',
    'Batata Vada[2 pcs]!',
    'Samosa Usal[Plate]!',
    'Vada Usal[Plate]',
    'Samosa Usal[Single]!',
    'Vada Usal[Single]!',
    'Vada Samosa Usal!',
    'Dahi Samosa[Single]!',
    'Usal Pav!',
    'Misal Pav!',
    'Bread Pakoda!',
    'Idli Sambar!',
    'Medu Vada Sambar!',
    'Idli Vada Sambar!',
    'Dahi Idli!',
    'Butter Idli!',
    'Idli Fry!',
    'Dahi Misal Pav!',
    'Upma/Poha!',
    'Single Samosa/Vada!',
    'Potato Chips!',
    'Potato Toast!',
    'Sabudana Vada/Khichdi!',
    'Alu Jeera!',
    'Sada Dosa!',
    'Butter Sada Dosa!',
    'Cheese Sada Dosa!',
    'Masala Sada Dosa!',
    'Cheese Masala Dosa!',
    'Mysore Sada Dosa!',
    'Mysore Masala Dosa!',
    'Cheese Mysore Sada Dosa!',
    'Cheese Mysore Masala!',
    'Cheese Sada Dosa!',
    'Chinese Dosa![Noodles]',
    'Cheese Chinese Dosa!',
    'Sada Uttappam!',
    'Butter Sada Uttappam!',
    'Cheese Uttappam!',
    'Onion Uttappam!',
    'Cheese Onion Uttappam!',
    'masala Uttappam!',
    'Cheese masala Uttappam!',
    'Tomato Uttappam!',
    'Cheese Tomato Uttappam!',
    'Four Taste Uttappam',
    'Tomato Omlate!',
    'Bread Butter!',
    'Toast Bread Butter!',
    'Veg Sandwich!',
    'Veg Cheese Sandwich!',
    'Veg Cheese Toast Sandwich!',
    'Only Cheese Sandwich!',
    'Tomato Sandwich!',
    'Cheese Club Sandwich!',
    'Veg Toast Sandwich!',
    'Only Cheese Toast Sandwich!',
    'Chinese Toast Sandwich',
    'Club Sandwich!',
    'Cheese Chinese Toast Sandwich!',
    'Veg Grilled Sandwich!',
    'Veg Cheese Grilled Sandwich!',
    'Chinese Grilled Sandwich!',
    'Chinese Cheese Grill Sandwich!',
    'Bhel Puri!',
    'Sev Puri!',
    'Dahi Potato Puri!',
    'Bombay Puri!',
    'Sukha Bhel!',
    'Cheese Bhel!',
    'Veg Hakka Noodles!',
    'Veg Schezwan Noodles!',
    'Veg Singapore Noodles!',
    'Veg Manchow Noodles!',
    'Veg Manchurian Noodles!',
    'Triple Schezwan Noodles',
    'Chineese Bhel!',
    'Chineese Cheese Bhel!',
    'Veg Fried Rice!',
    'Veg Schezwan Rice!',
    'Veg Singapore Rice!',
    'Veg Manchaow Rice!',
    'Veg Manchurian Rice!',
    'Triple Schezwan Rice!',
    'Tomato Rice[With Dahi]!',
    'Lemon Rice!',
    'Paneer Chilly Rice!',
    'Veg Biryani Rice!',
    'Paneer Biryani Rice!',
    'Veg Manchurian!',
    'Veg Chilly!',
    'Veg Garlic!',
    'Paneer Chilly[Dry]!',
    'Idli Chilly!',
    'Idli Manchurian!',
    'American Choupsey!',
    'Schezwan Choupsey!',
    'Chinese Choupsey!',
    'Manchow Soup!',
    'Tomato Soup!',
    'Sweet Corn Soup!',
    'Chappati Bhaji!',
    'Chappati Paneer Bhaji!',
    'Puri Bhaji!',
    'Puri Paneer Bhaji!',
    'Potato Bhaji!',
    'Paneer Bhaji[Full]!',
    'Sada Bhaji[Full]!',
    'Paneer Bhaji[Half]',
    'Sada Bhaji[Vati]',
    'Veg Raita!',
    'Dahi[Curd]!',
    'Puri[Plate]!',
    'Single Chappati!',
    'Dal Fry!',
    'Lunch!',
    'Lunch With Pulav!',
    'Lunch With Jeera Rice!',
    'Dal Rice!',
    'Dal Fry Rice!',
    'Dal Rice With Bhaji!',
    'Plain Dahi Rice!',
    'Dahi Masala Rice!',
    'Jeera Rice With Sambhar!',
    'Jeera Rice With Bhaji!',
    'Jeera Rice With Paneer Bhaji!',
    'Pulav Rice With Paneer Sambhar!',
    'Jeera Rice With Dal Fry!',
    'Pulav Rice With Sada Bhaji!',
    'Pulav Rice With Paneer Bhaji!',
    'Pulav Rice With Dal Fry!',
    'Jeera Rice With Raita!',
    'Masala Rice With Sambhar!',
    'Masala Rice With Raita!',
    'Masala Rice With Bhaji!',
    'Masala Rice With Paneer Bhaji!',
    'Pav Bhaji!',
    'Jain Pav Bhaji!',
    'Cheese Pav Bhaji!',
    'Masasla Pav!',
    'Cheese Masasla Pav!',
    'Jain Cheese Masasla Pav!',
    'Tava Pulav!',
    'Paneer Tava Pulav!',
    'Extra Cheese!',
    'Extra Butter!',
    'Extra Vati Dal!',
    'Extra Vati Sambar!',
    'Extra Chatni!',
    'Extra Sauce!',
  ];

  List allprices = [
    "15",
    "19",
    "26",
    "10",
    "8",

    "20",
    "20",
    "37",
    "5",
    "10",
    "32",
    "52",
    "47",
    "26",
    "26",
    "52",
    "47",
    "32",
    "47",
    "37",
    "37",
    "47",
    "47",
    "52",
    "52",
    "47",
    "63",
    "34",
    "18",

    "47",
    "47",
    "47",
    "47",

    "42",
    "58",
    "73",
    "58",
    "79",
    "53",
    "74",
    "79",
    "94",
    "47",
    "79",
    "105",

    "47",
    "63",
    "84",
    "53",
    "84",
    "53",
    "84",
    "53",
    "84",
    "68",
    "58",

    "29",
    "37",
    "34",
    "84",
    "94",
    "74",
    "34",
    "105",
    "58",
    "89",
    "63",
    "74",
    "100",

    "79",
    "100",
    "79",
    "100",

    "37",
    "37",
    "58",
    "63",
    "38",
    "79",

    "84",
    "89",
    "89",
    "89",
    "94",
    "94",
    "73",
    "105",
//
    "84",
    "89",
    "89",
    "89",
    "94",
    "94",
//
    "79",
    "63",
    "115",
    "94",
    "115",
//
    "63",
    "63",
    "63",
    '105',
    "63",
    "63",
//
    "74",
    "74",
    "74",
//
    "68",
    "68",
    "68",
//
    "58",
    "74",
    "58",
    "74",
    "42",
    "74",
    "53",
    "47",
    "37",
    "32",
    "26",
    "26",
    "7",
    "37",
    "74",
    "84",
    "84",
    "42",
    "68",
    "63",
    "63",
    "74",
    "63",
    "73",
    "84",
    "73",
    "79",
    "79",
    "84",
    "73",
    "84",
    "73",
    "84",
    "84",
    "89",
//
    "84",
    "84",
    "115",
    "63",
    "105",
    "110",
    "100",
    "115",
//
    "35",
    "30",
    "20",
    "20",
    "15",
    "10",
  ];
  //  dishwithprices = {
  //   'tea!': 15,
  //   'coffee!': 19,
  //   'hot milk!': 26,
  //   'tea[half]!': 10,
  //   'tea[staff]!': 8,
  // };

  List allpriceshotitems = [
    "15",
    "19",
    "26",
    "10",
    "8",
  ];
  List allpricessnacks = [
    "20",
    "20",
    "37",
    "5",
    "10",
    "32",
    "52",
    "47",
    "26",
    "26",
    "52",
    "47",
    "32",
    "47",
    "37",
    "37",
    "47",
    "47",
    "52",
    "52",
    "47",
    "63",
    "34",
    "18",
  ];
  List allpricesupvasitems = [
    "47",
    "47",
    "47",
    "47",
  ];
  List allpricesdosa = [
    "42",
    "58",
    "73",
    "58",
    "79",
    "53",
    "74",
    "79",
    "94",
    "47",
    "79",
    "105",
  ];
  List allpricesspecuttappam = [
    "47",
    "63",
    "84",
    "53",
    "84",
    "53",
    "84",
    "53",
    "84",
    "68",
    "58",
  ];
  List allpricessandwichitems = [
    "29",
    "37",
    "34",
    "84",
    "94",
    "74",
    "34",
    "105",
    "58",
    "89",
    "63",
    "74",
    "100",
  ];
  List allpricesgrsandwichitems = [
    "79",
    "100",
    "79",
    "100",
  ];
  List allpriceschatitems = [
    "37",
    "37",
    "58",
    "63",
    "38",
    "79",
  ];
  List allpricesnoodles = [
    "84",
    "89",
    "89",
    "89",
    "94",
    "94",
    "73",
    "105",
  ];
  List allpricesrice = [
    "84",
    "89",
    "89",
    "89",
    "94",
    "94",
  ];
  List allpricesspecrice = [
    "79",
    "63",
    "115",
    "94",
    "115",
  ];
  List allpricesgrdritems = [
    "63",
    "63",
    "63",
    '105',
    "63",
    "63",
  ];
  List allpriceschoupsey = [
    "74",
    "74",
    "74",
  ];
  List allpricessoup = [
    "68",
    "68",
    "68",
  ];
  List allpriceslunchitems = [
    "58",
    "74",
    "58",
    "74",
    "42",
    "74",
    "53",
    "47",
    "37",
    "32",
    "26",
    "26",
    "7",
    "37",
    "74",
    "84",
    "84",
    "42",
    "68",
    "63",
    "63",
    "74",
    "63",
    "73",
    "84",
    "73",
    "79",
    "79",
    "84",
    "73",
    "84",
    "73",
    "84",
    "84",
    "89",
  ];
  List allpricespavbhaji = [
    "84",
    "84",
    "115",
    "63",
    "105",
    "110",
    "100",
    "115",
  ];

  List allpricesextra = [
    "35",
    "30",
    "20",
    "20",
    "15",
    "10",
  ];
  List allCategories = [
    "Hot Item!",
    "Snacks!",
    "Upvas Items!",
    "Dosa!",
    "Special Uttappam!",
    "Sandwich Items!",
    "Grilled Sandwiches!",
    "Chat Items!",
    "Noodle Items!",
    "Rice Items!",
    "Special Rice!",
    "Gravy & Dry Items!",
    "Choupsey!",
    "Soup!",
    "Lunch Items!",
    "Pav Bhaji!",
    "Extras!"
  ];

  List alldishesforhotitems = [
    'Tea!',
    'Coffee!',
    'Hot Milk!',
    'Tea[Half]!',
    'Tea[Staff]!',
  ];
  List alldishesforsnacks = [
    'Samosa Pav!',
    'Vada Pav!',
    'Punjabi Samosa[2 pcs]!',
    'Pav[Single]!',
    'Butter Pav!',
    'Batata Vada[2 pcs]!',
    'Samosa Usal[Plate]!',
    'Vada Usal[Plate]',
    'Samosa Usal[Single]!',
    'Vada Usal[Single]!',
    'Vada Samosa Usal!',
    'Dahi Samosa[Single]!',
    'Usal Pav!',
    'Misal Pav!',
    'Bread Pakoda!',
    'Idli Sambar!',
    'Medu Vada Sambar!',
    'Idli Vada Sambar!',
    'Dahi Idli!',
    'Butter Idli!',
    'Idli Fry!',
    'Dahi Misal Pav!',
    'Upma/Poha!',
    'Single Samosa/Vada!',
  ];
  List alldishesForupvasitems = [
    'Potato Chips!',
    'Potato Toast!',
    'Sabudana Vada/Khichdi!',
    'Alu Jeera!',
  ];
  List alldishesfordosa = [
    'Sada Dosa!',
    'Butter Sada Dosa!',
    'Cheese Sada Dosa!',
    'Masala Sada Dosa!',
    'Cheese Masala Dosa!',
    'Mysore Sada Dosa!',
    'Mysore Masala Dosa!',
    'Cheese Mysore Sada Dosa!',
    'Cheese Mysore Masala!',
    'Cheese Sada Dosa!',
    'Chinese Dosa![Noodles]',
    'Cheese Chinese Dosa!',
  ];
  List alldishesforspecuttappam = [
    'Sada Uttappam!',
    'Butter Sada Uttappam!',
    'Cheese Uttappam!',
    'Onion Uttappam!',
    'Cheese Onion Uttappam!',
    'masala Uttappam!',
    'Cheese masala Uttappam!',
    'Tomato Uttappam!',
    'Cheese Tomato Uttappam!',
    'Four Taste Uttappam',
    'Tomato Omlate!',
  ];
  List alldishesforsandwichitems = [
    'Bread Butter!',
    'Toast Bread Butter!',
    'Veg Sandwich!',
    'Veg Cheese Sandwich!',
    'Veg Cheese Toast Sandwich!',
    'Only Cheese Sandwich!',
    'Tomato Sandwich!',
    'Cheese Club Sandwich!',
    'Veg Toast Sandwich!',
    'Only Cheese Toast Sandwich!',
    'Chinese Toast Sandwich',
    'Club Sandwich!',
    'Cheese Chinese Toast Sandwich!',
  ];
  List alldishesforgrsandwich = [
    'Veg Grilled Sandwich!',
    'Veg Cheese Grilled Sandwich!',
    'Chinese Grilled Sandwich!',
    'Chinese Cheese Grill Sandwich!',
  ];
  List alldishesforchatitems = [
    'Bhel Puri!',
    'Sev Puri!',
    'Dahi Potato Puri!',
    'Bombay Puri!',
    'Sukha Bhel!',
    'Cheese Bhel!',
  ];
  List alldishesfornoodles = [
    'Veg Hakka Noodles!',
    'Veg Schezwan Noodles!',
    'Veg Singapore Noodles!',
    'Veg Manchow Noodles!',
    'Veg Manchurian Noodles!',
    'Triple Schezwan Noodles',
    'Chineese Bhel!',
    'Chineese Cheese Bhel!',
  ];
  List alldishesforrice = [
    'Veg Fried Rice!',
    'Veg Schezwan Rice!',
    'Veg Singapore Rice!',
    'Veg Manchaow Rice!',
    'Veg Manchurian Rice!',
    'Triple Schezwan Rice!',
  ];
  List alldishesforspecrice = [
    'Tomato Rice[With Dahi]!',
    'Lemon Rice!',
    'Paneer Chilly Rice!',
    'Veg Biryani Rice!',
    'Paneer Biryani Rice!',
  ];
  List alldishesforgrdritems = [
    'Veg Manchurian!',
    'Veg Chilly!',
    'Veg Garlic!',
    'Paneer Chilly[Dry]!',
    'Idli Chilly!',
    'Idli Manchurian!',
  ];
  List alldishesforchoupsey = [
    'American Choupsey!',
    'Schezwan Choupsey!',
    'Chinese Choupsey!',
  ];
  List alldishesforsoup = [
    'Manchow Soup!',
    'Tomato Soup!',
    'Sweet Corn Soup!',
  ];
  List alldishesforlunchitems = [
    'Chappati Bhaji!',
    'Chappati Paneer Bhaji!',
    'Puri Bhaji!',
    'Puri Paneer Bhaji!',
    'Potato Bhaji!',
    'Paneer Bhaji[Full]!',
    'Sada Bhaji[Full]!',
    'Paneer Bhaji[Half]',
    'Sada Bhaji[Vati]',
    'Veg Raita!',
    'Dahi[Curd]!',
    'Puri[Plate]!',
    'Single Chappati!',
    'Dal Fry!',
    'Lunch!',
    'Lunch With Pulav!',
    'Lunch With Jeera Rice!',
    'Dal Rice!',
    'Dal Fry Rice!',
    'Dal Rice With Bhaji!',
    'Plain Dahi Rice!',
    'Dahi Masala Rice!',
    'Jeera Rice With Sambhar!',
    'Jeera Rice With Bhaji!',
    'Jeera Rice With Paneer Bhaji!',
    'Pulav Rice With Paneer Sambhar!',
    'Jeera Rice With Dal Fry!',
    'Pulav Rice With Sada Bhaji!',
    'Pulav Rice With Paneer Bhaji!',
    'Pulav Rice With Dal Fry!',
    'Jeera Rice With Raita!',
    'Masala Rice With Sambhar!',
    'Masala Rice With Raita!',
    'Masala Rice With Bhaji!',
    'Masala Rice With Paneer Bhaji!',
  ];
  List alldishesforpavbhaji = [
    'Pav Bhaji!',
    'Jain Pav Bhaji!',
    'Cheese Pav Bhaji!',
    'Masasla Pav!',
    'Cheese Masasla Pav!',
    'Jain Cheese Masasla Pav!',
    'Tava Pulav!',
    'Paneer Tava Pulav!',
  ];
  List alldishesforextras = [
    'Extra Cheese!',
    'Extra Butter!',
    'Extra Vati Dal!',
    'Extra Vati Sambar!',
    'Extra Chatni!',
    'Extra Sauce!',
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var children2 = [
      Column(
        children: [
          SizedBox(height: 40),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            // SizedBox(width: 20,),
            Container(
                height: 50,
                width: 210,
                // color: Color.fromARGB(255, 189, 175, 234),
                decoration: BoxDecoration(
                  color: AppColors.iconColor1,
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: EdgeInsets.only(left: 40),
                child: TextField(
                  keyboardType: TextInputType.text,
                  controller: texteditcontroller,
                  style: TextStyle(fontSize: 20),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.5),
                          borderRadius: BorderRadius.circular(20)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 93, 90, 90),
                              width: 1.5),
                          borderRadius: BorderRadius.circular(20)),
                      hintText: 'search',
                      hintStyle:
                          TextStyle(fontSize: 20, color: AppColors.textColor)),
                  onChanged: (value) {
                    setState(() {
                      s = texteditcontroller.text;
                      s = s
                          .toLowerCase(); //it makes it search for upper as well as lower case
                      alldishes = alldishes
                          .map((alldishes) => alldishes.toLowerCase())
                          .toList(); //it converts all the dishes to lower case
                      // alldishesOnSearch =alldishes.where((p) => p.contains(s)).toList();
                      // alldishesOnSearch =alldishes.where((p) => p.startsWith(s)).toList();
                      alldishesOnSearch = dishwithprices.keys
                          .where((p) => p.contains(s))
                          .toList();
                      // dishforprices=dishwithprices.values.where((p) => p.contains(S)).toList();
                      // alldishesOnSearch = dishwithprices.keys.where((p) => p.startsWith(s)).toList();
                    });
                  },
                )),
            Container(
              margin: EdgeInsets.only(right: 10),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                // border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(40),
                color: AppColors.buttonBackgroundColor,
              ),
              child: TextButton(
                  style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const cart()),
                    );
                  },
                  child: Icon(
                      color: AppColors.iconColor1,
                      size: 25,
                      Icons.shopping_cart_rounded)),
            ),
            // SizedBox(width: 1),
          ]),
        ],
      ),
      if (s.isEmpty || s == ' ') ...{
        Expanded(
          child: SingleChildScrollView(
              child: Column(
            children: [
              SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Container(
                          height: 65,
                          width: 75,
                          child: TextButton(
                              onPressed: () {
                                n = 0;
                                noOfDishesOfCategories = 5;
                                namesOfCategories = allCategories[n];
                                dishesfordisplayCategory = alldishesforhotitems;
                                pricessfordisplayCategory = allpriceshotitems;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          OnePageForAllCategories()),
                                );
                              },
                              child: Text(
                                  style: TextStyle(
                                      color: AppColors.textColor, fontSize: 15),
                                  'Hot Items!')),
                          decoration: BoxDecoration(
                            //             border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.kBackground,
                          )),

                      // Text(style:TextStyle(fontSize: 20),'Hot Items!'),
                    ],
                  ),
                  SizedBox(width: 10),
                  Column(
                    children: [
                      Container(
                        height: 65,
                        width: 75,
                        child: TextButton(
                            onPressed: () {
                              n = 1;
                              noOfDishesOfCategories = 23;
                              namesOfCategories = allCategories[n];
                              dishesfordisplayCategory = alldishesforsnacks;
                              pricessfordisplayCategory = allpricessnacks;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        OnePageForAllCategories()),
                              );
                            },
                            child: Text(
                                style: TextStyle(
                                    color: AppColors.textColor, fontSize: 15),
                                'Snacks!')),
                        decoration: BoxDecoration(
                          //           border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.kBackground,
                        ),
                      ),
                      // Text(style:TextStyle(fontSize: 20),'Snacks!'),
                    ],
                  ),
                  SizedBox(width: 10),
                  Column(
                    children: [
                      Container(
                        height: 65,
                        width: 75,
                        child: TextButton(
                            onPressed: () {
                              n = 2;
                              noOfDishesOfCategories = 4;
                              namesOfCategories = allCategories[n];
                              dishesfordisplayCategory = alldishesForupvasitems;
                              pricessfordisplayCategory = allpricesupvasitems;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        OnePageForAllCategories()),
                              );
                            },
                            child: Text(
                                style: TextStyle(
                                    color: AppColors.textColor, fontSize: 15),
                                'Upvas Items!')),
                        decoration: BoxDecoration(
                          //         border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.kBackground,
                        ),
                      ),
                      // Text(style:TextStyle(fontSize: 20),'Upvas Items!'),
                    ],
                  ),
                  SizedBox(width: 10),
                  Column(
                    children: [
                      Container(
                        height: 65,
                        width: 75,
                        child: TextButton(
                            onPressed: () {
                              n = 3;
                              noOfDishesOfCategories = 11;
                              namesOfCategories = allCategories[n];
                              dishesfordisplayCategory = alldishesfordosa;
                              pricessfordisplayCategory = allpricesdosa;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        OnePageForAllCategories()),
                              );
                            },
                            child: Text(
                                style: TextStyle(
                                    color: AppColors.textColor, fontSize: 15),
                                'Dosa!')),
                        decoration: BoxDecoration(
                          //       border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.kBackground,
                        ),
                      ),
                      // Text(style:TextStyle(fontSize: 20),'Dosa!'),
                    ],
                  ),
                  SizedBox(width: 10),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Container(
                        height: 65,
                        width: 75,
                        child: TextButton(
                            onPressed: () {
                              n = 4;
                              noOfDishesOfCategories = 10;
                              namesOfCategories = allCategories[n];
                              dishesfordisplayCategory =
                                  alldishesforspecuttappam;
                              pricessfordisplayCategory = allpricesspecuttappam;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        OnePageForAllCategories()),
                              );
                            },
                            child: Text(
                                style: TextStyle(
                                    color: AppColors.textColor, fontSize: 15),
                                'Special Uttappam!')),
                        decoration: BoxDecoration(
                          //       border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.kBackground,
                        ),
                      ),
                      // Text(style:TextStyle(fontSize: 15),'Special Uttappam!'),
                    ],
                  ),
                  SizedBox(width: 10),
                  Column(
                    children: [
                      Container(
                        height: 65,
                        width: 75,
                        child: TextButton(
                            onPressed: () {
                              n = 5;
                              noOfDishesOfCategories = 12;
                              namesOfCategories = allCategories[n];
                              dishesfordisplayCategory =
                                  alldishesforsandwichitems;
                              pricessfordisplayCategory =
                                  allpricessandwichitems;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        OnePageForAllCategories()),
                              );
                            },
                            child: Text(
                                style: TextStyle(
                                    color: AppColors.textColor, fontSize: 15),
                                'Sandwich Items!')),
                        decoration: BoxDecoration(
                          //      border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.kBackground,
                        ),
                      ),
                      // Text(style:TextStyle(fontSize: 20),'Sandwich Items!'),
                    ],
                  ),
                  SizedBox(width: 10),
                  Column(
                    children: [
                      Container(
                        height: 65,
                        width: 75,
                        child: TextButton(
                            onPressed: () {
                              n = 6;
                              noOfDishesOfCategories = 4;
                              namesOfCategories = allCategories[n];
                              dishesfordisplayCategory = alldishesforgrsandwich;
                              pricessfordisplayCategory =
                                  allpricesgrsandwichitems;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        OnePageForAllCategories()),
                              );
                            },
                            child: Text(
                                style: TextStyle(
                                    color: AppColors.textColor, fontSize: 15),
                                'Grilled Sandwiches!')),
                        decoration: BoxDecoration(
                          //    border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.kBackground,
                        ),
                      ),
                      // Text(style:TextStyle(fontSize: 13),'Grilled Sandwiches!'),
                    ],
                  ),
                  SizedBox(width: 10),
                  Column(
                    children: [
                      Container(
                        height: 65,
                        width: 75,
                        child: TextButton(
                            onPressed: () {
                              n = 7;
                              noOfDishesOfCategories = 6;
                              namesOfCategories = allCategories[n];
                              dishesfordisplayCategory = alldishesforchatitems;
                              pricessfordisplayCategory = allpriceschatitems;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        OnePageForAllCategories()),
                              );
                            },
                            child: Text(
                                style: TextStyle(
                                    color: AppColors.textColor, fontSize: 15),
                                'Chat Items!')),
                        decoration: BoxDecoration(
//                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.kBackground,
                        ),
                      ),
                      // Text(style:TextStyle(fontSize: 13),'Chat Items!'),
                    ],
                  ),
                  SizedBox(width: 10),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Container(
                        height: 65,
                        width: 75,
                        child: TextButton(
                            onPressed: () {
                              n = 8;
                              noOfDishesOfCategories = 8;
                              namesOfCategories = allCategories[n];
                              dishesfordisplayCategory = alldishesfornoodles;
                              pricessfordisplayCategory = allpricesnoodles;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        OnePageForAllCategories()),
                              );
                            },
                            child: Text(
                                style: TextStyle(
                                    color: AppColors.textColor, fontSize: 15),
                                'Noodles Items!')),
                        decoration: BoxDecoration(
                          //  border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.kBackground,
                        ),
                      ),
                      // Text('Noodles Items!'),
                    ],
                  ),
                  SizedBox(width: 10),
                  Column(
                    children: [
                      Container(
                        height: 65,
                        width: 75,
                        child: TextButton(
                            onPressed: () {
                              n = 9;
                              noOfDishesOfCategories = 6;
                              namesOfCategories = allCategories[n];
                              dishesfordisplayCategory = alldishesforrice;
                              pricessfordisplayCategory = allpricesrice;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        OnePageForAllCategories()),
                              );
                            },
                            child: Text(
                                style: TextStyle(
                                    color: AppColors.textColor, fontSize: 15),
                                'Rice Items!')),
                        decoration: BoxDecoration(
                          //    border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.kBackground,
                        ),
                      ),
                      // Text('Rice Items!'),
                    ],
                  ),
                  SizedBox(width: 10),
                  Column(
                    children: [
                      Container(
                        height: 65,
                        width: 75,
                        child: TextButton(
                            onPressed: () {
                              n = 10;
                              noOfDishesOfCategories = 5;
                              namesOfCategories = allCategories[n];
                              dishesfordisplayCategory = alldishesforspecrice;
                              pricessfordisplayCategory = allpricesspecrice;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        OnePageForAllCategories()),
                              );
                            },
                            child: Text(
                                style: TextStyle(
                                    color: AppColors.textColor, fontSize: 15),
                                'Special Rice!')),
                        decoration: BoxDecoration(
                          //   border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.kBackground,
                        ),
                      ),
                      // Text('Special Rice!'),
                    ],
                  ),
                  SizedBox(width: 10),
                  Column(
                    children: [
                      Container(
                        height: 65,
                        width: 75,
                        child: TextButton(
                            onPressed: () {
                              n = 11;
                              noOfDishesOfCategories = 6;
                              namesOfCategories = allCategories[n];
                              dishesfordisplayCategory = alldishesforgrdritems;
                              pricessfordisplayCategory = allpricesgrdritems;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        OnePageForAllCategories()),
                              );
                            },
                            child: Text(
                                style: TextStyle(
                                    color: AppColors.textColor, fontSize: 15),
                                'Gravy&Dry Items!')),
                        decoration: BoxDecoration(
                          //   border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.kBackground,
                        ),
                      ),
                      // Text('Gravy&Dry Items!'),
                    ],
                  ),
                  SizedBox(width: 10),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Container(
                        height: 65,
                        width: 75,
                        child: TextButton(
                            onPressed: () {
                              n = 12;
                              noOfDishesOfCategories = 3;
                              namesOfCategories = allCategories[n];
                              dishesfordisplayCategory = alldishesforchoupsey;
                              pricessfordisplayCategory = allpriceschoupsey;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        OnePageForAllCategories()),
                              );
                            },
                            child: Text(
                                style: TextStyle(
                                    color: AppColors.textColor, fontSize: 15),
                                'Choupsey!')),
                        decoration: BoxDecoration(
                          //   border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.kBackground,
                        ),
                      ),
                      // Text('Choupsey!'),
                    ],
                  ),
                  SizedBox(width: 10),
                  Column(
                    children: [
                      Container(
                        height: 65,
                        width: 75,
                        child: TextButton(
                            onPressed: () {
                              n = 13;
                              noOfDishesOfCategories = 3;
                              namesOfCategories = allCategories[n];
                              dishesfordisplayCategory = alldishesforsoup;
                              pricessfordisplayCategory = allpricessoup;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        OnePageForAllCategories()),
                              );
                            },
                            child: Text(
                                style: TextStyle(
                                    color: AppColors.textColor, fontSize: 15),
                                'Soup!')),
                        decoration: BoxDecoration(
                          // border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.kBackground,
                        ),
                      ),
                      // Text('Soup!'),
                    ],
                  ),
                  SizedBox(width: 10),
                  Column(
                    children: [
                      Container(
                        height: 65,
                        width: 75,
                        child: TextButton(
                            onPressed: () {
                              n = 14;
                              noOfDishesOfCategories = 34;
                              namesOfCategories = allCategories[n];
                              dishesfordisplayCategory = alldishesforlunchitems;
                              pricessfordisplayCategory = allpriceslunchitems;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        OnePageForAllCategories()),
                              );
                            },
                            child: Text(
                                style: TextStyle(
                                    color: AppColors.textColor, fontSize: 15),
                                'Lunch Items!')),
                        decoration: BoxDecoration(
                          // border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.kBackground,
                        ),
                      ),
                      // Text('Lunch Items!'),
                    ],
                  ),
                  SizedBox(width: 10),
                  Column(
                    children: [
                      Container(
                        height: 65,
                        width: 75,
                        child: TextButton(
                            onPressed: () {
                              n = 15;
                              noOfDishesOfCategories = 8;
                              namesOfCategories = allCategories[n];
                              dishesfordisplayCategory = alldishesforpavbhaji;
                              pricessfordisplayCategory = allpricespavbhaji;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        OnePageForAllCategories()),
                              );
                            },
                            child: Text(
                                style: TextStyle(
                                    color: AppColors.textColor, fontSize: 15),
                                'Pav Bhaji!')),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.kBackground,
                        ),
                      ),
                      // Text('Pav Bhaji!'),
                    ],
                  ),
                  SizedBox(width: 10),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Container(
                        height: 65,
                        width: 75,
                        child: TextButton(
                            onPressed: () {
                              n = 16;
                              noOfDishesOfCategories = 6;
                              namesOfCategories = allCategories[n];
                              dishesfordisplayCategory = alldishesforextras;
                              pricessfordisplayCategory = allpricesextra;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        OnePageForAllCategories()),
                              );
                            },
                            child: Text(
                                style: TextStyle(
                                    color: AppColors.textColor, fontSize: 15),
                                'Extras!')),
                        decoration: BoxDecoration(
                          //  border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.kBackground,
                        ),
                      ),
                      // Text('Extras!'),
                    ],
                  ),
                  SizedBox(width: 10),
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ],
          )),
        ),
        //
      } else ...{
        Expanded(
            child: SingleChildScrollView(
                child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              margin: EdgeInsets.only(top: 25),
              height: 350,
              width: 330,
              decoration: BoxDecoration(
                // border: Border.all(color: Colors.black),
                color: Color.fromARGB(255, 177, 167, 207),
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: alldishesOnSearch.length,
                  itemBuilder: (context, index) => ListTile(
                        leading: Text(
                          style: TextStyle(fontSize: 23),
                          alldishesOnSearch[index].toString(),
                          textAlign: TextAlign.left,
                        ),
                        onTap: () {
                          name = alldishesOnSearch[index];
                          price =
                              dishwithprices.values.elementAt(index).toString();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OnePageForAll()),
                          );
                        },
                      )),
            ),
          ],
        ))),
      }
    ];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        children: children2,
      ),
    );
  }
}
