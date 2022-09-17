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

Offset _offset = Offset.zero;

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onPanUpdate: (details) {
          setState(() => _offset += details.delta);
        },
        child: Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateX(_offset.dy * pi / 180)
            ..rotateY(_offset.dx * pi / 180),
          alignment: Alignment.center,
          child: const Center(
            child: Cube3D(),
          ),
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

        ///Sarboard
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

        ///FRONT
        Transform(
          transform: Matrix4.identity()..translate(0.0, 0.0, -100.0),
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
