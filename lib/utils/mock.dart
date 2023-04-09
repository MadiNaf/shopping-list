import 'package:shopping_list/models/item.model.dart';

List<ItemPrice> prices = [
  ItemPrice(price: 10.0, mall: 'Carffour'),
  ItemPrice(price: 10.0, mall: 'Aucchan'),
  ItemPrice(price: 10.0, mall: 'Lidle'),
];

List<String> names = ['Sauce Tomate', 'Riz', 'Eau'];

List<ItemEntity> getDataMock() {
  List<ItemEntity> dataMock = [];

  for (int i = 0; i < 3; i++) {
    dataMock.add(ItemEntity(name: names[i], prices: prices, barCode: i));
  }

  return dataMock;
}
