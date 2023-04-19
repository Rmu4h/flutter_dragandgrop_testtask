import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final double progressOfLevel;

  const ChartBar({Key? key, required this.progressOfLevel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 20,
            // width: MediaQuery.of(context).size.width * 0.7,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    color: const Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                AnimatedFractionallySizedBox(
                  widthFactor: progressOfLevel * 0.5,
                  // heightFactor: ,
                  duration: const Duration(milliseconds: 500),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.yellowAccent,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
