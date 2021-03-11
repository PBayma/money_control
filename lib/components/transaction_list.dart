import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_control/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  TransactionList(this.transactions, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (context, constraints) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(height: constraints.maxHeight * 0.03),
                    Container(
                      height: constraints.maxHeight * 0.15,
                      child: Text(
                        'Nenhuma transação cadastradas',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    SizedBox(height: constraints.maxHeight * 0.03),
                    Container(
                      height: constraints.maxHeight * 0.60,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                ),
              ],
            );
          })
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
                    foregroundColor: Theme.of(context).textTheme.button.color,
                    backgroundColor: Theme.of(context).primaryColor,
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: FittedBox(
                        child: Text('R\$${transaction.value}'),
                      ),
                    ),
                  ),
                  trailing: MediaQuery.of(context).size.width > 480
                      ? FlatButton.icon(
                          icon: const Icon(Icons.delete),
                          label: const Text('Excluir'),
                          textColor: Theme.of(context).errorColor,
                          onPressed: () => onRemove(transaction.id),
                        )
                      : IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Theme.of(context).errorColor,
                          ),
                          onPressed: () => onRemove(transaction.id),
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
          );
  }
}
