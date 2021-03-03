import 'package:flutter/material.dart';
import 'package:money_control/components/adaptative_date_picker.dart';
import 'package:money_control/components/adaptative_text_field.dart';
import 'adaptative_button.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text.replaceFirst(',', '.'));

    if (title.isEmpty || value <= 0 || _selectedDate == null) {
      return;
    }

    widget.onSubmit(title, value, _selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Padding(
          padding: EdgeInsets.only(
              top: 10,
              right: 10,
              left: 10,
              bottom: 10 + MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            children: [
              AdaptativeTextField(
                controller: _titleController,
                onSubmitted: (_) => _submitForm(),
                label: 'Titulo',
              ),
              AdaptativeTextField(
                controller: _valueController,
                label: 'Valor (R\$) 00.00',
                onSubmitted: (_) => _submitForm(),
                textInputType: TextInputType.numberWithOptions(decimal: true),
              ),
              //Novo componente
              AdaptativeDatePicker(
                onDateChanged: (newDate) {
                  setState(() {
                    _selectedDate = newDate;
                  });
                },
                selectedDate: _selectedDate,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AdaptativeButton(
                    onPressed: () => _submitForm(),
                    label: 'Nova Transação',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
