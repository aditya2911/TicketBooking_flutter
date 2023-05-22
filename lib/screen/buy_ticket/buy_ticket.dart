import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuyTicket extends StatelessWidget {
  const BuyTicket({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
        body: Column(
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
              height: 8.h,
            ),
            // Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     DatePickerDialog(
            //       keyboardType: TextInputType.datetime,
            //       initialDate: DateTime.now(),
            //       firstDate: DateTime.now(),
            //       lastDate: DateTime(2024, 5, 3, 1),
            //     ),
            //   ],
            // )
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
