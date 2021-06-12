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
}
