import 'package:flutter/material.dart';

class Start extends StatelessWidget {
  const Start({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      body: TextButton(
        onPressed: () {},
        child: Text('Start'),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(left: mediaQuery.size.width / 4, right: mediaQuery.size.width / 4, bottom: mediaQuery.size.height / 6),
        child: DecoratedBox(
          decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [
                Colors.blueAccent,
                Colors.redAccent,
                Colors.purpleAccent
                //add more colors
              ]),
              borderRadius: BorderRadius.circular(5),
              boxShadow: const <BoxShadow>[
                BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
                    blurRadius: 5) //blur radius of shadow
              ]),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              disabledForegroundColor: Colors.transparent.withOpacity(0.38), disabledBackgroundColor: Colors.transparent.withOpacity(0.12),
              shadowColor: Colors.transparent,
              //make color or elevated button transparent
            ),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.play_circle, color: Colors.red,),
                Text('Start')
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
