import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/carrinho.dart';

class CarrinhoLista extends StatelessWidget {
  const CarrinhoLista({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('BUILD: CarrinhoLista');

    final carrinho = Provider.of<CarrinhoModel>(context);

    return ListView.builder(
      itemCount: carrinho.items.length,
      itemBuilder: (context, index) => ListTile(
        leading: Image(
          image: AssetImage(
            'images/${carrinho.items[index].imagem}.jpeg',
          ),
        ),
        trailing: IconButton(
          icon: const Icon(
            Icons.remove_circle_outline,
            color: Colors.red,
          ),
          onPressed: () {
            carrinho.remove(carrinho.items[index]);
          },
        ),
        title: Text(
          '${carrinho.items[index].nome}',
        ),
        subtitle: Text(
          'R\$ ${carrinho.items[index].preco}',
        ),
      ),
    );
  }
}
