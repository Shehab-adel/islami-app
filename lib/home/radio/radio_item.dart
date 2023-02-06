import 'package:flutter/material.dart';
import 'package:islami_online_c4/main.dart';
import '../../model/radio_response.dart';

class RadioItem extends StatefulWidget {
  const RadioItem({
    Key? key,
    required this.item,
    required this.play,
    required this.pause,
  }) : super(key: key);
  final Radios item;
  final Function play;
  final Function pause;

  @override
  State<RadioItem> createState() => _RadioItemState();
}

class _RadioItemState extends State<RadioItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.item.name ?? '',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                widget.pause();
              },
              icon: const Icon(
                Icons.play_circle_rounded,
                color: MyThemeData.primaryColor,
                size: 45,
              ),
            ),
            IconButton(
              onPressed: () {
                widget.play(widget.item.radioUrl ?? '');
              },
              icon: const Icon(
                Icons.pause_circle_rounded,
                color: MyThemeData.primaryColor,
                size: 45,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
