import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class LoadingInfo extends StatelessWidget {
  Stream<bool> _isLoading;

  LoadingInfo(this._isLoading);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _isLoading,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          debugPrint("asd isLoading=${snapshot.data}");
          if (snapshot.hasData && snapshot.data) {
            return Icon(
              FontAwesomeIcons.hackerNews,
              color: Colors.white,
            );
          }
          return Container();
        });
  }
}
