import 'package:flutter/material.dart';

class AnimatedSquare extends AnimatedWidget {
  const AnimatedSquare({Key? key, required Animation<double> animation, required this.trigger}): super(key: key, listenable: animation);
  
  static final _tweenSize = Tween<double>(begin: 200, end: 400);
  static final _tweenMovement = Tween<double>(begin: 16, end: 100);
  static final _colorTween = ColorTween(begin: Colors.blue[400], end: Colors.grey[700]);

  final Function trigger;

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return SizedBox(
        height: 616,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: _tweenMovement.evaluate(animation), left: 16.0),
                  color: _colorTween.evaluate(animation),
                  height: _tweenSize.evaluate(animation),
                  width: _tweenSize.evaluate(animation),
                  child: MaterialButton(
                    onPressed: (){trigger();},
                    child: const Text('click me'),
                  )
                ),
              ],
            ),
          ],
        ),
      );
    }
}

class CustomAnimation extends StatefulWidget {
  final String title;

  CustomAnimation({Key? key, required this.title}) : super(key: key);

  @override
  _CustomAnimationState createState() => _CustomAnimationState();
}

class _CustomAnimationState extends State<CustomAnimation>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  bool clicked = false;
  void onClicked(){
    setState(() {
      clicked = !clicked;
    });
    if(clicked){
      controller.forward();
    }else {
      controller.reverse();
    }
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(seconds: 3), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeInOutCubicEmphasized);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AnimatedSquare(animation: animation, trigger: onClicked),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
