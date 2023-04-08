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
            decoration: BoxDecoration(color: Colors.transparent),
            child: Row(
              children: [
                Checkbox(
                    value: isChecked,
                    onChanged: (value) => setState(() {
                          isChecked = value != null ? value : false;
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
