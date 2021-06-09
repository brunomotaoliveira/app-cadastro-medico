import 'package:app_cadastro_medico/data/dummy_users.dart';
import 'package:flutter/material.dart';

class ListaMedico extends StatelessWidget {
  const ListaMedico({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const medicos = {...DUMMY_USERS};

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Médicos'),
      ),
      body: ListView.builder(
        itemCount: medicos.length,
        itemBuilder: (contexto, indice) =>
            Text(medicos.values.elementAt(indice).nomeDoMedico),
      ),
    );
  }
}
