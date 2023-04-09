import 'dart:ffi';

class Item {
  String id = '';
  String name;
  List<ItemPrice> prices;
  Int barCode;
  bool isChecked = false;

  Item({required this.name, required this.prices, required this.barCode}) {}

  void setUid(String id) {
    id = id;
  }
}

class SingleItem {
  String id = '';
  int price = 0;
}

class ItemPrice {
  int price;
  String mall;

  ItemPrice({required this.price, required this.mall}) {}
}

// class ItemList {
//   bool isDone;
//   List<SingleItem> items;
//   int createdAt = 0;
//   int total = 0;

//   ItemList({required this.items})

//   updateSum() {

//   }
// }