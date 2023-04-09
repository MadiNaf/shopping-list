import 'package:flutter/material.dart';

class ShoppingList extends StatefulWidget {
  ShoppingList({super.key});

  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  final List<String> entries = <String>['A', 'B', 'C'];

  bool isChecked = false;

  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            decoration: const BoxDecoration(color: Colors.transparent),
            child: Row(
              children: [
                Checkbox(
                    shape: CircleBorder(),
                    value: isChecked,
                    onChanged: (value) => setState(() {
                          isChecked = value ?? false;
                        })),
                Text(
                  'Entry ${entries[index]}',
                  style: TextStyle(
                      decoration: isChecked
                          ? TextDecoration.lineThrough
                          : TextDecoration.none),
                )
              ],
            ),
          );
        });
  }
}


// Center(
//               child: Padding(
//                   padding: const EdgeInsets.symmetric(
//                       vertical: 0.0, horizontal: 12.0),
//                   child: Card(
//                       child: Container(
//                     decoration: const BoxDecoration(color: Color(0x99ffbd77)),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: <Widget>[ShoppingList(), Text('Tota : 0 €')],
//                     ),
//                   )))),