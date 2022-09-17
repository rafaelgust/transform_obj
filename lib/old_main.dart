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
  double pi = 3.1415926535897932;

  double x = 0;
  double y = 0;
  double z = 0;

  _changeX(double value) => setState(() => x = value);
  _changeY(double value) => setState(() => y = value);
  _changeZ(double value) => setState(() => z = value);

  Offset _offset = Offset.zero;
  Offset _offsetB = Offset.zero;
  Offset _offsetG = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Transform.translate(
                  offset: _offset,
                  child: Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateX(x)
                      ..rotateY(y)
                      ..rotateZ(z),
                    alignment: FractionalOffset.center,
                    child: Material(
                      elevation: 1,
                      child: Container(
                        color: Colors.red,
                        width: double.infinity,
                        height: 200.0,
                        child: Stack(
                          children: [
                            BoxTransform(
                              size: 150,
                              color: Colors.blue,
                              position: _offsetB,
                              elevation: 2,
                            ),
                            BoxTransform(
                              size: 100,
                              color: Colors.green,
                              position: _offsetG,
                              elevation: 3,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              const Divider(),
              Slider(value: x, min: -pi, max: pi, onChanged: _changeX),
              Slider(value: y, min: -pi, max: pi, onChanged: _changeY),
              Slider(value: z, min: -pi, max: pi, onChanged: _changeZ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onPanUpdate: (details) =>
                        setState(() => _offsetG += details.delta),
                    child: Container(
                      color: Colors.green,
                      padding: const EdgeInsets.all(10.0),
                      height: 40,
                      child: const Center(
                        child: Text(
                          'Press and move here',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onPanUpdate: (details) =>
                        setState(() => _offsetB += details.delta),
                    child: Container(
                      color: Colors.blue,
                      padding: const EdgeInsets.all(10.0),
                      height: 40,
                      child: const Center(
                        child: Text(
                          'Press and move here',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onPanUpdate: (details) =>
                        setState(() => _offset += details.delta),
                    child: Container(
                      color: Colors.red,
                      padding: const EdgeInsets.all(10.0),
                      height: 40,
                      child: const Center(
                        child: Text(
                          'Press and move here',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class BoxTransform extends StatelessWidget {
  final double size;
  final double elevation;
  final Color color;
  final Offset position;
  const BoxTransform({
    Key? key,
    required this.size,
    required this.color,
    required this.position,
    required this.elevation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: position,
      child: Material(
        elevation: elevation,
        child: Container(
          width: size,
          height: size,
          color: color,
        ),
      ),
    );
  }
}
