import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleController;
  final valueController;

  TransactionForm(this.titleController, this.valueController);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: 'Titulo',
              ),
            ),
            TextField(
              controller: valueController,
              decoration: InputDecoration(
                hintText: 'Valor (R\$)',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                  onPressed: () {
                    print(titleController.text);
                    print(valueController.text);
                  },
                  child: Text('Nova Transação'),
                  textColor: Colors.purple,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
