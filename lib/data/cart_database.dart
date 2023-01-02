import 'package:shopping_list/components/cart_items_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'cart.db');
  return openDatabase(path, onCreate: ((db, version) {
    db.execute(CartItemsDao.tableSql);
  }), version: 1);
}
