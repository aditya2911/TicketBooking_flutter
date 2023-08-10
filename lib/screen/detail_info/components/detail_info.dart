import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_booking/common_components/my_list_builder.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 5,
      backgroundColor: Colors.transparent,
      leading: IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon((Icons.bookmark)))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class DetailInfo extends StatelessWidget {
  const DetailInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: const getBottomNavigationBar(),
      extendBodyBehindAppBar: true,
      extendBody: true,
      backgroundColor: const Color.fromARGB(255, 25, 26, 31),
      appBar: const MyAppBar(),
      body: Align(
        alignment: Alignment.topCenter,
        child: ListView(
          children: [
            const ImageContainer(),
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
                      "The Irish Man",
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
                  const MyListBuilder(title: "Cast", size: 5),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class FlickInfo extends StatelessWidget {
  const FlickInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam quis convallis velit. Maecenas interdum commodo felis, in euismod libero imperdiet vel. Aenean non est consequat, sollicitudin nisi eu, eleifend quam. Etiam dui quam, ornare pulvinar lorem ac, posuere vehicula tellus. Nam vitae magna interdum lacus interdum sollicitudin a sed libero. Proin scelerisque lorem id massa porttitor convallis. Quisque nibh ante, hendrerit ac iaculis eu, tincidunt sit amet augue. Duis mollis diam gravida purus porttitor, eget blandit velit vehicula. Maecenas eget maximus arcu, vitae commodo mi. Maecenas aliquet diam eu mi tristique ultrices. Fusce rutrum sodales tincidunt. Ut faucibus elit sed augue cursus tincidunt. In sodales fermentum interdum. Etiam mollis mattis ante. Nulla elementum tristique ullamcorper. Phasellus venenatis accumsan quam ut molestie.",
        textAlign: TextAlign.left,
        style: TextStyle(fontWeight: FontWeight.w300, fontSize: 11.5.sp),
      ),
    );
  }
}

class RatingContainer extends StatelessWidget {
  const RatingContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RatingBar(
            itemPadding: const EdgeInsets.all(2),
            initialRating: 3.5,
            itemSize: 20,
            glowRadius: 0,
            glowColor: Colors.transparent,
            ratingWidget: RatingWidget(
                full: const Icon(
                  Icons.star,
                  color: Color(0xffe7134b),
                  size: 4,
                ),
                half: const Icon(
                  Icons.star_half,
                  color: Color(0xffe7134b),
                  size: 4,
                ),
                empty: Icon(
                  Icons.star_outline,
                  color: Colors.grey.withOpacity(0.75),
                  size: 4,
                )),
            onRatingUpdate: (rating) {}),
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share, color: Color(0xffe7134b)))
      ],
    );
  }
}

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 0.40.sh,
        child: Image.asset(
          "assets/images/irishman.jpg",
          fit: BoxFit.cover,
        ));
  }
}

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
          onPressed: () {},
          child: Text(
            "Book Tickets",
            style: TextStyle(fontSize: 14.sp),
          )),
    );
  }
}
