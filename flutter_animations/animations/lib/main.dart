import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(Animation());

class Animation extends StatelessWidget {
  const Animation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimationState(),
    );
  }
}

class AnimationState extends StatefulWidget {
  const AnimationState({Key? key}) : super(key: key);

  @override
  _AnimationStateState createState() => _AnimationStateState();
}

class _AnimationStateState extends State<AnimationState>
    with SingleTickerProviderStateMixin {
  int tabsController = 0;
  int doubleTabsController = 0;
  int longPressController = 0;
  double xPosition = 0.0;
  double yPosition = 0.0;
  double boxSize = 75.0;
  double fullBoxSize = 150.0;

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    if (xPosition == 0.0) {
      centerBox(context);
    }
    return Scaffold(
      backgroundColor: Colors.green[300],
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        title: Text(
          "Animations Game",
          style: TextStyle(color: Colors.amber),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            tabsController++;
          });
        },
        onDoubleTap: () {
          setState(() {
            doubleTabsController++;
          });
        },
        onLongPress: () {
          setState(() {
            longPressController++;
          });
        },
        onVerticalDragUpdate: (DragUpdateDetails value) {
          setState(() {
            double delta = value.delta.dy;
            yPosition += delta;
          });
        },
        onHorizontalDragUpdate: (DragUpdateDetails value) {
          setState(() {
            double delta = value.delta.dx;
            xPosition += delta;
          });
        },
        child: Stack(
          children: [
            Positioned(
                top: 0,
                left: 0,
                child: Container(
                  width: boxSize,
                  height: boxSize,
                  color: Colors.amberAccent,
                ))
          ],
        ),
      ),
      bottomNavigationBar: Material(
        color: Colors.blue,
        child: Text(
            "Tab :$tabsController Double Tab :$doubleTabsController Long Press :$longPressController"),
      ),
    );
  }

  void centerBox(BuildContext context) {
    xPosition = MediaQuery.of(context).size.width / 2.0 - boxSize / 2.0;
    yPosition = MediaQuery.of(context).size.height / 2.0 - boxSize / 2.0 - 30;

    setState(() {
      this.xPosition = xPosition;
      this.yPosition = yPosition;
    });
  }
}
