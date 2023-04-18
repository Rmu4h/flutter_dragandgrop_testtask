import 'package:flutter/material.dart';

import '../models/drag_element.dart';

class EggItem extends StatefulWidget {
  final DragElement dragElement;

  const EggItem({Key? key, required this.dragElement}) : super(key: key);

  @override
  State<EggItem> createState() => _EggItemState();
}

class _EggItemState extends State<EggItem> {
  @override
  Widget build(BuildContext context) {
    return Draggable(
      data: widget.dragElement.titleNum,
      feedback: SizedBox(
        height: 140.0,
        width: 140.0,
        child: Center(
          child: Stack(
            children: [
              Image.asset('assets/images/golden-egg.png'),
              Center(
                child: Text(
                  '${widget.dragElement.titleNum}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      //show when egg is take
      childWhenDragging: const SizedBox(
        height: 120,
        width: 120,
      ),
      onDragStarted: () {
        //showSnackBarGlobal(context, 'Drag started');
      },
      //drag me. перенеси мене
      child: widget.dragElement.isDropped
          ? const SizedBox(
              height: 140,
              width: 140,
            )
          : SizedBox(
              height: 120,
              width: 120,
              child: Center(
                child: Stack(
                  children: [
                    Image.asset('assets/images/golden-egg.png'),
                    Center(
                      child: Text('${widget.dragElement.titleNum}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
