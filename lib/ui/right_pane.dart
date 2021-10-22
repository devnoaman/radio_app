import 'dart:math';

import 'package:flutter/material.dart';

class RightPane extends StatefulWidget {
  RightPane({Key? key}) : super(key: key);

  @override
  State<RightPane> createState() => _RightPaneState();
}

List<String> side = [
  'All Stations',
  'Favorites',
  'Popular',
];

class _RightPaneState extends State<RightPane> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 16,
        ),
        Image.asset('assets/Group 2.png'),
        SizedBox(
          height: 16,
        ),
        ListView.builder(
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 32.0),
                child: SideMenu(
                  title: side[index],
                  index: index,
                  onTap: (i) {
                    setState(() {
                      selectedIndex = i;
                    });
                    print('selected index $i');
                  },
                  isActive: index == selectedIndex,
                ),
              );
            }),
      ],
    );
  }
}

class SideMenu extends StatelessWidget {
  final String title;
  final int index;
  final bool isActive;
  final Function(int) onTap;

  const SideMenu({
    Key? key,
    required this.title,
    required this.index,
    required this.isActive,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(index);
      },
      child: Center(
        child: RotatedBox(
          quarterTurns: 3,
          child: Row(
            children: [
              isActive
                  ? Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(5, 216, 232, 1),
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(15, 15)),
                      ))
                  : SizedBox(),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: isActive
                          ? Color.fromRGBO(255, 255, 255, 1)
                          : Colors.grey,
                      fontFamily: 'SF Pro Display',
                      fontSize: 20,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
