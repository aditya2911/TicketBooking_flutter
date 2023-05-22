import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixel_perfect/pixel_perfect.dart';

import '../../common_components/my_list_builder.dart';
import '../detail_info/components/detail_info.dart';
import 'components/bottom_bar.dart';
import 'components/movie_carousel.dart';
import 'components/watch_more.dart';

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
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  MovieCarousel(),
                  WatchMore(),
                  WatchMore(),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
