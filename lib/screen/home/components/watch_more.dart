import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common_components/my_list_builder.dart';

class WatchMore extends ConsumerWidget {
  final String title;
  final String url;
  const WatchMore({required this.title, required this.url, super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(4.0),
      child: MyListBuilder(title: title, size: 5, path: url),
    );
  }
}
