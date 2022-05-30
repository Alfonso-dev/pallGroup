import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget subMenu(icon, text, iconTwo, context) {
  return Container(
    margin: EdgeInsets.only(top: 4.h, bottom: 0.h, left: 2.w, right: 2.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              icon,
              color: Colors.grey,
              size: SizerUtil.deviceType == DeviceType.mobile ? 10.w : 10.w,
            ),
            Text(
              text,
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: SizerUtil.deviceType == DeviceType.mobile
                      ? 13.sp
                      : 13.sp),
            ),
          ],
        ),
        Container(
          color: Colors.white,
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              iconTwo,
              color: const Color.fromRGBO(1, 182, 141, 30),
              size: SizerUtil.deviceType == DeviceType.mobile ? 10.w : 10.w,
            ),
          ),
        )
      ],
    ),
  );
}
