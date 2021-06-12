import 'dart:math';

import 'package:app_cadastro_medico/data/dummy_users.dart';
import 'package:app_cadastro_medico/models/user_medico.dart';
import 'package:flutter/material.dart';

class Medicos with ChangeNotifier {
  final Map<String, Medico> _items = {...DUMMY_USERS};

  List<Medico> get all {
    return [..._items.values];
  }

  //retorna quantos elementos tem dentro da lista
  int get count {
    return _items.length;
  }

  Medico byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(Medico medico) {
    // ignore: unnecessary_null_comparison
    if (medico == null) {
      return;
    }

    if (medico.id.trim().isNotEmpty && _items.containsKey(medico.id)) {
      _items.update(
        medico.id,
        (_) => Medico(
          id: medico.id,
          crm: medico.crm,
          nomeDoMedico: medico.nomeDoMedico,
          endereco: medico.endereco,
          telefone: medico.telefone,
          valorDaConsulta: medico.valorDaConsulta,
        ),
      );
    } else {
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
        id,
        () => Medico(
          id: id,
          crm: medico.crm,
          nomeDoMedico: medico.nomeDoMedico,
          endereco: medico.endereco,
          telefone: medico.telefone,
          valorDaConsulta: medico.valorDaConsulta,
        ),
      );
    }
    notifyListeners();
  }
}
