import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 3D',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _rx = 0.0, _ry = 0.0, _rz = 0.0;

  _change(double value, {required int type}) {
    if (type == 0) {
      setState(() => _rx = value);
    } else if (type == 1) {
      setState(() => _ry = value);
    } else if (type == 2) {
      setState(() => _rz = value);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateX(_ry)
                ..rotateY(_rx)
                ..rotateZ(_rz),
              alignment: Alignment.center,
              child: const Cube3D(),
            ),
            const Spacer(),
            Slider(
              min: pi * -2,
              max: pi * 2,
              value: _rx,
              onChanged: (value) => _change(value, type: 0),
            ),
            Slider(
              min: pi * -2,
              max: pi * 2,
              value: _ry,
              onChanged: (value) => _change(value, type: 1),
            ),
            Slider(
              min: pi * -2,
              max: pi * 2,
              value: _rz,
              onChanged: (value) => _change(value, type: 2),
            ),
          ],
        ),
      ),
    );
  }
}

class Cube3D extends StatelessWidget {
  const Cube3D({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //BOTTOM
        Transform(
          transform: Matrix4.identity()
            ..translate(0.0, 100.0, 0.0)
            ..rotateX(-pi / 2),
          alignment: Alignment.center,
          child: Container(
            color: Colors.black,
            child: const FlutterLogo(size: 200),
          ),
        ),

        ///PORT
        Transform(
          transform: Matrix4.identity()
            ..translate(-100.0, 0.0, 0.0)
            ..rotateY(pi / 2),
          alignment: Alignment.center,
          child: Container(
            color: Colors.black,
            child: const FlutterLogo(size: 200),
          ),
        ),

        ///FRONT
        Transform(
          transform: Matrix4.identity()..translate(0.0, 0.0, -100.0),
          alignment: Alignment.center,
          child: Container(
            color: Colors.black,
            child: const FlutterLogo(size: 200),
          ),
        ),

        ///STARBOARD
        Transform(
          transform: Matrix4.identity()
            ..translate(100.0, 0.0, 0.0)
            ..rotateY(-pi / 2),
          alignment: Alignment.center,
          child: Container(
            color: Colors.black,
            child: const FlutterLogo(size: 200),
          ),
        ),

        ///TOP
        Transform(
          transform: Matrix4.identity()
            ..translate(0.0, -100.0, 0.0)
            ..rotateX(pi / 2),
          alignment: Alignment.center,
          child: Container(
            color: Colors.black,
            child: const FlutterLogo(size: 200),
          ),
        ),

        ///OUT
        Transform(
          transform: Matrix4.identity()
            ..translate(-100.0, 0.0, 200.0)
            ..rotateY(pi / 1.5),
          alignment: Alignment.center,
          child: Container(
            color: Colors.black,
            child: const FlutterLogo(size: 200),
          ),
        ),
      ],
    );
  }
}
