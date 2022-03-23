import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final opciones = [
    'Uno',
    'Dos',
    'Tres',
    'Cuatro',
    'Cinco',
    'Seis',
    'Siete',
    'Ocho',
    'Nueve',
    'Diez'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.green.shade100,
      appBar: AppBar(
        // backgroundColor: Colors.green,
        title: Text('Componentes Temp'),
      ),
      body: ListView(
        // children: _crearItems(),
        children: _crearItemsCorto(),
      ),
    );
  }

  // List<Widget> _crearItems() {
  //   List<Widget> lista = [];

  //   for (String opt in opciones) {
  //     final tempWidget = ListTile(
  //       title: Text(opt),
  //     );

  //     lista
  //       ..add(tempWidget)
  //       ..add(Divider(
  //         color: Colors.indigo[200],
  //         height: 20.5,
  //         thickness: 1.5,
  //       ));
  //     // lista.add(Divider());
  //   }

  //   return lista;
  // }

  List<Widget> _crearItemsCorto() {
    return opciones.map((item) {
      return Column(
        children: [
          ListTile(
            title: Text(item + '!'),
            subtitle: Text('descripción'),
            leading: Icon(
              Icons.account_balance_wallet,
              color: Colors.red,
              size: 50,
            ),
            trailing: Icon(Icons.keyboard_arrow_right, color: Colors.black),
            onTap: () {},
          ),
          Divider(),
        ],
      );
    }).toList();

    //   List<Widget> _crearItemsCorto() {
    //   return opciones.map((item) {
    //     return Column(
    //       children: [
    //         ListTile(
    //           title: Text(item + '!',
    //               style: TextStyle(
    //                 color: Colors.white,
    //                 fontSize: 25.5,
    //                 shadows: <Shadow>[
    //                   Shadow(
    //                     offset: Offset(4.0, 4.0),
    //                     blurRadius: 3.0,
    //                     color: Colors.black87,
    //                   ),
    //                   Shadow(
    //                     offset: Offset(90.0, 10.0),
    //                     blurRadius: 8.0,
    //                     color: Color.fromARGB(125, 0, 0, 255),
    //                   ),
    //                 ],
    //               )),
    //           subtitle: Text('descripción',
    //               style: TextStyle(
    //                 fontWeight: FontWeight.bold,
    //                 color: Colors.indigo[800],
    //               )),
    //         ),
    //         Divider(),
    //       ],
    //     );
    //   }).toList();
    // }
  }
}
