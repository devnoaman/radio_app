import 'dart:math';

import 'package:flutter/material.dart';

class FmChannel extends StatefulWidget {
  final bool isPlaying;
  final String chNumber;
  final String chName;
  final String wavePath;
  final Function(int) onTap;
  final int index;
  const FmChannel({
    Key? key,
    required this.isPlaying,
    required this.chNumber,
    required this.chName,
    required this.wavePath,
    required this.onTap,
    required this.index,
  }) : super(key: key);

  @override
  State<FmChannel> createState() => _FmChannelState();
}

class _FmChannelState extends State<FmChannel> {
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap(widget.index);
        // print('card is playing' + widget.index.toString());
      },
      child: Container(
        width: 139,
        height: 139,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
          border: !widget.isPlaying
              ? Border.all(
                  color: Color.fromRGBO(50, 50, 78, 1),
                  width: 2,
                )
              : Border.all(),
          color: widget.isPlaying
              ? Color.fromRGBO(255, 41, 109, 1)
              : Colors.transparent,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                widget.isPlaying
                    ? Text(
                        'Playing',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromRGBO(170, 29, 74, 1),
                            fontFamily: 'SF Pro Display',
                            fontSize: 10,
                            letterSpacing:
                                0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.bold,
                            height: 1),
                      )
                    : SizedBox(),
                GestureDetector(
                  onTap: () {
                    print(isFav);
                    setState(() {
                      isFav = !isFav;
                    });
                  },
                  child: !isFav
                      ? const Icon(
                          Icons.favorite_outline,
                          color: Colors.white,
                        )
                      : const Icon(
                          Icons.favorite,
                          color: Colors.white,
                        ),
                ),
              ]),
              Column(
                children: [
                  Transform.rotate(
                    angle: -1.5308806722812968e-22 * (pi / 180),
                    child: Text(
                      widget.chNumber,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontFamily: 'SF Pro Display',
                          fontSize: 30,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.bold,
                          height: 1),
                    ),
                  ),
                  Text(
                    widget.chName,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontFamily: 'SF Pro Display',
                        fontSize: 15,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ),
                ],
              ),
              Image.asset(widget.wavePath)
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
        ),
      ),
    );
  }
}
