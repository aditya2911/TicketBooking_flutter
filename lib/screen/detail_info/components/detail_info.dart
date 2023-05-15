import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_booking/common_components/my_list_builder.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
      actions: [IconButton(onPressed: () {}, icon: Icon((Icons.bookmark)))],
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
      extendBodyBehindAppBar: true,
      backgroundColor: Color(0xff161b2f),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 0.80.sw,
            height: 40.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
            ),
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffe7134b),
                    shape: RoundedRectangleBorder()),
                child: Text("Book Tickets")),
          ),
        ],
      ),
      appBar: MyAppBar(),
      body: Column(
        children: [
          Flexible(
            child: Container(
                height: 0.40.sh,
                child: Image.asset(
                  "assets/images/irishman.jpg",
                  fit: BoxFit.cover,
                )),
          ),
          Container(
            height: 0.60.sh,
            width: 1.sw,
            padding: EdgeInsets.only(left: 24.sp, top: 24.sp, right: 16.sp),
            decoration: BoxDecoration(
                // color: Color(0xff161b2f),
                color: Colors.transparent,
                borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(24.r), right: Radius.circular(24.r))),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RatingBar(
                        itemPadding: EdgeInsets.all(2),
                        initialRating: 3.5,
                        itemSize: 20,
                        glowRadius: 0,
                        glowColor: Colors.transparent,
                        ratingWidget: RatingWidget(
                            full: Icon(
                              Icons.star,
                              color: Color(0xffe7134b),
                              size: 4,
                            ),
                            half: Icon(
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
                        icon: Icon(Icons.share, color: Color(0xffe7134b)))
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam quis convallis velit. Maecenas interdum commodo felis, in euismod libero imperdiet vel. Aenean non est consequat, sollicitudin nisi eu, eleifend quam. Etiam dui quam, ornare pulvinar lorem ac, posuere vehicula tellus. Nam vitae magna interdum lacus interdum sollicitudin a sed libero. Proin scelerisque lorem id massa porttitor convallis. Quisque nibh ante, hendrerit ac iaculis eu, tincidunt sit amet augue. Duis mollis diam gravida purus porttitor, eget blandit velit vehicula. Maecenas eget maximus arcu, vitae commodo mi. Maecenas aliquet diam eu mi tristique ultrices. Fusce rutrum sodales tincidunt. Ut faucibus elit sed augue cursus tincidunt. In sodales fermentum interdum. Etiam mollis mattis ante. Nulla elementum tristique ullamcorper. Phasellus venenatis accumsan quam ut molestie.",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.w300, fontSize: 11.5.sp),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                MyListBuilder(title: "Cast", size: 5),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
