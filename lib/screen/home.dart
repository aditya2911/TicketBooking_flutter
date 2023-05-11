import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixel_perfect/pixel_perfect.dart';

class HomeWidget extends ConsumerWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PixelPerfect(
      assetPath: 'assets/pixelP.jpeg', // path to your asset image
      scale: 2, // scale value (optional)
      // initBottom: 20, //  default bottom distance (optional)
      // default image offset (optional)
      initOpacity: 0.0,
      child: SafeArea(
          child: Scaffold(
        bottomNavigationBar: const BottomBar(),
        backgroundColor: const Color(0xff0f1014),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
              icon: Image.asset("assets/images/netflix_logo0.png",
                  fit: BoxFit.contain),
              onPressed: () {},
              iconSize: 10),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.cast),
              iconSize: 20.sp,
            )
          ],
        ),
        body: Column(
          children: const [
            MovieCarousel(),
          ],
        ),
      )),
    );
  }
}

class MovieCarousel extends StatelessWidget {
  const MovieCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(children: [
        Container(
          color: const Color(0xff0f1014),
          width: 1.sw,
          height: 0.65.sh,
          child: Stack(
            children: [
              // Image.network(
              //     "https://images.catchnews.com/upload/2018/06/21/surveen_118955_730x419.jpg"),
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
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
                                  backgroundColor: const Color(0xff212227),
                                ),
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
      ]),
    );
  }
}

class BottomBar extends StatelessWidget {
  const BottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.h,
      child: BottomNavigationBar(
          backgroundColor: const Color(0xff0f1014),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          selectedIconTheme: const IconThemeData(color: Colors.white),
          unselectedIconTheme: const IconThemeData(color: Colors.grey),
          selectedFontSize: 12,
          unselectedFontSize: 12,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 20,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  size: 20,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 20,
                ),
                label: "Home")
          ]),
    );
  }
}
