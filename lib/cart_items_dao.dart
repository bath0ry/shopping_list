import 'package:shopping_list/data/cart_database.dart';
import 'package:shopping_list/cart_items_widget.dart';
import 'package:sqflite/sqflite.dart';

class CartItemsDao {
  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_itemName TEXT)';
  static const String _tableName = 'cartTable';
  static const String _itemName = 'itemName';

  save(CartItems item) async {
    final Database bancoDeDados = await getDatabase();
    var itemExist = await find(item.itemName);
    Map<String, dynamic> cartMap = toMap(item);
    if (itemExist.isEmpty) {
      return await bancoDeDados.insert(_tableName, cartMap);
    } else {
      return await bancoDeDados.update(_tableName, cartMap,
          where: '$_itemName = ?', whereArgs: [item.itemName]);
    }
  }

  Map<String, dynamic> toMap(CartItems item) {
    final Map<String, dynamic> mapaDeItems = {};
    mapaDeItems[_itemName] = item.itemName;
    return mapaDeItems;
  }

  Future<List<CartItems>> findAll() async {
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result =
        await bancoDeDados.query(_tableName);
    return toList(result);
  }

  List<CartItems> toList(List<Map<String, dynamic>> mapaDeItems) {
    final List<CartItems> items = [];
    for (Map<String, dynamic> linha in mapaDeItems) {
      final CartItems item = CartItems(linha[_itemName]);
      items.add(item);
    }
    return items;
  }

  Future<List<CartItems>> find(String nomeDoItem) async {
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result = await bancoDeDados
        .query(_tableName, where: '$_itemName = ?', whereArgs: [nomeDoItem]);
    return toList(result);
  }

  delete(String nomeDoItem) async {
    final Database bancoDeDados = await getDatabase();
    return bancoDeDados
        .delete(_tableName, where: '$_itemName = ?', whereArgs: [nomeDoItem]);
  }
}
