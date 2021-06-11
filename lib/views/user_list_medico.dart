import 'package:app_cadastro_medico/components/user_tile_medico.dart';
import 'package:app_cadastro_medico/data/dummy_users.dart';
import 'package:flutter/material.dart';

class ListaMedico extends StatelessWidget {
  const ListaMedico({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final medicos = {...DUMMY_USERS};

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Lista de Médicos')),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.refresh),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: medicos.length,
        itemBuilder: (contexto, indice) =>
            MedicoUserTile(medicos.values.elementAt(indice)),
      ),
    );
  }
}
