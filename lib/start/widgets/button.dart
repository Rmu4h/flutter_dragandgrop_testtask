import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final MediaQueryData mediaQuery;

  const Button({Key? key, required this.mediaQuery}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: mediaQuery.size.width / 4,
          right: mediaQuery.size.width / 4,
          bottom: mediaQuery.size.height / 8),
      child: DecoratedBox(
        decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [
              Colors.purpleAccent,
              Colors.redAccent,
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
            disabledForegroundColor: Colors.transparent.withOpacity(0.38),
            disabledBackgroundColor: Colors.transparent.withOpacity(0.12),
            shadowColor: Colors.transparent,
            //make color or elevated button transparent
          ),
          onPressed: () {
            Navigator.of(context).pushNamed('/main');
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
              Icon(
                Icons.play_circle,
                color: Colors.white,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
