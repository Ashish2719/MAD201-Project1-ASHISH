/*
  MAD201 - Project 1
  Your Name - Ashishkumar Prajapati
  Reports summary screen
*/
import 'package:flutter/material.dart';
import '../db_helper.dart';

class ReportsSummaryScreen extends StatelessWidget {
  const ReportsSummaryScreen({super.key});

  Future<Map<String, double>> getTotalsByCategory() async {
    List txs = await DBHelper().getTransactions();

    Map<String, double> data = {};
    for (var t in txs) {
      data[t.category] =
          (data[t.category] ?? 0) + t.amount * (t.type == "Expense" ? -1 : 1);
    }
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Report Summary")),
      body: FutureBuilder(
        future: getTotalsByCategory(),
        builder: (context, AsyncSnapshot<Map<String, double>> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          var map = snapshot.data!;
          return ListView(
            children: map.entries
                .map(
                  (e) => Card(
                      child: ListTile(
                    title: Text(e.key),
                    trailing: Text(e.value.toStringAsFixed(2)),
                  )),
                )
                .toList(),
          );
        },
      ),
    );
  }
}
