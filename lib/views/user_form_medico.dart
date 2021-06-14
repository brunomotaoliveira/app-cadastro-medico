import 'dart:ffi';

import 'package:app_cadastro_medico/models/user_medico.dart';
import 'package:app_cadastro_medico/provider/medicos.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MedicoForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {};

  void _loadFormData(Medico medico) {
    _formData['id'] = medico.id;
    _formData['nomeDoMedico'] = medico.nomeDoMedico;
    _formData['crm'] = medico.crm;
    _formData['valorDaConsulta'] = medico.valorDaConsulta;
    _formData['endereco'] = medico.endereco;
    _formData['telefone'] = medico.telefone;
  }

  @override
  Widget build(BuildContext context) {
    final medico = ModalRoute.of(context)!.settings.arguments as Medico;

    _loadFormData(medico);

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
                initialValue: _formData['nomeDoMedico'],
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
                initialValue: _formData['crm'],
                decoration: InputDecoration(labelText: 'CRM'),
                onSaved: (value) => _formData['crm'] = value!,
              ),
              TextFormField(
                initialValue: _formData['valorDaConsulta'].toString(),
                decoration: InputDecoration(labelText: 'Valor da Consulta'),
                onSaved: (value) => _formData['valorDaConsulta'] = value!,
              ),
              TextFormField(
                initialValue: _formData['endereco'],
                decoration: InputDecoration(labelText: 'Endereço'),
                onSaved: (value) => _formData['endereco'] = value!,
              ),
              TextFormField(
                initialValue: _formData['telefone'],
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
