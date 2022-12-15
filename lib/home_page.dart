import 'package:flutter/material.dart';
import 'package:shopping_list/cart_items_widget.dart';
import 'package:shopping_list/form_page.dart';
import 'package:shopping_list/inherited_items.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 32, 32, 32),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext contextNew) => FormPage(
                    itemContext: context,
                  )));
        },
        child: Icon(
          Icons.add,
        ),
      ),
      backgroundColor: Color.fromARGB(255, 221, 243, 159),
      body: Stack(children: [
        ListView(
          children: ItemCartInhertied.of(context).itemsList,
        ),
      ]),
    );
  }
}
