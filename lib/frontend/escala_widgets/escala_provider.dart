import 'package:ccms/backend/models/escala.dart';
import 'package:flutter/material.dart';

class EscalaProvider extends InheritedWidget {
  final Escala escala;
  final Widget child;

  EscalaProvider(this.escala, {Key key, this.child})
      : super(key: key, child: child);

  static EscalaProvider of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(EscalaProvider) as EscalaProvider);

    @override
    bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
