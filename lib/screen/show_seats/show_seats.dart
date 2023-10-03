import 'package:book_my_seat/book_my_seat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ticket_booking/screen/detail_info/detail_info.dart';

import '../../main.dart';
import '../../model/seat_layout/seat_layout.dart';
import '../../model/seat_layout/seat_number.dart';
import '../../services/book_seat.dart';
import '../buy_ticket/buy_ticket.dart';

int areaAssigner(int row, Map<int, int> mapper) {
  int index = -1;
  for (int key in mapper.keys) {
    if (mapper[key - 1] == null && mapper[key]! >= row + 1) {
      return key;
    } else if (mapper[key - 1] != null &&
        (mapper[key - 1]! < (row + 1) && (row + 1) <= mapper[key]!)) {
      index = key;
    }
  }

  return index;
}

final SeatIDProvider = StateProvider<String>((ref) => "test");
final SeatCollectionIDProvider =
    StateProvider.autoDispose<String>((ref) => "dummyCollection");
final SeatLayoutProvider = FutureProvider.autoDispose<SeatLayout>(
  (ref) async {
    final fetchSeat = ref.read(seatProvider);
    String id = ref.watch(SeatIDProvider);
    String collectionID = ref.watch(SeatCollectionIDProvider);
    return await fetchSeat.fetchSeatLayoutByID(id, collectionID);
  },
);

class ShowSeats extends ConsumerStatefulWidget {
  final String collectionID;
  final String movieId;
  final int showID;
  final String cinemaName;
  const ShowSeats(
      {required this.movieId,
      required this.collectionID,
      super.key,
      required this.showID,
      required this.cinemaName});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ShowSeatsState();
}

class _ShowSeatsState extends ConsumerState<ShowSeats> {
  @override
  void initState() {
    Future.delayed(
        Duration.zero,
        () => {
              ref.read(SeatIDProvider.notifier).state =
                  widget.showID.toString(),
              ref.read(SeatCollectionIDProvider.notifier).state =
                  widget.collectionID
            });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final seatLayoutWatcher = ref.watch(SeatLayoutProvider);
    debugPrint("collectionID : ${widget.collectionID}");

    // debugPrint("showID : ${widget.showID.toString()}");

    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: Colors.black,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ref.watch(MovieNameProvider),
                  textAlign: TextAlign.start,
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
                Text(
                  widget.cinemaName,
                  textAlign: TextAlign.start,
                  style: const TextStyle(fontSize: 12, color: Colors.white),
                )
              ],
            )),
        body: seatLayoutWatcher.when(
            data: (data) {
              List<List<SeatState>> seatState = [];
              Map<int, int> mapper = {};
              int lenghtCounter = 0;

              int rows = 0;
              for (int i = 0; i < data.objAreaTest!.length; i++) {
                lenghtCounter =
                    lenghtCounter + data.objAreaTest![i].objRow!.length;
                mapper[i] = lenghtCounter;
                for (int j = 0; j < data.objAreaTest![i].objRow!.length; j++) {
                  rows++;

                  List<SeatState> state = [];
                  int counter = 0;
                  for (int k = 0; k < data.intMaxSeatId!.toInt(); k++) {
                    if (k >= data.objAreaTest![i].objRow![j].objSeat!.length) {
                      state.add(SeatState.empty);
                      continue;
                    } else if (k ==
                            data.objAreaTest![i].objRow![j].objSeat![counter]
                                    .gridSeatNum! -
                                1 &&
                        data.objAreaTest![i].objRow![j].objSeat![counter]
                                .seatStatus ==
                            "1") {
                      counter++;
                      state.add(SeatState.sold);
                    } else if (k ==
                            data.objAreaTest![i].objRow![j].objSeat![counter]
                                    .gridSeatNum! -
                                1 &&
                        data.objAreaTest![i].objRow![j].objSeat![counter]
                                .seatStatus ==
                            "0") {
                      counter++;
                      state.add(SeatState.unselected);
                    } else {
                      state.add(SeatState.empty);
                    }
                    // debugPrint("k is $k");
                    // debugPrint(
                    //     " data : ${data.objAreaTest![i].objRow![j].objSeat![k].gridSeatNum}");
                  }
                  seatState.add(state);
                }
              }

              //    debugPrint("rows are   $rows");
              int cols = data.intMaxSeatId!;
              double spacing = 3;
              int seatSize = 25;

              List<SeatNumber> bookings = [];
              return Column(
                children: [
                  Expanded(
                      child: Center(
                    child: InteractiveViewer(
                      child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: SeatLayoutWidget(
                              stateModel: SeatLayoutStateModel(
                                  rows: rows,
                                  seatSvgSize: seatSize,
                                  cols: data.intMaxSeatId!,
                                  currentSeatsState: seatState,
                                  pathSelectedSeat:
                                      "assets/svg/seat_selected.svg",
                                  pathDisabledSeat:
                                      "assets/svg/seat_disabled.svg",
                                  pathSoldSeat: "assets/svg/seat_sold.svg",
                                  pathUnSelectedSeat:
                                      "assets/svg/seat_unselected.svg"),
                              onSeatStateChanged: (rowI, colI, currentState) {
                                int areaIndex = areaAssigner(rowI, mapper);
                                int length = 0;
                                for (int key in mapper.keys) {
                                  if (key == areaIndex - 1) {
                                    length = mapper[key]!;
                                    break;
                                  }
                                }

                                //  debugPrint("row index before $rowI");
                                //  debugPrint("length is $length");
                                rowI = rowI - length;
                                rowI = rowI.abs();

                                for (int i = 0;
                                    i <
                                        data.objAreaTest![areaIndex]
                                            .objRow![rowI].objSeat!.length;
                                    i++) {
                                  if (data.objAreaTest![areaIndex].objRow![rowI]
                                          .objSeat![i].gridSeatNum ==
                                      colI + 1) {
                                    colI = i;
                                    break;
                                  }
                                }

                                debugPrint(
                                    "rowI:$rowI  , colI:$colI  , areaCodeI:$areaIndex ");

                                BookSeat().bookSeatByID(
                                    rowI: rowI,
                                    colI: colI,
                                    areaI: areaIndex,
                                    showI: widget.showID);

                                debugPrint("area index : $areaIndex");
                                if (currentState == SeatState.selected) {
                                  bookings
                                      .add(SeatNumber(rowI: rowI, colI: colI));
                                } else {
                                  bookings.remove(
                                      SeatNumber(rowI: rowI, colI: colI));
                                }
                              },
                            ),
                          )),
                    ),
                  )),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 280.w,
                        child: Column(
                          children: [
                            SvgPicture.asset('assets/svg/screen.svg'),
                            const SizedBox(
                              height: 8,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SeatInfo(
                                    path: "assets/svg/seat_unselected.svg",
                                    title: "Available"),
                                SeatInfo(
                                    path: "assets/svg/seat_sold.svg",
                                    title: "Booked"),
                                SeatInfo(
                                    path: "assets/svg/seat_selected.svg",
                                    title: "Selected"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              );
            },
            error: (error, stackTrace) {
              return const ErrorWidget();
            },
            loading: () => const LoadingWidget()));
  }
}

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      color: Colors.red,
      width: 400,
      height: 400,
    ));
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Expanded(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ],
    );
  }
}
