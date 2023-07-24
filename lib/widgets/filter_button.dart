// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class FilterButton extends StatefulWidget {
  final String filterName;
  final Function() event;
  final bool newElevated;
  const FilterButton({
    Key? key,
    required this.filterName,
    required this.event,
    required this.newElevated,
  }) : super(key: key);
  @override
  // ignore: no_logic_in_create_state
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  bool isElevated = true;

  _FilterButtonState();
  @override
  void initState() {
    isElevated = !widget.newElevated;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
      child: Listener(
        onPointerUp: (_) {
          setState(() {
            isElevated = widget.newElevated;
            widget.event();
          });
        },
        child: AnimatedContainer(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(25),
            boxShadow: isElevated
                ? [
                    BoxShadow(
                      color: Colors.grey[500]!,
                      offset: const Offset(4, 4),
                      blurRadius: 15,
                      spreadRadius: 3,
                    ),
                    const BoxShadow(
                      color: Colors.white,
                      offset: Offset(-4, -4),
                      blurRadius: 15,
                      spreadRadius: 3,
                    ),
                  ]
                : null,
          ),
          duration: const Duration(milliseconds: 200),
          child: Row(
            children: [
              isElevated == false
                  ? Icon(
                      Icons.check_rounded,
                      color: Theme.of(context).primaryColor,
                    )
                  : const Text(''),
              Text(
                widget.filterName,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
