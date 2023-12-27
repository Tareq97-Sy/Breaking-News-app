import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// you can add more fields that meet your needs

  const BaseAppBar(
      {super.key,
      this.title,
      required this.appBar,
      this.widgets,
      this.backgroundColor = Colors.transparent});

  final Color backgroundColor;
  final String? title;
  final AppBar appBar;
  final List<Widget>? widgets;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title:title != null ? Text(
        title!,
        style: TextStyle(color: Colors.black),
      ): null,
      actions: widgets,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            color: Colors.black,
          )),
    );

  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
