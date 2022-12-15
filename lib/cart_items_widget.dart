import 'package:flutter/material.dart';

class CartItems extends StatefulWidget {
  final String itemName;
  final String itemImage;

  CartItems(this.itemName, this.itemImage, {Key? key}) : super(key: key);
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

  bool assetOrNetwork() {
    if (widget.itemImage.contains('http')) {
      return false;
    }
    return true;
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
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: assetOrNetwork()
                  ? Image.asset(
                      widget.itemImage,
                      width: 100,
                      height: 120,
                      fit: BoxFit.cover,
                    )
                  : Image.network(
                      widget.itemImage,
                      height: 100,
                      width: 72,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset('assets/images/noimage.jpg');
                      },
                    ),
            ),
            Text(
              widget.itemName,
              style: TextStyle(
                  color: Color.fromARGB(255, 245, 233, 129),
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            IconButton(
                onPressed: () {
                  decrementItem();
                },
                icon: Icon(
                  Icons.remove,
                  color: Color.fromARGB(255, 247, 228, 61),
                )),
            Text(
              '${widget.itemQuanty}',
              style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 245, 233, 129),
                  fontWeight: FontWeight.w600),
            ),
            IconButton(
                onPressed: () {
                  incrementItem();
                },
                icon: Icon(
                  Icons.add,
                  color: Color.fromARGB(255, 240, 224, 85),
                )),
            Checkbox(
                fillColor: MaterialStateProperty.all(Colors.red),
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
