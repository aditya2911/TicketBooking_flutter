import 'package:flutter/material.dart';

import '../../../common_components/my_list_builder.dart';

class WatchMore extends StatelessWidget {
  const WatchMore({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(4.0),
      child: const MyListBuilder(title: "Watch Later", size: 5),
    );
  }
}
