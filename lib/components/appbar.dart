import 'package:flutter/material.dart';
import 'package:sports_news/utils/colors.dart';
import 'package:sports_news/utils/text.dart';

class appbar extends StatelessWidget implements PreferredSizeWidget {
  appbar({Key? key})
      : preferredSize = Size.fromHeight(50.0),
        super(key: key);

  @override
  final Size preferredSize;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
      ],
      backgroundColor: AppColors.black,
      elevation: 0,
      title: Container(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              boldFont(text: 'Sportz', size: 28, color:Colors.green.shade900),
              boldFont(text: '360', size: 30, color:AppColors.lightwhite),
            ],
          )),
      centerTitle: true,
    );
  }
}