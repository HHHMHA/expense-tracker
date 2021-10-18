import 'package:flutter/material.dart';

// To keep this as a self contained widget we will not use constants.dart here because
// unless same magic numbers were used in another place

class BorderBox extends StatelessWidget {
  const BorderBox({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).primaryColor,
          width: 2,
        ),
      ),
      padding: EdgeInsets.all(10),
      child: child,
    );
  }
}
