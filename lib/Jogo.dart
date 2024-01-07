import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  const Jogo({super.key});

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _imagemApp = AssetImage('images/padrao.png');
  String _mensagem = 'Escolha uma opção abaixo:';

  void _opcaoSelecionada(String escolhaUsuario){

    List<String> opcoes = ['pedra', 'papel', 'tesoura'];
    var indexOpcao = Random().nextInt(opcoes.length);
    var escolhaApp = opcoes[indexOpcao];

    // Exibição da imagem escolhida pelo App.
    switch( escolhaApp ){
      case 'pedra' :
        setState(() {
          _imagemApp = AssetImage('images/pedra.png');
        });
        break;
      case 'papel' :
        setState(() {
          _imagemApp = AssetImage('images/papel.png');
        });
        break;
      case 'tesoura' :
        setState(() {
          _imagemApp = AssetImage('images/tesoura.png');
        });
        break;
    }

    // Validação Ganhador
    if(escolhaUsuario == 'pedra' && escolhaApp == 'tesoura'){
      setState(() {
        this._mensagem = 'Você ganhou!!';
      });
    }else if(escolhaUsuario == 'tesoura' && escolhaApp == 'papel'){
      setState(() {
        this._mensagem = 'Você ganhou!!';
      });
    }else if(escolhaUsuario == 'papel' && escolhaApp == 'pedra'){
      setState(() {
        this._mensagem = 'Você ganhou!!';
      });
    }

    // Validação Perdedor
    if(escolhaUsuario == 'tesoura' && escolhaApp == 'pedra'){
      setState(() {
        this._mensagem = 'Você perdeu :(';
      });
    }else if(escolhaUsuario == 'papel' && escolhaApp == 'tesoura'){
      setState(() {
        this._mensagem = 'Você perdeu :(';
      });
    }else if(escolhaUsuario == 'pedra' && escolhaApp == 'papel'){
      setState(() {
        this._mensagem = 'Você perdeu :(';
      });
    }

    // Validação Empate
    if(escolhaUsuario == escolhaApp){
      setState(() {
        this._mensagem = 'Empate! Jogue novamente';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('JokenPo', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Escolha do Robô:'),
            SizedBox(height: 24),
            Image(image: this._imagemApp, width: 72),
            SizedBox(height: 24),
            Text(this._mensagem),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(    // Classe GestureDetector() p/ rastrear cliques do usuário sobre o elemento.
                  onTap: () => _opcaoSelecionada('pedra'),
                  child: Image.asset('images/pedra.png', width: 72),
                ),
                GestureDetector(
                  onTap: () => _opcaoSelecionada('papel'),
                  child: Image.asset('images/papel.png', width: 72),
                ),
                GestureDetector(
                  onTap: () => _opcaoSelecionada('tesoura'),
                  child: Image.asset('images/tesoura.png', width: 72),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightBlueAccent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('Início', style: TextStyle(color: Colors.white)),
            Text('Menu', style: TextStyle(color: Colors.white)),
            Text('Config', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
