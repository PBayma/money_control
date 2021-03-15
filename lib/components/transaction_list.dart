import 'package:flutter/material.dart';
import 'package:money_control/components/transaction_item.dart';
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

              return TransactionItem(
                transaction: transaction,
                onRemove: onRemove,
              );
            },
          );
  }
}
