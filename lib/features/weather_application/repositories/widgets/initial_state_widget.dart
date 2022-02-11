import 'package:flutter/material.dart';

import 'package:weather_application/features/weather_application/repositories/widgets/widgets.dart';

class InitialStateWidget extends StatelessWidget {
  const InitialStateWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var url =
        'https://fsa.zobj.net/crop.php?r=bFsnJaOmccCB9YoTPTUq2J3lisszNjxp7I4_NDfXwoYyAKxRfO-ySEUJ2Rlt-f2Iba1rG25a0QHpO4cy1IPyYmKNTq42u7U6Qm3fR48KrlIeQ-t-kNb-Uw5NPZWhiigAgwc6Z7XMwIcAEoUlCk6hCxz3_NAvW0MylYeQ-LaACJZLet21o0sGmgjah9gpY2C_nBIHL--FEh_RQcHB';
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.network(
          url,
          fit: BoxFit.cover,
        ),
        textFieldAndStartSearchingText(),
      ],
    );
  }

  Padding textFieldAndStartSearchingText() {
    return Padding(
        padding: const EdgeInsets.only(bottom: 120, left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Center(
                child: Text('Start searching',
                    style: TextStyle(fontSize: 35, color: Colors.blueGrey))),
            SizedBox(
              height: 100,
            ),
            TextFieldWidget(),
          ],
        ),
      );
  }
}
