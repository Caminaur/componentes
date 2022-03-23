import 'package:flutter/material.dart';

import 'dart:async';
import 'dart:math';

class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  double _widht = 50.0;
  double _height = 50.0;
  Color _color = Colors.pink;
  var _play = false;
  Timer? t;

  BorderRadiusGeometry _borderRadius = new BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          width: _widht,
          height: _height,
          decoration: BoxDecoration(
            borderRadius: _borderRadius,
            color: _color,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: _modify,
      ),
    );
  }

  _modify() {
    _play = !_play;
    if (_play) {
      t = Timer.periodic(
        Duration(milliseconds: 1000),
        (_) => _changeShape(),
      );
    } else {
      t?.cancel();
    }
  }

  _changeShape() {
    setState(() {
      final _random = Random();
      _widht = _random.nextInt(300).toDouble();
      _height = _random.nextInt(300).toDouble();
      _color = Color.fromRGBO(
        _random.nextInt(255),
        _random.nextInt(255),
        _random.nextInt(255),
        1,
      );
      _borderRadius = BorderRadius.circular(_random.nextInt(100).toDouble());
    });
  }
}
