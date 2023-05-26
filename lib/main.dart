import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_booking/screen/buy_ticket/buy_ticket.dart';
import 'package:ticket_booking/screen/detail_info/components/detail_info.dart';
import 'package:ticket_booking/screen/home/components/watch_more.dart';
import 'package:ticket_booking/screen/home/home.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            useMaterial3: true,
            fontFamily: 'eFamily',
            primarySwatch: Colors.blue,
            textTheme: const TextTheme(
              bodyMedium: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
              bodySmall: TextStyle(color: Colors.yellow),
              bodyLarge: TextStyle(color: Colors.green),
            ),
          ),
          home: const DetailInfo(),
        );
      },
    );
  }
}
