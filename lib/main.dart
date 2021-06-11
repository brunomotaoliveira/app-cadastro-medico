import 'package:app_cadastro_medico/provider/medicos.dart';
import 'package:app_cadastro_medico/views/user_list_medico.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Medicos(),
          child: MaterialApp(
        title: 'CadMedicos',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ListaMedico(),
      ),
    );
  }
}
