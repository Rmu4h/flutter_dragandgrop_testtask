import 'package:flutter/material.dart';

import '../models/drag_element.dart';

class BasketItem extends StatefulWidget {
  final DragElement dragElement;
  final int conditionNum;
  final VoidCallback updateProgress;

  const BasketItem(
      {Key? key,
      required this.dragElement,
      required this.conditionNum,
      required this.updateProgress})
      : super(key: key);

  @override
  State<BasketItem> createState() => _BasketItemState();
}

class _BasketItemState extends State<BasketItem> {

  void showSnackBarGlobal(BuildContext context, String message) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(seconds: 1),
        content: Text(
          message,
          textScaleFactor: 2,
        )));
  }


  @override
  Widget build(BuildContext context) {
    return DragTarget(
      builder: (
        BuildContext context,
        List<dynamic> accepted,
        List<dynamic> rejected,
      ) {
        return Container(
          height: 150,
          width: 150,
          child: Center(
            child: Stack(
              children: [
                Image.asset(widget.dragElement.isDropped
                    ? 'assets/images/wicker-basket-one-egg.png'
                    : 'assets/images/wicker-basket.png'),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 100.0),
                    child: Text('${widget.dragElement.titleNum}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                )
              ],
            ),
          ),
        );
      },
      onWillAccept: (data) {
        return data == widget.conditionNum;
      },
      onAccept: (data) {
        setState(() {
          showSnackBarGlobal(context, 'Dropped successfully!');
          // widget.dragElement.isDropped = true;
          widget.updateProgress();
          // widget.showDialogWindow();
          print('${widget.dragElement.isDropped} -- isDropped in basketItem');
        });
      },
      onLeave: (data) {
        showSnackBarGlobal(context, 'Missed');
      },
    );
  }
}
