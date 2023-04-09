import 'dart:ffi';

class ItemEntity {
  String id = '';
  String name;
  List<ItemPrice> prices;
  Int barCode;
  bool isChecked = false;

  ItemEntity(
      {required this.name, required this.prices, required this.barCode}) {}

  void setUid(String id) {
    id = id;
  }
}

class SingleItem {
  String id = '';
  double price = 0;
}

class ItemPrice {
  double price;
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