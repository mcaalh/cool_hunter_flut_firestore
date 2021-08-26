import 'package:flutter/material.dart';

class ParticipantsWidget extends StatelessWidget {
  const ParticipantsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: MediaQuery.of(context).size.width,
      child: Stack(children: <Positioned>[
        for (int i = 0; i < 4; i++)
          Positioned(
            // top: 590,
            left: (20 + i * 35).toDouble(),
            width: 50,
            height: 50,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  image: DecorationImage(
                      image: AssetImage('assets/img/pic-${i + 1}.png'),
                      fit: BoxFit.cover)),
            ),
          )
      ]),
    );
  }
}
