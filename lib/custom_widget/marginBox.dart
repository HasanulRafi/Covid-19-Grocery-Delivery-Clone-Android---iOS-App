import 'package:flutter/material.dart';

class BoxMargin extends StatelessWidget {
  final bool isVertical;
  final double multi;

  const BoxMargin({this.isVertical,this.multi = 2});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:  isVertical ? 0 : 8*multi,
      height: isVertical ? 8*multi: 0,
    );
  }
}
