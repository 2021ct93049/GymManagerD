import 'package:flutter/material.dart';

class TestPickerWidget extends StatefulWidget {
  const TestPickerWidget(
      {super.key,
      this.restorationId,
      required this.label,
      required this.controller});
  final String? restorationId;
  final String label;
  final TextEditingController controller;
  @override
  State<TestPickerWidget> createState() => _TestPickerWidgetState();
}

class _TestPickerWidgetState extends State<TestPickerWidget>
    with RestorationMixin {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  String? get restorationId => widget.restorationId;

  String get label => widget.label;

  final RestorableDateTime _selectedDate = RestorableDateTime(DateTime.now());

  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
      RestorableRouteFuture<DateTime?>(
    onComplete: _selectDate,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: _selectedDate.value.millisecondsSinceEpoch,
      );
    },
  );

  static Route<DateTime> _datePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
          firstDate: DateTime(2021),
          lastDate: DateTime(2030),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextFormField(
          focusNode: AlwaysDisabledFocusNode(),
          controller: _textEditingController,
          onTap: () {
            _restorableDatePickerRouteFuture.present();
          },
          decoration: InputDecoration(label: Text(label)),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter date';
            }
            return null;
          },
        ),
      ),
    );
  }

  void _selectDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        _selectedDate.value = newSelectedDate;
        _textEditingController.text =
            '${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}';
      });
    }
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(
        _restorableDatePickerRouteFuture, 'date_picker_route_future');
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
