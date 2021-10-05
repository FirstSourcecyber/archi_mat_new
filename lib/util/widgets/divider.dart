import 'package:flutter/material.dart';

import '../../theme.dart';

// ignore: camel_case_types
class Divider_Widgets extends StatelessWidget {
  const Divider_Widgets({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: AppTheme().l1black,
      thickness: 0.5,
      height: 1,
    );
  }
}

class Divider_Widgets1 extends StatelessWidget {
  const Divider_Widgets1({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: AppTheme().black,
      thickness: 0.5,
      height: 1,
    );
  }
}
