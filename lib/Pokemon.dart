import 'dart:math';
import 'package:flutter/material.dart';

class Pokemon extends StatefulWidget {
  const Pokemon({Key? key}) : super(key: key);

  @override
  State<Pokemon> createState() => PokemonState();
}

class PokemonState extends State<Pokemon> with SingleTickerProviderStateMixin {
  bool isJumping = false;

  void jump() {
    setState(() {
      isJumping != isJumping;
      _controller.forward().then((_)=>_controller.reverse()).then((_){isJumping=false;});
    });
  }

  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 1000),
    vsync: this,
  );
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: const Offset(0, 0),
    end: const Offset(0, -10),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.linear,
  ));

  @override
  Widget build(BuildContext context) {
    if (isJumping) {
      return SlideTransition(
        position: _offsetAnimation,
        child: Container(
            width: 100.0,
            height: 100.0,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill, image: AssetImage('assets/jump.png')))),
      );
    } else {
      return SlideTransition(
        position: _offsetAnimation,
        child: Container(
            width: 100.0,
            height: 100.0,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill, image: AssetImage('assets/stay.png')))),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

}
