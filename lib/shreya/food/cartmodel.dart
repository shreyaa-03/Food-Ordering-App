class CartModel extends Model {
  List<Product> cart = [];
  double totalCartValue = 0;

  int get total => cart.length;

  void addProduct(food) {
    int index = cart.indexWhere((i) => i.id == food.id);
    print(index);
    if (index != -1)
      updateProduct(food, food.quantity + 1);
    else {
      cart.add(food);
      calculateTotal();
      notifyListeners();
    }
  }

  void removeProduct(food) {
    int index = cart.indexWhere((i) => i.id == food.id);
    cart[index].quantity = 1;
    cart.removeWhere((item) => item.id == food.id);
    calculateTotal();
    notifyListeners();
  }

  void updateProduct(food, quantity) {
    int index = cart.indexWhere((i) => i.id == food.id);
    cart[index].quantity = quantity;
    if (cart[index].quantity == 0) removeProduct(food);

    calculateTotal();
    notifyListeners();
  }

  void clearCart() {
    cart.forEach((f) => f.quantity = 1);
    cart = [];
    notifyListeners();
  }

  void calculateTotal() {
    totalCartValue = 0;
    cart.forEach((f) {
      totalCartValue += f.price * f.quantity;
    });
  }

  void notifyListeners() {}
}

class Model {}

class Product {
  int id;
  String title;
  String imgUrl;
  double price;
  int quantity;

  Product(
      {required this.id,
      required this.title,
      required this.price,
      required this.quantity,
      required this.imgUrl});
}
