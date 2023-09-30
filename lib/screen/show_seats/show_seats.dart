import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShowSeats extends ConsumerStatefulWidget {
  final String collectionID;
  const ShowSeats({required this.collectionID, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ShowSeatsState();
}

class _ShowSeatsState extends ConsumerState<ShowSeats> {
  @override
  Widget build(BuildContext context) {
    debugPrint("collectionID : ${widget.collectionID}");
    return Container();
  }
}
