import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  bool _isDropped = false;
  String _color = 'red';

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: mediaQuery.size.height * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
                      size: 30,
                    )),
                const Text('My level'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                children: [
                  Draggable(
                    data: 'red',
                    //Dragging. переношу
                    feedback: SizedBox(
                      height: 140.0,
                      width: 140.0,
                      child: Center(
                        child: Stack(
                          children: [
                            Image.asset('assets/images/golden-egg.png'),
                            const Center(
                              child: Text(
                                '1',
                                style: TextStyle(
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
                    child: _isDropped
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
                            const Center(
                              child: Text('1',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  )),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                  DragTarget(
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
                              Image.asset(_isDropped
                                  ? 'assets/images/wicker-basket-one-egg.png'
                                  : 'assets/images/wicker-basket.png'),
                              const Center(
                                child: Padding(
                                  padding: EdgeInsets.only(top: 100.0),
                                  child: Text('1',
                                      style: TextStyle(
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
                      return data == 'red';
                    },
                    onAccept: (data) {
                      setState(() {
                        showSnackBarGlobal(context, 'Dropped successfully!');
                        _isDropped = true;
                      });
                    },
                    onLeave: (data) {
                      showSnackBarGlobal(context, 'Missed');
                    },
                  ),
                ],
              ),
                Column(
                children: [
                  Draggable(
                    data: 'red',
                    //Dragging. переношу
                    feedback: SizedBox(
                      height: 140.0,
                      width: 140.0,
                      child: Center(
                        child: Stack(
                          children: [
                            Image.asset('assets/images/golden-egg.png'),
                            const Center(
                              child: Text(
                                '1',
                                style: TextStyle(
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
                    child: _isDropped
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
                                  const Center(
                                    child: Text('2',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  )
                                ],
                              ),
                            ),
                        ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                  DragTarget(
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
                              Image.asset(_isDropped
                                  ? 'assets/images/wicker-basket-one-egg.png'
                                  : 'assets/images/wicker-basket.png'),
                              const Center(
                                child: Padding(
                                  padding: EdgeInsets.only(top: 100.0),
                                  child: Text('2',
                                      style: TextStyle(
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
                      return data == 'red';
                    },
                    onAccept: (data) {
                      setState(() {
                        showSnackBarGlobal(context, 'Dropped successfully!');
                        _isDropped = true;
                      });
                    },
                    onLeave: (data) {
                      showSnackBarGlobal(context, 'Missed');
                    },
                  ),
                ],
              )
              ],
            )
          ],
        ),
      ),
    );
  }

  void showSnackBarGlobal(BuildContext context, String message) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
      message,
      textScaleFactor: 2,
    )));
  }
}
