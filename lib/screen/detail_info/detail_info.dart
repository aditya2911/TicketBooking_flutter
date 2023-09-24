import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_booking/common_components/my_list_builder.dart';

import '../../model/movies.dart';
import 'components/flick_container.dart';
import 'components/flick_info.dart';
import 'components/get_bottom_navigation_bar.dart';
import 'components/rating_container.dart';

class DetailInfo extends StatelessWidget {
  final Movies data;
  const DetailInfo({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: const getBottomNavigationBar(),
      extendBody: true,
      backgroundColor: Colors.black,
      body: Align(
        alignment: Alignment.topCenter,
        child: ListView(
          children: [
            FlickContainer(data: data),
            Container(
              width: 1.sw,
              padding: EdgeInsets.only(left: 16.sp, top: 24.sp, right: 16.sp),
              decoration: BoxDecoration(
                  // color: Color(0xff161b2f),
                  color: Colors.transparent,
                  borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(24.r),
                      right: Radius.circular(24.r))),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      data.getTitle,
                      style: TextStyle(fontSize: 28.sp),
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  const RatingContainer(),
                  SizedBox(
                    height: 8.h,
                  ),
                  const FlickInfo(),
                  SizedBox(
                    height: 8.h,
                  ),
                  const MyListBuilder(
                    title: "Cast",
                    size: 5,
                    path:
                        "http://localhost:8080/api/v1/movies/fetchMovies?page=0&size=5",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
