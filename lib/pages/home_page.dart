import 'package:flutter/material.dart';
import 'package:shopping_list/components/cart_items_dao.dart';
import 'package:shopping_list/components/cart_items_widget.dart';
import 'package:shopping_list/pages/form_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 32, 32, 32),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(
                    builder: (BuildContext contextNew) => FormPage(
                          itemContext: context,
                        )))
                .then((value) => setState(
                      () {},
                    ));
          },
          child: const Icon(
            Icons.add,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 221, 243, 159),
        body: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 80),
          child: FutureBuilder(
            builder: (context, snapshot) {
              List<CartItems>? items = snapshot.data;
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Center(
                    child: CircularProgressIndicator(),
                  );

                case ConnectionState.waiting:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                case ConnectionState.active:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                case ConnectionState.done:
                  if (items != null && snapshot.hasData) {
                    if (items.isNotEmpty) {
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          final CartItems item = items[index];
                          return item;
                        },
                        itemCount: items.length,
                      );
                    }
                    return const Center(
                      child: Text('Ainda não há tarefas'),
                    );
                  }
                  return const Text('Erro ao pegar dados');
              }
            },
            future: CartItemsDao().findAll(),
          ),
        ));
  }
}
