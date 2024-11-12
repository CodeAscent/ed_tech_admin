import 'package:ed_tech_admin/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_randomcolor/flutter_randomcolor.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

customDateFormat(String date) {
  return DateFormat('dd/MM/yyyy').format(DateTime.parse(date).toLocal());
}

Color randomColor() => RandomColor.getColorObject(Options(
      colorType: ColorType.purple,
      luminosity: Luminosity.light,
    ));

TextStyle kCommonHeading() =>
    TextStyle(fontSize: 22, fontWeight: FontWeight.w900);

AppBar KCommonAppBar({required String title, Function()? onCreate, String? actionLabel, Widget? extraAction}) {
  return AppBar(
    toolbarHeight: 80,
    centerTitle: true,
    backgroundColor: ColorPallete.navyBlue,
    automaticallyImplyLeading: false,
    title: Row(
      children: [
        GestureDetector(
          onTap: () {
            Get.back();
          },
          child: CircleAvatar(
            backgroundColor: ColorPallete.whiteShade,
            child: Center(
              child: Icon(
                Icons.navigate_before,
                color: Colors.black,
                size: 30,
              ),
            ),
          ),
        ),
        SizedBox(width: 20),
        Text(title, style: kCommonHeading().copyWith(color: Colors.white)),
        Spacer(),
        if (onCreate != null)
          ElevatedButton(
            onPressed: onCreate,
            child: Text(actionLabel == null?'Create': actionLabel),
          ),
          if(extraAction != null)
          Row(children: [        SizedBox(width: 20),
          extraAction
],)
      ],
    ),
  );
}
