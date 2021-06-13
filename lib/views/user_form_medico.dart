import 'package:app_cadastro_medico/models/user_medico.dart';
import 'package:app_cadastro_medico/provider/medicos.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MedicoForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

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
                Provider.of<Medicos>(context, listen: false).put(
                  Medico(
                    id: _formData['id'].toString(),
                    nomeDoMedico: _formData['nomeDoMedico'].toString(),
                    crm: _formData['crm'].toString(),
                    endereco: _formData['endereco'].toString(),
                    telefone: _formData['telefone'].toString(),
                    valorDaConsulta:
                        double.parse(_formData['valorDaConsulta'].toString()),
                  ),
                );
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
                onSaved: (value) => _formData['nomeDoMedico'] = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'CRM'),
                onSaved: (value) => _formData['crm'] = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Valor da Consulta'),
                onSaved: (value) => _formData['valorDaConsulta'] = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Endereço'),
                onSaved: (value) => _formData['endereco'] = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Telefone'),
                onSaved: (value) => _formData['telefone'] = value!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
