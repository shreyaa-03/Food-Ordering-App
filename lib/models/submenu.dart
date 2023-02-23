// it has the text that is diplayed on each sub menu
// used to add categories like name of categories,avg wait time,label,dicscription,ratting
import 'food.dart';

class SubMenu {
  String imageurl;
  String name;
  String waitTime;
  String label;

  String desc;
  num score;
  Map<String, List<Food>> menu;
  SubMenu(
    this.imageurl,
    this.name,
    this.waitTime,
    this.label,
    this.desc,
    this.score,
    this.menu,
  );
  // static List<SubMenu> generatesSubMenu() {
  static SubMenu generatesSubMenu() {
    return
        //[
        SubMenu(
      'assets/images/mainimg.jpg',
      //name
      'Hot Items',
      //waiting time
      '10 min',
      //label
      'some label',
      //description
      'soo good',
      5,
      {
        //menu will be taken from food class
        'recomended': Food.generateReomendedFoods(),
        'popular': Food.generateReomendedFoods(),
      },
    );
    // SubMenu(
    //   'assets/images/hotitem.png',
    //   //name
    //   'Hot Items',
    //   //waiting time
    //   '10 min',
    //   //label
    //   'some label',
    //   //description
    //   'soo good',
    //   5,
    //   {
    //     //menu will be taken from food class
    //     'recomended': Food.generateReomendedFoods(),
    //     'popular': Food.generateReomendedFoods(),
    //   },
    // ),
    // ];
  }
}
