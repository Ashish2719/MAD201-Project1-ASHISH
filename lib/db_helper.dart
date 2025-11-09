/*
  MAD201 - Project 1
  Your Name - Ashishkumar Prajapati
  SQLite database helper for transactions
*/
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'models/transaction.dart' as mdl;

class DBHelper {
  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await initDb();
    return _db!;
  }

  Future<Database> initDb() async {
    String path = join(await getDatabasesPath(), "transactions.db");
    return await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute('''
      CREATE TABLE transactions (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT, amount REAL, type TEXT, category TEXT, date TEXT)
      ''');
    });
  }

  Future<int> insertTransaction(mdl.Transaction tx) async {
    final dbclient = await db;
    return dbclient.insert('transactions', tx.toMap());
  }

  Future<List<mdl.Transaction>> getTransactions() async {
    final dbclient = await db;
    var res = await dbclient.query('transactions');
    return res.map((e) => mdl.Transaction.fromMap(e)).toList();
  }

  Future<int> deleteTransaction(int id) async {
    final dbclient = await db;
    return dbclient.delete('transactions', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> updateTransaction(mdl.Transaction tx) async {
    final dbclient = await db;
    return dbclient.update('transactions', tx.toMap(),
        where: 'id = ?', whereArgs: [tx.id]);
  }
}
