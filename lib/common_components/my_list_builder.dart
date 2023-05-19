import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyListBuilder extends StatelessWidget {
  final String title;
  final int size;
  const MyListBuilder({
    required this.title,
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.sw,
      decoration: BoxDecoration(),
      child: Column(children: [
        Container(
            width: 100.sw,
            child: Text(
              title,
              style: TextStyle(fontSize: 14.sp),
            )),
        SizedBox(
          height: 4.h,
        ),
        Container(
          height: 87.h,
          width: 100.sw,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: size,
              itemBuilder: (context, index) {
                return Container(
                    margin: EdgeInsets.all( 4),
                    width: 80.w,
                    height: 200.h,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(4)),
                    child: Text(
                      "title",
                      style: TextStyle(fontSize: 16.0),
                    ));
              }),
        )
      ]),
    );
  }
}
