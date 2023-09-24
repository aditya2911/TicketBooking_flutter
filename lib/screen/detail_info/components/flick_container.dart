import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common_components/video_player_view.dart';
import '../../../model/movies.dart';

class FlickContainer extends StatelessWidget {
  final Movies data;
  const FlickContainer({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 0.40.sh,
        width: 100.sw,
        child: VideoPlayerView(
          url: data.getYoutubeLink,
        ));
  }
}
