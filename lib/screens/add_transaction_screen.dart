/*
  MAD201 - Project 1
  Your Name - Ashishkumar Prajapati
  Add Transaction screen
*/
import 'package:flutter/material.dart';
import '../db_helper.dart';
import '../models/transaction.dart';

class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({super.key});

  @override
  _AddTransactionScreenState createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  final _formKey = GlobalKey<FormState>();
  String title = "", type = "Income", category = "General";
  double amount = 0.0;
  DateTime txDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Transaction")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: "Title"),
                onSaved: (v) => title = v ?? "",
                validator: (v) => v == null || v.isEmpty ? "Enter Title" : null,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Amount"),
                keyboardType: TextInputType.number,
                onSaved: (v) => amount = double.tryParse(v ?? "0") ?? 0.0,
                validator: (v) =>
                    v == null || v.isEmpty ? "Enter amount" : null,
              ),
              DropdownButtonFormField(
                initialValue: type,
                items: ["Income", "Expense"]
                    .map((t) => DropdownMenuItem(value: t, child: Text(t)))
                    .toList(),
                onChanged: (v) => setState(() {
                  type = v.toString();
                }),
                decoration: const InputDecoration(labelText: "Type"),
              ),
              DropdownButtonFormField(
                initialValue: category,
                items: ["General", "Food", "Bills", "Other"]
                    .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                    .toList(),
                onChanged: (v) => setState(() {
                  category = v.toString();
                }),
                decoration: const InputDecoration(labelText: "Category"),
              ),
              ListTile(
                title: Text(
                    "Date: ${txDate.toLocal().toIso8601String().split("T")[0]}"),
                trailing: const Icon(Icons.calendar_today),
                onTap: () async {
                  DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: txDate,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2099));
                  if (picked != null) setState(() => txDate = picked);
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Transaction tx = Transaction(
                      title: title,
                      amount: amount,
                      type: type,
                      category: category,
                      date: txDate,
                    );
                    await DBHelper().insertTransaction(tx);
                    Navigator.pop(context);
                  }
                },
                child: const Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
