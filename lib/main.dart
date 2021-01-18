import 'package:flutter/material.dart';
import 'package:money_control/components/transaction_form.dart';
import 'package:money_control/components/transaction_list.dart';
import 'package:money_control/models/transaction.dart';

main() {
  runApp(MoneyControlApp());
}

class MoneyControlApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  final _transactions = [
    Transaction(
      id: 't1',
      title: 'Novo Tenis de corrida',
      value: 310.76,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Conta de Luz',
      value: 211.30,
      date: DateTime.now(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Despesas Pessoais'),
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text(
                  'Gráfico',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
                elevation: 5,
              ),
            ),
            TransactionList(_transactions),
            TransactionForm(titleController, valueController)
          ],
        ));
  }
}
