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
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: SizedBox(
            height: 2.h,
            child: IconButton(
                icon: Image.asset("assets/images/netflix_logo0.png",
                    scale: 0.5, fit: BoxFit.contain),
                onPressed: () {},
                iconSize: 10),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.cast),
              iconSize: 20.sp,
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Column(children: [
                Container(
                  color: Colors.black,
                  width: 1.sw,
                  height: 0.65.sh,
                  child: Stack(
                    children: [
                      // Image.network(
                      //     "https://images.catchnews.com/upload/2018/06/21/surveen_118955_730x419.jpg"),
                      Align(
                          alignment: Alignment.topCenter,
                          child: SizedBox(
                              height: 0.5.sh,
                              child: Image.asset(
                                "assets/images/sintel.jpg",
                                fit: BoxFit.fitHeight,
                              ))),
                      Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                              Colors.black,
                              Colors.black.withOpacity(0.75),
                              Colors.transparent,
                              Colors.black.withOpacity(0.75),
                              Colors.black,
                            ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight)),
                        height: double.infinity,
                        width: 1.sw,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                              Colors.black.withOpacity(0.35),
                              Colors.transparent,
                              Colors.black.withOpacity(0.35),
                            ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter)),
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
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text("2022"),
                                    Text("."),
                                    Text("Hindi"),
                                    Text("."),
                                    Text(
                                      "Drama",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    Text("."),
                                  ],
                                ),
                              ),
                              Container(
                                height: 30.h,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 30.h,
                                      width: 200.w,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        child: Text("Watch Now"),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8.w,
                                    ),
                                    Container(
                                      // color: Colors.blue,
                                      decoration: BoxDecoration(
                                          // color: Colors.red,
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: IconButton(
                                        padding: EdgeInsets.zero,
                                        icon: Center(
                                            child:
                                                Center(child: Icon(Icons.add))),
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
            ),
          ],
        ),
      )),
    );
  }
}
