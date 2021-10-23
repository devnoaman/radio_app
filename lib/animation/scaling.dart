import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Scaling extends StatefulWidget {
  final Widget child;
  final bool shouldAnimate;

  const Scaling({
    Key? key,
    required this.child,
    required this.shouldAnimate,
  }) : super(key: key);

  @override
  _ScalingState createState() => _ScalingState();
}

class _ScalingState extends State<Scaling> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _widthAnimation;
  late Animation<double> _heightAnimation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);

    _widthAnimation = Tween<double>(begin: 40.0, end: 50.0)
        .animate(CurvedAnimation(curve: Curves.easeInOut, parent: _controller));

    _heightAnimation = Tween<double>(begin: 100.0, end: 120.0)
        .animate(CurvedAnimation(curve: Curves.easeInOut, parent: _controller));

    _controller.addListener(() {
      setState(() {});
    });

    _controller.forward();
    _controller.repeat(reverse: true);

    // _controller.
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        // width: MediaQuery.of(context).size.width * _widthAnimation.value,
        height: widget.shouldAnimate ? _heightAnimation.value : 120,
        child: widget.child
        // SvgPicture.asset('assets/Polygon 6.svg', semanticsLabel: 'Acme Logo'),
        );
  }
}
