import 'package:flutter/material.dart';

class Start extends StatelessWidget {
  const Start({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      body: Container(
        width: mediaQuery.size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xfffe8a7d),
                Color(0xff896ACD),
              ],
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/Humpty_Dumpty.webp',
              fit: BoxFit.cover,
              // width: 250,
              height: mediaQuery.size.height / 2.5,
            ),
            const Text('Let\'s Play Egger,',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('Put the eggs in the basket',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                // fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(left: mediaQuery.size.width / 4, right: mediaQuery.size.width / 4, bottom: mediaQuery.size.height / 8),
        child: DecoratedBox(
          decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [
                Colors.purpleAccent,
                Colors.redAccent,
                //add more colors
              ]),
              borderRadius: BorderRadius.circular(10),
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
            onPressed: () {
              Navigator.popAndPushNamed(context, '/main');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Start',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.play_circle, color: Colors.white, size: 20,),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
