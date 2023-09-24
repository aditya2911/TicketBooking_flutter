import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
