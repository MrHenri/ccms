import 'package:flutter/material.dart';
import 'package:time_range_picker/time_range_picker.dart';

class TimeTurnoPicker {
  final BuildContext context;

  TimeTurnoPicker(this.context);

  timeTurno()  {
    return showTimeRangePicker(
      context: context,
      use24HourFormat: true,
      start: TimeOfDay(hour: 9, minute: 0),
      end: TimeOfDay(hour: 12, minute: 0),
      disabledColor: Colors.red.withOpacity(0.5),
      labelStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
      timeTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 32,
        fontStyle: FontStyle.italic,
      ),
      activeTimeTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 38,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold),
      strokeColor: Colors.blue,
      handlerColor: Colors.lightBlue,
      selectedColor: Colors.blue[700],
      strokeWidth: 8,
      ticks: 24,
      ticksOffset: -1,
      ticksLength: 12,
      ticksColor: Colors.grey[800],
      labels: ["12 pm", "3 am", "6 am", "9 am", "12 am", "3 pm", "6 pm", "9 pm"]
          .asMap()
          .entries
          .map((e) {
        return ClockLabel.fromIndex(idx: e.key, length: 8, text: e.value);
      }).toList(),
      labelOffset: 35,
      rotateLabels: false,
      padding: 60,
      fromText: "Inicio",
      toText: "Fim",
    );
  }
}
