import 'package:date_picker_timetable/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ticket_booking/main.dart';
import 'package:ticket_booking/model/cinema_shows/cinema_shows.dart';
import 'package:ticket_booking/services/shows/show_parameter.dart';
import 'package:intl/intl.dart';

import 'components/show_info_container.dart';

final showParameterProvider =
    StateProvider<ShowParameter>((ref) => ShowParameter("2", "0118-09-2023"));

final showDataProvider =
    FutureProvider.autoDispose<List<CinemaShows>>((ref) async {
  final showParameter = ref.watch(showParameterProvider);
  return await ref
      .read(showProvider)
      .fetchShowsByIdAndDate(showParameter.id, showParameter.date);
});

class BuyTicket extends ConsumerStatefulWidget {
  final int id;
  const BuyTicket(this.id, {super.key});

  @override
  ConsumerState<BuyTicket> createState() => _BuyTicketState();
}

class _BuyTicketState extends ConsumerState<BuyTicket> {
  @override
  void initState() {
    ref.read(showParameterProvider.notifier).state.date = "08-09-2023";
    ref.read(showParameterProvider.notifier).state.id = widget.id.toString();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final showData = ref.watch(showDataProvider);

    return SafeArea(
      child: Scaffold(
        // bottomNavigationBar: Container(
        //   margin: EdgeInsets.all(8.sp),
        //   width: 80.sw,
        //   height: 40.h,
        //   child: ElevatedButton(
        //       onPressed: () {},
        //       child: Text(
        //         "Buy",
        //         style: TextStyle(fontSize: 14.sp),
        //       )),
        // ),
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text(
            "Select Show",
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.white,
              )),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 90,
              child: DatePicker(
                DateTime(2023, 9, 8),
                animateToSelection: true,
                initialSelectedDate: DateTime(2023, 9, 8),
                daysCount: 7,
                selectedTextColor: Colors.white,
                deactivatedColor: Colors.yellow,
                monthTextStyle: const TextStyle(color: Colors.grey),
                dayTextStyle: const TextStyle(color: Colors.grey),
                onDateChange: (selectedDate) {
                  String date1 = DateFormat('dd-MM-yyyy').format(selectedDate);

                  ref.read(showParameterProvider.notifier).state =
                      ShowParameter(widget.id.toString(), date1);
                },
                dateTextStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Expanded(
              child: showData.when(data: (output) {
                final int dataLength = output.length;
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        FractionallySizedBox(
                          widthFactor: 1,
                          child: Column(
                              children: List.generate(
                                  dataLength,
                                  (index) => ShowInfoContainer(
                                      widget.id.toString(), output[index]))),
                        ),
                      ],
                    ),
                  ),
                );
              }, error: (error, StackTrace stackTrace) {
                return Center(
                  child: Text("Error: ${error.toString()}"),
                );
              }, loading: () {
                return const Center(child: CircularProgressIndicator());
              }),
            )
          ],
        ),
      ),
    );
  }
}

class SeatInfo extends StatelessWidget {
  final String title;
  final String path;
  const SeatInfo({
    super.key,
    required this.title,
    required this.path,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          path,
          height: 25,
          width: 25,
        ),
        SizedBox(
          width: 8.w,
        ),
        Text(title),
      ],
    );
  }
}
