import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:radio_app/animation/scaling.dart';

import 'package:radio_app/main.dart';
import 'package:radio_app/widgets/card.dart';

class LeftPane extends StatefulWidget {
  const LeftPane({Key? key}) : super(key: key);

  @override
  State<LeftPane> createState() => _LeftPaneState();
}

class _LeftPaneState extends State<LeftPane> {
  int playingIndex = 0;
  changeIndex() {
    setState(() {});
  }

  double _value = 0.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Hello ',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 30),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Miau',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: color[900],
                          fontSize: 30),
                    ),
                  ],
                ),
              ),
              Image.asset('assets/Mask Group.png')
            ],
          ),
          Transform.rotate(
            angle: -1.5308806722812968e-22 * (pi / 180),
            child: const Text(
              'Popular',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontFamily: 'SF Pro Display',
                  fontSize: 30,
                  letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1),
            ),
          ),
          GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
              ),
              itemCount: channels.length,
              itemBuilder: (context, index) {
                return InkWell(
                  // onTap: () => print(index),
                  child: FmChannel(
                    isPlaying: (index == playingIndex),
                    onTap: (index) {
                      setState(() {
                        playingIndex = index;
                      });
                    },
                    //   // setState(() {
                    //   //   playingIndex = index;
                    //   // });
                    // },
                    index: index,
                    wavePath: wavePath[index],
                    chName: channels[index]['title'],
                    chNumber: channels[index]['number'],
                  ),
                );
              }),
          //TODO UNCOMMENT THIS LINE
          Scaling(),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     ActionButton(
          //       image: 'assets/left_button.svg',
          //       child: Transform.rotate(
          //         angle: 45,
          //         child: const Icon(
          //           Icons.play_arrow_rounded,
          //           size: 25,
          //           color: Colors.white,
          //         ),
          //       ),
          //     ),
          //     const PlayButton(),
          //     const ActionButton(
          //       image: 'assets/left_button.svg',
          //       child: Icon(
          //         Icons.play_arrow_rounded,
          //         size: 25,
          //         color: Colors.white,
          //       ),
          //     ),
          //   ],
          // ),
          Row(
            children: [
              const Icon(
                Icons.volume_up,
                color: Color(0xff32324E),
              ),
              Slider(
                min: 0,
                max: 100,
                activeColor: const Color(0xff05D8E8),
                value: _value,
                onChanged: (value) {
                  setState(() {
                    _value = value;
                  });
                },
              ),
              Text(
                '${_value.toInt()}%',
                textAlign: TextAlign.left,
                style: const TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'SF Pro Display',
                    fontSize: 10,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final String image;
  final Widget child;
  const ActionButton({
    Key? key,
    required this.image,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [SvgPicture.asset(image, semanticsLabel: image), child],
    );
  }
}

class PlayButton extends StatelessWidget {
  const PlayButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset('assets/Polygon 5.svg', semanticsLabel: 'Acme Logo'),
        Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset('assets/Polygon 13.svg',
                semanticsLabel: 'Acme Logo'),
            const Icon(
              Icons.play_arrow_rounded,
              size: 45,
              color: Colors.white,
            )
          ],
        ),
        SvgPicture.asset('assets/Polygon 12.svg', semanticsLabel: 'Acme Logo'),
      ],
    );
  }
}

List<Map> channels = [
  {"number": '90.5', "title": 'Divelement'},
  {"number": '94.3', "title": 'Diegoveloper'},
  {"number": '98.5', "title": 'Brayan'},
  {"number": '91.0', "title": 'Argel'},
  {"number": '104.2', "title": 'Flutter'},
  {"number": '92.7', "title": 'Miau Miua'},
  // {"number": '90.5', "title": 'Divelement'},
];
List<String> wavePath = [
  'assets/Group.png',
  'assets/Group-3.png',
  'assets/Group-1.png',
  'assets/Group-4.png',
  'assets/Group-2.png',
  'assets/Group-5.png',
];
