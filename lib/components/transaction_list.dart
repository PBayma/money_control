import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_control/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 380,
        child: transactions.isEmpty
            ? Column(
                children: [
                  SizedBox(height: 20),
                  Text(
                    'Nenhuma transação cadastradas',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              )
            : ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (ctx, index) {
                  final transaction = transactions[index];

                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 8,
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        foregroundColor: Colors.white,
                        backgroundColor: Theme.of(context).primaryColor,
                        radius: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: FittedBox(
                            child: Text('R\$${transaction.value}'),
                          ),
                        ),
                      ),
                      title: Text(
                        transaction.title,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      subtitle:
                          Text(DateFormat('d MMM y').format(transaction.date)),
                    ),
                  );
                },
              ));
  }
}
