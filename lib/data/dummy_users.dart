import 'package:app_cadastro_medico/models/user_medico.dart';

const DUMMY_USERS = {
  '1': const Medico(
      id: '1',
      crm: '0123456789',
      nomeDoMedico: 'Bruno Mota',
      endereco: 'Rua do Flutterando, Jardim Dart - Google',
      telefone: '(11)11111-1111',
      valorDaConsulta: 111.11),

  '2': const Medico(
      id: '2',
      crm: '2468101214',
      nomeDoMedico: 'Jessica',
      endereco: 'Rua do Flutterando, Jardim Dart - Google',
      telefone: '(11)22222-2222',
      valorDaConsulta: 222.23),

  '3': const Medico(
      id: '3',
      crm: '3691215180',
      nomeDoMedico: 'Carlos',
      endereco: 'Rua do Flutterando, Jardim Dart - Google',
      telefone: '(11)33333-3333',
      valorDaConsulta: 223.33),
      
  '4': const Medico(
      id: '4',
      crm: '4812162024',
      nomeDoMedico: 'Jose',
      endereco: 'Rua do Flutterando, Jardim Dart - Google',
      telefone: '(11)44444-4444',
      valorDaConsulta: 323.83)
};
