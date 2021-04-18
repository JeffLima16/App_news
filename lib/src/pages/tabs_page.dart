import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _NavegacaoModel(),
      child: Scaffold(
        body: _Paginas(),
        bottomNavigationBar: _Navegacao(),
      ),
    );
  }
}

class _Navegacao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacaoModel = Provider.of<_NavegacaoModel>(context);

    return BottomNavigationBar(
        currentIndex: navegacaoModel.paginaAtual,
        onTap: (i) => navegacaoModel.paginaAtual = i,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'Para você'),
          BottomNavigationBarItem(icon: Icon(Icons.public), label: 'Catalogos'),
        ]);
  }
}

class _Paginas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacaoModel = Provider.of<_NavegacaoModel>(context);

    return PageView(
      controller: navegacaoModel.pageController,
      //physics: BouncingScrollPhysics(),
      physics: NeverScrollableScrollPhysics(),
      children: [
        Container(
          color: Colors.green,
        ),
        Container(
          color: Colors.red,
        ),
      ],
    );
  }
}

class _NavegacaoModel with ChangeNotifier {
  int _paginaAtual = 0;
  PageController _pageController = new PageController();

  int get paginaAtual => this._paginaAtual;

  set paginaAtual(int valor) {
    this._paginaAtual = valor;

    _pageController.animateToPage(valor,
        duration: Duration(milliseconds: 400), curve: Curves.easeInOut);

    notifyListeners();
  }

  PageController get pageController => this._pageController;
}
