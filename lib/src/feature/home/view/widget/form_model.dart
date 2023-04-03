import 'package:flutter/material.dart';

class FormModel extends StatefulWidget {
  List<String> options = [];

  FormModel({
    super.key,
    required this.options,
  });

  @override
  State<FormModel> createState() => _FormModelState();
}

class _FormModelState extends State<FormModel> {
  @override
  Widget build(BuildContext context) {
    late String selectedOption = options[0];
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DropdownButtonFormField<String>(
                value: selectedOption,
                items: options.map((option) {
                  return DropdownMenuItem<String>(
                    value: option,
                    child: Text(option),
                  );
                }).toList(),
                onChanged: (selectedOption) {
                  setState(() {
                    selectedOption = selectedOption!;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Selecione uma opção',
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // faz algo com a opção selecionada
                },
                child: const Text('Enviar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
