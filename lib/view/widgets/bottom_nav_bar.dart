import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar(
      {super.key, required this.onPageChanged, required this.index});
  final Function(int) onPageChanged;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildIconItem(Icons.apple_rounded, 0),
            buildIconItem(Icons.article_rounded, 1),
            SizedBox(width: Get.width * 0.14,),
            buildIconItem(Icons.car_rental_rounded, 2),
            buildIconItem(Icons.newspaper_rounded, 3),
   
          ],
        ));
  }

  Widget buildIconItem(IconData icon, int indexx) {
    final isSelected = indexx == index;
    return IconButton(
        color: isSelected ? Colors.black : Colors.grey,
        onPressed: () => onPageChanged(indexx),
        icon: Icon(icon));
  }
}
