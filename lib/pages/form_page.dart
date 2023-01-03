import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';
import 'package:shopping_list/components/cart_items_dao.dart';
import 'package:shopping_list/components/cart_items_widget.dart';
import 'package:shopping_list/pages/home_page.dart';

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
          backgroundColor: const Color.fromARGB(255, 75, 75, 75),
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
                    height: 200,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 61, 61, 61),
                        borderRadius: BorderRadius.circular(20),
                        border: const Border.fromBorderSide(BorderSide(
                            width: 2, color: Color.fromARGB(255, 0, 0, 0)))),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(30),
                          child: TextFormField(
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.w600),
                            cursorColor: Colors.black,
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
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Color.fromARGB(255, 22, 22, 22))),
                          child: const Text(
                            'Add Item',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 154, 196, 243)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Lottie.network(
                    'https://assets9.lottiefiles.com/packages/lf20_ymbx3fps.json',
                    width: 400,
                    height: 350)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
