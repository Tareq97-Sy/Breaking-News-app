
import 'package:flutter/material.dart';

class CustomeTag extends StatelessWidget {
  const CustomeTag({super.key, required this.backgroundColor, required this.children,this.height=45});
  final Color backgroundColor;
  final List<Widget> children;
  final double? height ;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius:  BorderRadius.circular(20.0)
      ),
      child: Row(children: children),
    );
  }
}