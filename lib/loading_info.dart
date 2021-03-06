import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@deprecated
class LoadingInfo extends StatefulWidget {
  final Stream<bool> _isLoading;

  LoadingInfo(this._isLoading);

  createState() => LoadingInfoState();
}

class LoadingInfoState extends State<LoadingInfo>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: widget._isLoading,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasData && snapshot.data) {
            // This is a hack, don't replicate in the future
            _controller.forward().then((value) => _controller.reverse());
            return FadeTransition(
                child: Icon(FontAwesomeIcons.hackerNewsSquare),
                opacity: _controller);
          }
          return Container();
        });
  }
}
