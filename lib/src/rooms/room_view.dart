import 'package:flutter/material.dart';
import 'package:qclean/src/rooms/room.dart';

class RoomView extends StatelessWidget {
  final Room room;

  const RoomView({Key? key, required this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: room.beds.map((e) => BedView(bednumber: e.name)).toList()
    );
  }
}

class BedView extends StatelessWidget {
  final String bednumber;

  const BedView({Key? key, required this.bednumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      child: Text(bednumber),
    );
  }
}
