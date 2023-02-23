// create food to add items to menu
class Food {
  int id;
  String imageurl;
  String desc;
  String name;
  String waitTime;
  num score;
  String cal;
  num price;
  num quantity;
  String ingredients;
  String about;
  bool highlight;

  Food(this.id, this.imageurl, this.desc, this.name, this.waitTime, this.score,
      this.about, this.cal, this.price, this.ingredients, this.quantity,
      {this.highlight = false});
  static List<Food> generateReomendedFoods() {
    return [
      Food(
        1,
        'assets/images/teaa.jpeg',
        'made with love',
        "tea",
        "5 min",
        5,
        "have fresh cup of tea",
        '175cal',
        15,
        'special tea massal,milk,water,sugar',
        1,
        highlight: true,
      ),
      Food(
        2,
        'assets/images/coffeeee.jpeg',
        'made with love',
        "coffee",
        "50 min",
        4,
        "have fresh cup of coffee",
        '135cal',
        23,
        'special coffee powder,milk,water,sugar',
        1,
        highlight: true,
      ),
      Food(
        3,
        'assets/images/halfteaa.jpg',
        'made with love',
        "half tea",
        "50 min",
        4,
        "have fresh cup of half tea",
        '135cal',
        10,
        'special tea massal,milk,water,sugar',
        1,
        highlight: true,
      ),
      Food(
        4,
        'assets/images/ginerrrrrrr.jpg',
        'made with love',
        "ginger tea",
        "50 min",
        4,
        "have fresh cup of gingertea",
        '135cal',
        40,
        'special ginger tea massal,milk,water,sugar,ginger',
        1,
        highlight: true,
      ),
      Food(
        5,
        'assets/images/hotmilkkk.jpeg',
        'made with love',
        "hot milk",
        "50 min",
        4,
        "have fresh cup of hot milk",
        '135cal',
        70,
        'special hot choolate,milk,sugar',
        1,
        highlight: true,
      ),
    ];
  }
}
