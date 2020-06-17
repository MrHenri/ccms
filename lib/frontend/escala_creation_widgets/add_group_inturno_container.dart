import 'package:ccms/frontend/escala_creation_widgets/adicionar_group_container.dart';
import 'package:flutter/material.dart';

class AddGroupInTurnoContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: InkWell(
        onTap: () => print("Tab"),
        child: AdicionarGroupContainer(),
      ),
    );
  }
}
