import 'package:flutter/material.dart';

class LoadingStateWidget extends StatelessWidget {
  const LoadingStateWidget({
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
        const Center(
          child: CircularProgressIndicator(),
        ),
      ],
    );
  }
}
