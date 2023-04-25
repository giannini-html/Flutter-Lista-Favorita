import 'package:checkpoint2/contato.dart';
import 'package:flutter/material.dart';

class Lista extends StatefulWidget {
  const Lista({
    Key? key,
  }) : super(key: key);

  @override
  State<Lista> createState() => _ListaState();
}

class _ListaState extends State<Lista> {
      int qtdFav = 0;

    List<Contato> contatos = [
      Contato('Gustavo Giannini', 'gustavo@email.com'),
      Contato('Marcos', 'marcos@email.com'),
      Contato('Maria', 'maria@email.com'),
      Contato('João', 'joao@email.com'),
      Contato('Roberta', 'roberta@email.com')
    ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contatos Favoritos $qtdFav'),
      ),
      body: ListView.builder(
        itemCount: contatos.length,
        itemBuilder: (context, index) {
          return ListTile(
            // ignore: prefer_const_constructors
            leading: CircleAvatar(
              backgroundImage: 
                NetworkImage('https://i.pravatar.cc/145?img=?'),
            ),
            title: Text(
              contatos.elementAt(index).nome,
            ),
            subtitle: Text(
              contatos.elementAt(index).email,
            ),
            trailing: IconButton(
              icon: Icon(contatos[index].isSelected 
              ? Icons.favorite_border 
              : Icons.favorite),
              onPressed: () {
                setState(() {
                  if (contatos[index].isSelected) {
                    contatos[index].isSelected = false;
                    qtdFav--;
                  } else {
                    contatos[index].isSelected = true;
                    qtdFav++;
                  }
                });
              },
            ),
          );
        },
      ),
    );
  }
}
