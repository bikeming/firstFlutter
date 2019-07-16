import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// @author: jm
/// @date: 2019/7/16 15:44
/// @Version:1.0
/// @Description: 自定义view=>五子棋

class GobangPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double wh = ScreenUtil.screenWidthDp;
    print(wh);
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: Text("五子棋"),
      ),
      body: Center(
        child: CustomPaint(
          size: Size(wh, wh),
          painter: GoBangPainter(wh),
        ),
      )
    );
  }
}

class GoBangPainter extends CustomPainter {
  num line = 10;
  double wh;

  GoBangPainter(this.wh);

  @override
  void paint(Canvas canvas, Size size) {
//背景
    Paint paint = new Paint()
      ..color = Color(0x77cdb175)
      ..style = PaintingStyle.fill;
    canvas.drawRect(Offset.zero & size, paint);
    //画线

    Paint linePaint = new Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke;
    //10条横线
    for (int i = 0; i <= 10; i++) {
      canvas.drawLine(
          Offset(0, wh / 10 * i), Offset(wh, wh / 10 * i), linePaint);
    }

    //10条竖线
    for (int i = 0; i <= 10; i++) {
      canvas.drawLine(
          Offset(wh / 10 * i, 0), Offset(wh / 10 * i, wh), linePaint);
    }
//白棋子
    Paint paint1 = new Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;
    canvas.drawCircle(
        Offset(wh / 10 * 3, wh / 10 * 3), wh / 10 / 2 - 10, paint1);
    canvas.drawCircle(
        Offset(wh / 10 * 3, wh / 10 * 4), wh / 10 / 2 - 10, paint1);

    //黑棋子

    Paint paint2 = new Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;
    canvas.drawCircle(
        Offset(wh / 10 * 5, wh / 10 * 3), wh / 10 / 2 - 10, paint2);
    canvas.drawCircle(
        Offset(wh / 10 * 5, wh / 10 * 4), wh / 10 / 2 - 10, paint2);

    Paint paintF = new Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;
    for (int i1 = 2; i1 < 8; i1++) {
      canvas.drawCircle(
          Offset(wh / 10 * i1, wh / 10 * 2), wh / 10 / 2 - 10, paintF);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
