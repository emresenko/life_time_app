import 'dart:ffi';

import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  Color? renk;
  Widget? child;
  var onPress;

  @override
  MyContainer({this.renk = Colors.white, this.child, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: onPress ,
      child: Container(
        alignment: AlignmentDirectional.center,
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: renk,
        ),
        child: child,
      ),
    );
  }
}

