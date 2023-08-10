import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
    );
  }
}
