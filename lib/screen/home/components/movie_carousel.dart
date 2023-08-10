import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieCarousel extends StatelessWidget {
  const MovieCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        color: const Color(0xff0f1014),
        width: 1.sw,
        height: 0.65.sh,
        child: Stack(
          children: [
            SizedBox(
              height: 2.h,
            ),
            Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                    height: 0.5.sh,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Image.asset(
                        "assets/images/sintel.jpg",
                        fit: BoxFit.fitHeight,
                      ),
                    ))),
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                const Color(0xff0f1014),
                const Color(0xff0f1014).withOpacity(0.85),
                Colors.transparent,
                const Color(0xff0f1014).withOpacity(0.85),
                const Color(0xff0f1014),
              ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
              height: double.infinity,
              width: 1.sw,
            ),
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                const Color(0xff0f1014).withOpacity(0.35),
                Colors.transparent,
                const Color(0xff0f1014).withOpacity(0.35),
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              height: double.infinity,
              width: 1.sw,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 0.28.sh,
                width: 1.sw,
                color: Colors.transparent,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Column(children: [
                    Image.asset("assets/images/sintel_title.png"),
                    SizedBox(
                      width: 180.w,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("2022"),
                          Text("."),
                          Text("Hindi"),
                          Text("."),
                          Text(
                            "Drama",
                          ),
                          Text("."),
                          Text(
                            "Thriiller",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    SizedBox(
                      height: 28.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            // decoration: const BoxDecoration(
                            //     gradient: LinearGradient(
                            //         colors: [Color(0xff212227)],
                            //         begin: Alignment.centerLeft,
                            //         end: Alignment.centerRight)),
                            height: 30.h,
                            width: 180.w,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white10,
                                  foregroundColor: Colors.white),
                              onPressed: () {},
                              child: const Text(
                                "Watch Now",
                                style: TextStyle(fontSize: 10),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Container(
                            // color: Colors.blue,
                            width: 30.w,
                            height: 30.w,
                            decoration: BoxDecoration(
                                color: const Color(0xff212227),
                                borderRadius: BorderRadius.circular(5)),
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              icon: const Center(
                                  child: Center(
                                      child: Icon(
                                Icons.add,
                                size: 15,
                                color: Colors.white,
                              ))),
                              onPressed: () {},
                            ),
                          )
                        ],
                      ),
                    )
                  ]),
                ),
              ),
            )
          ],
        ),
      )
    ]);
  }
}
