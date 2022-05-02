import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ripple_animation/ripple_animation.dart';

class CustomButtonWdg extends StatefulWidget {
  int duration;
  CustomButtonWdg(this.duration,{Key? key}) : super(key: key);

  @override
  _CustomButtonWdgState createState() => _CustomButtonWdgState();
}

class _CustomButtonWdgState extends State<CustomButtonWdg> {
  Key? _key;
  late Timer _timer;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (td){
        _timer.cancel();
      },
      onTapDown: (_){
        _timer = Timer(Duration(milliseconds: widget.duration),(){
          setState(() {
            _key = UniqueKey();
          });

        });
      },
        //onLongPress: ()=>null,
        onTap: ()=>null,
          child:_key!=null? RippleAnimation(
            key: _key,
          child: Material(
            elevation: 10,
            borderRadius: BorderRadius.all(Radius.circular(50)),
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.pink
              ),
            ),
          )

    ):Material(
            elevation: 10,
            borderRadius: BorderRadius.all(Radius.circular(50)),
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.pink
              ),
            ),
          ));
  }
}
