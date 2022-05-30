import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget appBar() {
  return Container(
    width: SizerUtil.deviceType == DeviceType.mobile ? 100.w : 100.w,
    height: SizerUtil.deviceType == DeviceType.mobile ? 14.h : 14.h,
    color: const Color.fromRGBO(1, 182, 141, 30),
    child: Container(
      color: Colors.transparent,
      margin: EdgeInsets.only(left: 5.w, top: 5.h),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                "assets/images/pall.png",
                width: 25,
              ),
              Text(
                'PALL',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: SizerUtil.deviceType == DeviceType.mobile
                        ? 20.sp
                        : 24.sp),
              ),
            ],
          ),
          Row(
            children: const [
              Text(
                'Tecnology',
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                'Group',
                style: TextStyle(color: Colors.white),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
