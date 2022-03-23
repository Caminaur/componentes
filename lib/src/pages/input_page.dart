import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';
  String _email = '';
  String _fecha = '';

  String _opcionSeleccionada = 'Volar';

  List<String> _poderes = ['Volar', 'Rayos X', 'Super Aliento', 'Super Fuerza'];

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs de texto'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropdown(),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        counter: Text('Cantidad de letras: ${_nombre.length}'),
        hintText: 'Nombre de la persona',
        labelText: 'Nombre',
        helperText: 'Sólo ingrese su nombre',
        suffixIcon: Icon(
          Icons.accessibility,
          size: 35.0,
        ),
        icon: Icon(
          Icons.account_circle,
          size: 35.0,
        ),
      ),
      onChanged: (v) {
        setState(() {
          _nombre = v;
        });
      },
    );
  }

  _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        hintText: 'Email',
        labelText: 'Email',
        suffixIcon: Icon(
          Icons.alternate_email,
          size: 35.0,
        ),
        icon: Icon(
          Icons.email,
          size: 35.0,
        ),
      ),
      onChanged: (v) => setState(() {
        _email = v;
      }),
    );
  }

  Widget _crearPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        hintText: 'Password',
        labelText: 'Password',
        suffixIcon: Icon(
          Icons.lock_open,
          size: 35.0,
        ),
        icon: Icon(
          Icons.lock,
          size: 35.0,
        ),
      ),
      // onChanged: (v) => setState(() {
      //   _email = v;
      // }),
    );
  }

  _crearFecha(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        hintText: 'Fecha de nacimiento',
        labelText: 'Fecha de nacimiento',
        suffixIcon: Icon(
          Icons.perm_contact_calendar,
          size: 35.0,
        ),
        icon: Icon(
          Icons.calendar_today,
          size: 35.0,
        ),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
      // onChanged: (v) => setState(() {
      //   _email = v;
      // }),
    );
  }

  List<DropdownMenuItem<String>> getOpcionesDropDown() {
    // ignore: deprecated_member_use
    List<DropdownMenuItem<String>> lista = [];

    _poderes.forEach((poder) {
      lista.add(new DropdownMenuItem(
          child: Text(poder, style: TextStyle(fontSize: 18.0)), value: poder));
    });

    return lista;
  }

  Widget _crearDropdown() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all, size: 35.0),
        SizedBox(width: 20.0),
        Expanded(
          child: DropdownButton(
              value: _opcionSeleccionada,
              items: getOpcionesDropDown(),
              onChanged: (opt) {
                setState(() {
                  _opcionSeleccionada = opt.toString();
                });
              }),
        )
      ],
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2025),
      locale: Locale('es', 'ES'),
    );
    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        List prueba = picked.toString().split(' ')[0].split('-');
        _fecha = prueba[2] + '/' + prueba[1] + '/' + prueba[0];
        _inputFieldDateController.text = _fecha;
      });
    }
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('Tu nombre es: $_nombre'),
      subtitle: Text('Email: $_email'),
      trailing: Text('Poder $_opcionSeleccionada'),
    );
  }
}
