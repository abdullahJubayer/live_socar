import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  Widget horizontalPadding(double padding) =>
      Padding(padding: EdgeInsets.symmetric(horizontal: padding), child: this);

  Widget verticalPadding(double padding) =>
      Padding(padding: EdgeInsets.symmetric(vertical: padding), child: this);

  Widget padding({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
    double? all,
  }) =>
      Padding(
          padding: all == null
              ? EdgeInsets.only(
                  bottom: bottom,
                  left: left,
                  right: right,
                  top: top,
                )
              : EdgeInsets.all(all),
          child: this);

  Widget height(double height) => SizedBox(height: height, child: this);

  Widget width(double width) => SizedBox(width: width, child: this);

  Widget sizedBox({double? height, double? width}) =>
      SizedBox(height: height, width: width, child: this);

  Widget badge({int? count, Color? color, double? position}) =>
      Stack(children: <Widget>[
        this,
        Positioned(
          top: position ?? 5,
          right: position ?? 5,
          child: Container(
            padding: EdgeInsets.symmetric(
                vertical: count == null ? 5 : 1, horizontal: 4),
            decoration: BoxDecoration(
              color: color ?? Colors.redAccent,
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: Text("${count ?? ''}",
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
          ),
        )
      ]);
}
