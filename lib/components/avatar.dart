import 'package:flutter/material.dart';

class AvatarScreen extends StatelessWidget {
  const AvatarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hero Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Hero(
                tag: "avatar",
                child: Expanded(
                  flex: 1,
                  child: Container(
                    height: 400,
                    child:
                    AspectRatio(
                      aspectRatio: 1,
                      child: Image.network(
                          "https://upload.wikimedia.org/wikipedia/commons/d/db/Google_Translate_Icon.png"),
                    ),
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}

class CustomPageRoute<T> extends PageRoute<T> {
  final Widget child;

  CustomPageRoute(this.child);

  @override
  Color get barrierColor => Colors.black;

  @override
  String get barrierLabel => '';

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 500);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}