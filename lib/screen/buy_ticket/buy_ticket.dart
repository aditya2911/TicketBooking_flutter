import 'package:date_picker_timetable/date_picker_timetable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuyTicket extends StatelessWidget {
  const BuyTicket({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
          margin: EdgeInsets.all(8.sp),
          width: 80.sw,
          height: 40.h,
          child: ElevatedButton(
              onPressed: () {},
              child: Text(
                "Buy",
                style: TextStyle(fontSize: 14.sp),
              )),
        ),
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            "Select Seats",
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.white,
              )),
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 24.h,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 250.w,
                width: 250.w,
                child: GridView.builder(
                    itemCount: 64,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 8, childAspectRatio: 1),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.event_seat,
                          color: Colors.grey,
                        ),
                      );
                    }),
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Container(
              width: 280.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SeatInfo(color: Colors.grey, title: "Available"),
                  SeatInfo(color: Colors.white, title: "Booked"),
                  SeatInfo(color: Colors.red, title: "Selected"),
                ],
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: DatePicker(
                DateTime.now(),
                height: MediaQuery.of(context).size.width < 400 ? 90.h : 70.h,
                animateToSelection: true,
                initialSelectedDate: DateTime.now(),
                selectionColor: Colors.black,
                selectedTextColor: Colors.white,
                deactivatedColor: Colors.green,
                monthTextStyle: TextStyle(color: Colors.grey),
                dayTextStyle: TextStyle(color: Colors.grey),
                dateTextStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SeatInfo extends StatelessWidget {
  final Color color;
  final String title;
  const SeatInfo({
    super.key,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.event_seat,
          color: color,
        ),
        SizedBox(
          width: 8.w,
        ),
        Text(title),
      ],
    );
  }
}
