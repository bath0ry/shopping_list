import 'package:flutter/material.dart';
import 'package:shopping_list/cart_items_widget.dart';

class ItemCartInhertied extends InheritedWidget {
  ItemCartInhertied({required super.child});
  final List<CartItems> itemsList = [
    CartItems('Apple', 'assets/images/maca.jpg'),
    CartItems('Meat', 'assets/images/carne.png'),
  ];
  void newItem(String name, String image) {
    itemsList.add(CartItems(name, image));
  }

  static ItemCartInhertied of(BuildContext context) {
    final ItemCartInhertied? result =
        context.dependOnInheritedWidgetOfExactType<ItemCartInhertied>();
    assert(result != null, 'No found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(ItemCartInhertied oldWidget) {
    return oldWidget.itemsList.length != itemsList.length;
  }
}
