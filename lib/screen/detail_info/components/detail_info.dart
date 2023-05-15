import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailInfo extends StatelessWidget {
  const DetailInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Flexible(
            child: Container(
                height: 0.60.sh,
                child: Container(
                  color: Colors.red,
                )),
          ),
          Container(
            height: 0.40.sh,
            color: Colors.blue,
          )
        ],
      ),
    ));
  }
}
