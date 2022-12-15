import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shopping_list/home_page.dart';
import 'package:shopping_list/inherited_items.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key, required this.itemContext});
  final BuildContext itemContext;

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerImage = TextEditingController();
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
          backgroundColor: Color.fromARGB(255, 221, 243, 159),
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
                        color: Color.fromARGB(255, 61, 61, 61),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.fromBorderSide(BorderSide(
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
                            maxLength: 15,
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Color.fromARGB(255, 206, 206, 206),
                                hintText: 'Item Name',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(30),
                          child: TextFormField(
                            validator: (String? value) {
                              if (valueValidator(value)) {
                                return 'Add a valid image';
                              }
                              return null;
                            },
                            onChanged: (text) {
                              setState(() {});
                            },
                            keyboardType: TextInputType.url,
                            controller: controllerImage,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Color.fromARGB(255, 206, 206, 206),
                                hintText: 'Item Image Url',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                        ),
                        Container(
                          height: 100,
                          width: 72,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color.fromARGB(255, 255, 255, 255),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              controllerImage.text,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Image.asset('assets/images/noimage.jpg');
                              },
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ItemCartInhertied.of(widget.itemContext).newItem(
                                  controllerName.text, controllerImage.text);
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
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
