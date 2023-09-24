import 'package:flutter/material.dart';

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
