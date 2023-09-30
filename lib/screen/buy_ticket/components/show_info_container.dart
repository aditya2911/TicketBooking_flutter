import 'package:flutter/material.dart';

import '../../../model/cinema_shows/cinema_shows.dart';
import '../../show_seats/show_seats.dart';

class ShowInfoContainer extends StatelessWidget {
  final CinemaShows cinemaShow;
  const ShowInfoContainer(
    this.cinemaShow, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 16, 15, 16),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          direction: Axis.horizontal,
          spacing: 8,
          runSpacing: 8,
          children: [
            Row(
              children: [
                Flexible(
                  child: Text(
                    "${cinemaShow.getName}",
                    style: const TextStyle(fontSize: 14),
                  ),
                )
              ],
            ),
            ...List.generate(
                cinemaShow.shows!.length,
                (index) => Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () => {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ShowSeats(
                                collectionID:
                                    cinemaShow.shows![index].collectionId!),
                          ))
                        },
                        child: Container(
                            height: 36,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1.5),
                                border:
                                    Border.all(color: const Color(0XffC6C6C6))),
                            child: Center(
                              child: Text(
                                "${cinemaShow.shows![index].startTime}",
                                style: const TextStyle(
                                    fontSize: 12, color: Color(0xff4ABD5D)),
                                textAlign: TextAlign.center,
                              ),
                            )),
                      ),
                    ))
          ],
        ),
      ),
    );
  }
}
