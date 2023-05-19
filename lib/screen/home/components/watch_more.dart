import 'package:flutter/material.dart';

import '../../../common_components/my_list_builder.dart';

class WatchMore extends StatelessWidget {
  const WatchMore({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: MyListBuilder(title: "Watch Later", size: 5),
      ),
    );
  }
}
