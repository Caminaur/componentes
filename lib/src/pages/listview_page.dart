import 'dart:async';

import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  ScrollController _scrollController = new ScrollController();

  List<int> _listaNumeros = [];
  int _ultimoItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _agregar10();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: Stack(
        children: [
          _crearLista(),
          _crearLoading(),
        ],
      ),
    );
  }

  _crearLista() {
    return RefreshIndicator(
      edgeOffset: 120.0,
      strokeWidth: 4.0,
      onRefresh: () => _obtenerPagina1(),
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length,
        padding: EdgeInsets.all(0.0),
        itemBuilder: (BuildContext context, int index) {
          final imagen = _listaNumeros[index];

          return FadeInImage(
            placeholder: AssetImage('assets/loading-cat.gif'),
            image: NetworkImage('https://picsum.photos/450/350?random=$imagen'),
            fadeInDuration: Duration(milliseconds: 400),
          );
        },
      ),
    );
  }

  _agregar10() {
    for (int i = 1; i < 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }
    setState(() {});
  }

  Future<Null> fetchData() async {
    _isLoading = true;
    setState(() {});

    final duration = Duration(seconds: 2);

    new Timer(duration, respuestaHTTP);
  }

  void respuestaHTTP() {
    _isLoading = false;

    _scrollController.animateTo(
      _scrollController.position.pixels + 200,
      curve: Curves.easeIn,
      duration: Duration(milliseconds: 1000),
    );
    _agregar10();
  }

  _crearLoading() {
    if (_isLoading) {
      return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(strokeWidth: 8.0),
              ],
            ),
            SizedBox(height: 25.0),
          ]);
    } else {
      return Container();
    }
  }

  Future<Null> _obtenerPagina1() async {
    final duration = new Duration(milliseconds: 1500);

    new Timer(duration, () {
      _listaNumeros.clear();
      _ultimoItem++;
      _agregar10();
    });

    return Future.delayed(duration);
  }
}
