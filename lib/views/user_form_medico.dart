import 'package:flutter/material.dart';

class MedicoForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario do Medico'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              final isValid = _form.currentState!.validate();

              if (isValid) {
                _form.currentState!.save();
                Navigator.of(context).pop();
              }
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return 'Nome Inválido';
                  }

                  if (value.trim().length < 3) {
                    return 'Nome muito pequeno. No mínimo 3 letras.';
                  }
                },
                onSaved: (value) {
                  print(value);
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'CRM'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Valor da Consulta'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Endereço'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Telefone'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
