
import 'package:flutter/material.dart';

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
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: CircularProgressIndicator(
                strokeWidth: 3.0,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            );
          }
          return Container();
        });
  }
}
