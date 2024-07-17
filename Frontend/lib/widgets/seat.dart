import 'package:finote/app_theme.dart';
import 'package:flutter/material.dart';

class Seat extends StatefulWidget {
  final Color backgroundColor;
  final int? number;

  const Seat({super.key, required this.backgroundColor, this.number});

  @override
  State<Seat> createState() => _SeatState();
}

class _SeatState extends State<Seat> {
  bool touched = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          touched = !touched;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: SizedBox(
          height: 48,
          width: 48,
          child: Container(
            decoration: BoxDecoration(
              color: touched && widget.backgroundColor == Colors.white
                  ? Colors.blue
                  : widget.backgroundColor,
              borderRadius: BorderRadius.circular(10),
              border: widget.backgroundColor == Colors.white
                  ? (touched? null: Border.all(color: Theme.of(context).primaryColor))
                  : null,
            ),
            child: Center(
                child: Text(
              widget.number == null ? '' : widget.number.toString(),
              style: TextStyle(
                  fontSize: 22,
                  color: widget.backgroundColor == Colors.white && !touched
                      ? colorScheme.primary
                      : Colors.white),
            )),
          ),
        ),
      ),
    );
  }
}
