import 'dart:ui';
import 'package:flutter/material.dart';
import 'model.dart';

class Divider extends StatefulWidget {

  final DividerStyle style;
  final DividerOrientation orientation;
  final Color color;

  Divider({
    Key? key, 
    this.style = DividerStyle.SOLID, 
    this.orientation = DividerOrientation.HORIZONTAL, 
    this.color = Colors.grey,
  }) : super(key: key);

  @override
  _DividerState createState() => _DividerState();
}

class _DividerState extends State<Divider> {
  _DividerState();

  @override
  Widget build(BuildContext context) {

    if(widget.style == DividerStyle.SOLID) {
      if (widget.orientation == DividerOrientation.HORIZONTAL) {

      }
      else {
        return VerticalDivider(
          width: 1,
          thickness: 1,
          color: widget.color,
        );
      }
    }
    if (widget.orientation == DividerOrientation.HORIZONTAL) {
      return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints){
          final boxWidth = constraints.constrainWidth();
          final dashWidth = (widget.style == DividerStyle.DASHED ? 8 : 2).floorToDouble();
          final dashCount = (boxWidth / ((widget.style == DividerStyle.DASHED ? 1.5 : 3) * dashWidth)).floor();
          return Flex(
            children: List.generate(dashCount, (_) {
              return SizedBox(
                width: dashWidth,
                height: widget.style == DividerStyle.DOTTED ? 2 : 1,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: widget.color),
                ),
              );
            }),
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            direction: Axis.horizontal,
          );
        },
      );
    }
    else {
      return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          var boxHeight = constraints.constrainHeight();
          if (boxHeight == double.infinity) {
            boxHeight = 0;
          }
          final dashHeight = (widget.style == DividerStyle.DASHED ? 8 : 2).floorToDouble();
          final dashCount = (boxHeight / ((widget.style == DividerStyle.DASHED ? 1.5 : 3) * dashHeight)).floor();
          return Flex(
            children: List.generate(dashCount, (_) {
              return SizedBox(
                width: widget.style == DividerStyle.DOTTED ? 2 : 1,
                height: dashHeight,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: widget.color),
                ),
              );
            }),
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            direction: Axis.vertical,
          );
        },
      );
    }

  }
}