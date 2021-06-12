import 'package:app_cadastro_medico/components/user_tile_medico.dart';
import 'package:app_cadastro_medico/provider/medicos.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListaMedico extends StatelessWidget {
  const ListaMedico({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Medicos medicos = Provider.of(context);

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
        itemCount: medicos.count,
        itemBuilder: (contexto, indice) =>
            MedicoUserTile(medicos.byIndex(indice)),
      ),
    );
  }
}
