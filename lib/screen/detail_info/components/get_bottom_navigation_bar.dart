import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../buy_ticket/buy_ticket.dart';

class getBottomNavigationBar extends StatelessWidget {
  const getBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.sp),
      width: 80.sw,
      height: 40.h,
      child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const BuyTicket(),
              ),
            );
          },
          child: Text(
            "Book Tickets",
            style: TextStyle(fontSize: 14.sp),
          )),
    );
  }
}
