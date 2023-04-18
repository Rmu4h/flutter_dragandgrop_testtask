import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/level_one/widgets/basket_item.dart';
import '/level_one/widgets/egg_item.dart';

import 'models/drag_element.dart';

class LevelOne extends StatefulWidget {
  const LevelOne({Key? key}) : super(key: key);

  @override
  State<LevelOne> createState() => _LevelOneState();
}

class _LevelOneState extends State<LevelOne> {
  final List<DragElement> allDragElement = [
    DragElement(
      titleNum: 1,
      description: 'drag to basket 1',
      isDropped: false,
    ),
    DragElement(
      titleNum: 2,
      description: 'drag to basket 2',
      isDropped: false,
    ),
  ];
  int numOfDroppedElements = 0;

  void updateProgress(index) {
    setState(() {
      allDragElement[index].isDropped = true;
      numOfDroppedElements++;
    });
    if (numOfDroppedElements == allDragElement.length) {
      showDialog(
          context: context,
          builder: (_) => Dialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0))),
              backgroundColor: Colors.transparent,
              child: Stack(children: [
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: Opacity(
                    opacity: 0.5,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(32),
                      // Image border
                      child: Image.asset(
                        'assets/images/goose.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 260,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/images/rank.png',
                        width: 80,
                        fit: BoxFit.cover,
                      ),
                      Stack(
                        children: [
                          // Implement the stroke
                          Text(
                            'LEVEL COMPLETED',
                            style: TextStyle(
                              fontSize: 30,
                              letterSpacing: 5,
                              fontWeight: FontWeight.bold,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 10
                                ..color = Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          // The text inside
                          const Text(
                            'LEVEL COMPLETED',
                            style: TextStyle(
                              fontSize: 30,
                              letterSpacing: 5,
                              fontWeight: FontWeight.bold,
                              color: Colors.amber,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: const Color(0xff94d500),
                            child: IconButton(
                                onPressed: () {
                                  Navigator.pushNamedAndRemoveUntil(context,
                                      '/main', ModalRoute.withName('/'));
                                },
                                icon: const Icon(
                                  Icons.refresh,
                                  size: 30,
                                  color: Colors.white,
                                )),
                          ),
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: const Color(0xff7BBF37),
                            child: IconButton(
                                onPressed: () {
                                  Navigator.popUntil(
                                      context, ModalRoute.withName('/'));
                                },
                                icon: const Icon(
                                  Icons.exit_to_app,
                                  size: 30,
                                  color: Colors.white,
                                )),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                )
              ])));
    }
  }

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, mediaQuery.size.height * 0.05, 20,
            mediaQuery.size.height * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_circle_left_outlined,
                      size: 40,
                    )),
                CircleAvatar(
                  radius: 30,
                  backgroundColor: const Color(0xffFFE8E9),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.account_circle,
                        color: Colors.black,
                        size: 30,
                      )),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    EggItem(
                      dragElement: allDragElement[0],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                    ),
                    BasketItem(
                        dragElement: allDragElement[0],
                        conditionNum: 1,
                        updateProgress: () => updateProgress(0)),
                  ],
                ),
                Column(
                  children: [
                    EggItem(
                      dragElement: allDragElement[1],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                    ),
                    BasketItem(
                        dragElement: allDragElement[1],
                        conditionNum: 2,
                        updateProgress: () => updateProgress(1)),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
