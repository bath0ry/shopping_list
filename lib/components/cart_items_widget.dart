import 'package:flutter/material.dart';
import 'package:shopping_list/components/cart_items_dao.dart';

class CartItems extends StatefulWidget {
  final String itemName;

  CartItems(this.itemName, {Key? key}) : super(key: key);
  int itemQuanty = 0;

  @override
  State<CartItems> createState() => _CartItemsState();
}

class _CartItemsState extends State<CartItems> {
  bool? isChecked = false;

  void incrementItem() {
    if (widget.itemQuanty <= 49) {
      setState(() {
        widget.itemQuanty++;
      });
    }
  }

  void decrementItem() {
    if (widget.itemQuanty >= 1) {
      setState(() {
        widget.itemQuanty--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 10, right: 7, left: 7),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Color.fromARGB(255, 32, 32, 32),
        ),
        width: 100,
        height: 110,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                widget.itemName,
                style: const TextStyle(
                    color: Color.fromARGB(255, 245, 233, 129),
                    fontSize: 24,
                    fontWeight: FontWeight.w600),
                overflow: TextOverflow.fade,
                maxLines: 1,
                softWrap: false,
              ),
            ),
            IconButton(
                onPressed: () {
                  decrementItem();
                },
                icon: const Icon(
                  Icons.remove,
                  color: Color.fromARGB(255, 247, 228, 61),
                )),
            Text(
              '${widget.itemQuanty}',
              style: const TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 245, 233, 129),
                  fontWeight: FontWeight.w600),
            ),
            IconButton(
                onPressed: () {
                  incrementItem();
                },
                icon: const Icon(
                  Icons.add,
                  color: Color.fromARGB(255, 240, 224, 85),
                )),
            IconButton(
              onPressed: () {
                CartItemsDao().delete(widget.itemName);
              },
              icon: Icon(Icons.delete),
              color: Color.fromARGB(255, 199, 199, 199),
            ),
            Checkbox(
                fillColor: MaterialStateProperty.all(
                    Color.fromARGB(255, 231, 121, 121)),
                value: isChecked,
                onChanged: ((newBool) {
                  setState(() {
                    isChecked = newBool;
                  });
                }))
          ],
        ),
      ),
    );
  }
}
