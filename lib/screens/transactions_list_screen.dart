/*
  MAD201 - Project 1
  Your Name - Ashishkumar Prajapati
  List of transactions, edit/delete
*/
import 'package:flutter/material.dart';
import '../db_helper.dart';
import '../models/transaction.dart';

class TransactionsListScreen extends StatefulWidget {
  const TransactionsListScreen({super.key});

  @override
  _TransactionsListScreenState createState() => _TransactionsListScreenState();
}

class _TransactionsListScreenState extends State<TransactionsListScreen> {
  List<Transaction> txs = [];

  Future<void> reload() async {
    txs = await DBHelper().getTransactions();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    reload();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Transactions")),
      body: ListView.builder(
        itemCount: txs.length,
        itemBuilder: (context, i) {
          final t = txs[i];
          return Card(
            child: ListTile(
              title: Text(t.title),
              subtitle: Text(
                  "${t.amount} - ${t.category} - ${t.date.toLocal().toIso8601String().split('T')[0]}"),
              leading: Icon(Icons.monetization_on,
                  color: t.type == 'Income' ? Colors.green : Colors.red),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () async {
                  await DBHelper().deleteTransaction(t.id!);
                  reload();
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
