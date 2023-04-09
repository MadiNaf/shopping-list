import 'dart:ffi';

class ItemEntity {
  String id = '';
  String name;
  List<ItemPrice> prices;
  int barCode;

  ItemEntity(
      {required this.name, required this.prices, required this.barCode}) {}

  void setUid(String id) {
    id = id;
  }
}

class SingleItem {
  String id = '';
  double price = 0;
  bool ordered = false;
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