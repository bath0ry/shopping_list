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
  Future<void> _reloadList() async {
    var newList =
        await Future.delayed(Duration(seconds: 2), () => CartItemsDao());
    setState(() {});
  }

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
        backgroundColor: Color.fromARGB(255, 75, 75, 75),
        body: RefreshIndicator(
          color: Colors.black,
          onRefresh: _reloadList,
          child: Padding(
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
                        child: Text(
                          'Ainda não há tarefas',
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }
                    return const Text('Erro ao pegar dados',
                        style: TextStyle(color: Colors.white));
                }
              },
              future: CartItemsDao().findAll(),
            ),
          ),
        ));
  }
}
