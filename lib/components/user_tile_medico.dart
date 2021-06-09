import 'package:app_cadastro_medico/models/user_medico.dart';
import 'package:flutter/material.dart';

class MedicoUserTile extends StatelessWidget {
  const MedicoUserTile(this.medico);

  final Medico medico;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(medico.nomeDoMedico),
      subtitle: Text('CRM: ${medico.crm}'),
      trailing: Text(
        'Valor da Consulta: R\$ ${medico.valorDaConsulta}',
      ),
    );
  }
}
