/*
  MAD201 - Project 1
  Your Name - Student ID
  Home dashboard - shows totals and navigation
*/
import 'package:flutter/material.dart';
import 'add_transaction_screen.dart';
import 'transactions_list_screen.dart';

class HomeDashboard extends StatelessWidget {
  const HomeDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Dashboard"),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2193b0), Color(0xFF6dd5ed)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.account_balance_wallet,
                size: 60, color: Colors.white),
            const SizedBox(height: 20),
            Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: Colors.white.withOpacity(0.95),
              margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
              child: const Padding(
                padding: EdgeInsets.all(18),
                child: Column(
                  children: [
                    Text(
                      "Balance: 0.00",
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Income: 0",
                            style:
                                TextStyle(fontSize: 16, color: Colors.green)),
                        Text("Expense: 0",
                            style: TextStyle(fontSize: 16, color: Colors.red)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                backgroundColor: Colors.blueAccent,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const AddTransactionScreen()));
              },
              child:
                  const Text("Add Transaction", style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                backgroundColor: Colors.lightBlue,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const TransactionsListScreen()));
              },
              child: const Text("View Transactions",
                  style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
