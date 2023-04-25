import 'package:checkpoint_naomi/Contato.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Checkpoint extends StatefulWidget {
  const Checkpoint({Key? key}) : super(key: key);

  @override
  State<Checkpoint> createState() => _CheckpointState();
}

class _CheckpointState extends State<Checkpoint> {
  int cont = 0;
  final contatos = [
    Contato(nome: "Luana Dias", 
    email: 'luana@fiap.com', 
    favoritado: false),
    Contato(
        nome: "Alice O. Austin",
        email: 'AliceOAustin@rhyta.com',
        favoritado: false),
    Contato(
        nome: "Douglas R. Broadway",
        email: 'DouglasRBroadway@dayrep.com',
        favoritado: false),
    Contato(
      nome: "John Doe", 
      email: 'john_doeoe@gmail.com', 
      favoritado: false),
    Contato(
        nome: "Matheus R. Broadway",
        email: 'mbroadway@dayrep.com',
        favoritado: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contatos Favoritos $cont'),
      ),
      body: ListView.builder(
        itemCount: contatos.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage:
                  NetworkImage('https://i.pravatar.cc/150?img=$index'),
            ),
            title: Text(contatos[index].nome),
            subtitle: Text(contatos[index].email),
            trailing: IconButton(
            icon: contatos[index].favoritado?  Icon(Icons.favorite, color: Colors.red,): 
             Icon(Icons.favorite_border),
                onPressed: () {
                  setState(() {
                    if (contatos[index].favoritado == true) {
                      contatos[index].favoritado = false;
                      cont--;
                    } else {
                      contatos[index].favoritado = true;
                      cont++;
                    }
                  });
                }),
          );
        },
      ),
    );
  }
}
