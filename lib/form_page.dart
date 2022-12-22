import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shopping_list/cart_items_dao.dart';
import 'package:shopping_list/cart_items_widget.dart';
import 'package:shopping_list/home_page.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key, required this.itemContext});
  final BuildContext itemContext;

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  TextEditingController controllerName = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool valueValidator(String? value) {
    if (value != null && value.isEmpty) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: _formKey,
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 221, 243, 159),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 25, left: 15, bottom: 10),
                      child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop(MaterialPageRoute(
                                builder: (BuildContext context) {
                              return HomePage();
                            }));
                          },
                          icon: Icon(Icons.arrow_back_ios)),
                    ),
                  ],
                ),
                Center(
                  child: Container(
                    width: 370,
                    height: 600,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 61, 61, 61),
                        borderRadius: BorderRadius.circular(20),
                        border: const Border.fromBorderSide(BorderSide(
                            width: 4, color: Color.fromARGB(255, 0, 0, 0)))),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(30),
                          child: TextFormField(
                            validator: (String? value) {
                              if (valueValidator(value)) {
                                return 'Add a valid name';
                              }
                              return null;
                            },
                            controller: controllerName,
                            onChanged: (text) {
                              setState(() {});
                            },
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(255, 206, 206, 206),
                                hintText: 'Item Name',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              CartItemsDao()
                                  .save(CartItems(controllerName.text));
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text('Item successfully added!')));
                              Navigator.of(context).pop();
                            }
                          },
                          child: Text(
                            'ADD ITEM',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 221, 243, 159)),
                          ),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.black)),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
