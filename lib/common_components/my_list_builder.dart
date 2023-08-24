import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../main.dart';
import '../model/movies.dart';
import '../screen/detail_info/components/detail_info.dart';

final moviesDataProvider =
    FutureProvider.family<List<Movies>, String>((ref, path) async {
  return ref.read(moviesProvider).getMoviesByPage(path);
});

class MyListBuilder extends ConsumerWidget {
  final String title;
  final int size;
  final String path;
  const MyListBuilder({
    super.key,
    required this.title,
    required this.size,
    required this.path,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final moviesData = ref.watch(moviesDataProvider(path));

    return Container(
      width: 100.sw,
      decoration: const BoxDecoration(),
      child: Column(children: [
        SizedBox(
            width: 100.sw,
            child: Text(
              title,
              style: TextStyle(fontSize: 14.sp),
            )),
        SizedBox(
          height: 4.h,
        ),
        SizedBox(
            height: 160.h,
            width: 100.sw,
            child: moviesData.when(
              data: (data) => ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                DetailInfo(data: data[index])));
                      },
                      child: Container(
                          margin: const EdgeInsets.all(4),
                          width: 100.w,
                          height: 400.h,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(4)),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 120.h,
                                child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    imageUrl: data[index].imageLink),
                              ),
                              SizedBox(
                                height: 20.h,
                                width: 100.w,
                                child: Text(
                                  data[index].title,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      color: const Color(0xff98999d)),
                                  textAlign: TextAlign.start,
                                ),
                              )
                            ],
                          )),
                    );
                  }),
              error: (error, StackTrace) {
                print(StackTrace.toString());
                return Text(StackTrace.toString());
              },
              loading: () => ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: size,
                  itemBuilder: (context, index) {
                    return Container(
                        margin: const EdgeInsets.all(4),
                        width: 80.w,
                        height: 200.h,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(4)),
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ));
                  }),
            ))
      ]),
    );
  }
}
