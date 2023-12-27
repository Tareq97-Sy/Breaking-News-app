import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  ImageContainer(
      {super.key,
      required this.width,
      this.height = 125,
      required this.imageUrl,
      this.borderRaduis = 20,
      this.padding,
      this.margin,
      this.child});
  final double width;
  final double height;
  final String? imageUrl;
  final double borderRaduis;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
               Radius.circular(20)),
          image: DecorationImage(
              fit: BoxFit.cover, image:
               imageUrl != null ?
                NetworkImage(imageUrl! )
              : const AssetImage("assets/images/default_article.jpg") as ImageProvider
              )),
      child: child,
    );
  }
}
