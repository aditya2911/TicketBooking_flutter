import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingContainer extends StatelessWidget {
  const RatingContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RatingBar(
            itemPadding: const EdgeInsets.all(2),
            initialRating: 3.5,
            itemSize: 20,
            glowRadius: 0,
            glowColor: Colors.transparent,
            ratingWidget: RatingWidget(
                full: const Icon(
                  Icons.star,
                  color: Color(0xffe7134b),
                  size: 4,
                ),
                half: const Icon(
                  Icons.star_half,
                  color: Color(0xffe7134b),
                  size: 4,
                ),
                empty: Icon(
                  Icons.star_outline,
                  color: Colors.grey.withOpacity(0.75),
                  size: 4,
                )),
            onRatingUpdate: (rating) {}),
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share, color: Color(0xffe7134b)))
      ],
    );
  }
}
