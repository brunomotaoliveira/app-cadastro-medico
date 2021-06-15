import 'package:app_cadastro_medico/models/user_medico.dart';
import 'package:app_cadastro_medico/provider/medicos.dart';
import 'package:app_cadastro_medico/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MedicoUserTile extends StatelessWidget {
  const MedicoUserTile(this.medico);

  final Medico medico;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(medico.nomeDoMedico),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('CRM: ${medico.crm}'),
          Text('Valor da Consulta: R\$ ${medico.valorDaConsulta}')
        ],
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.USER_FORM,
                  arguments: medico,
                );
              },
              icon: Icon(Icons.edit),
              color: Colors.orange,
            ),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Excluir Usuário'),
                    content: Text('Tem certeza???'),
                    actions: <Widget>[
                      // ignore: deprecated_member_use
                      FlatButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: Text('Não'),
                      ),
                      // ignore: deprecated_member_use
                      FlatButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: Text('Sim'),
                      ),
                    ],
                  ),
                ).then((confirmed) {
                  if (confirmed) {
                    Provider.of<Medicos>(context, listen: false).remove(medico);
                  }
                });
              },
              icon: Icon(Icons.delete),
              color: Colors.red,
            )
          ],
        ),
      ),
      isThreeLine: true,
    );
  }
}
