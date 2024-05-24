import 'dart:async';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:kalam_news_publication/app/common/methods/knp_methods.dart';
import 'package:kalam_news_publication/app/common/packages/scroll_behavior.dart';
import 'package:kalam_news_publication/app/common/page_const_var/define_languages.dart';
import 'package:kalam_news_publication/app/get_material_controller/ac.dart';
import 'package:kalam_news_publication/app/theme/theme_data/theme_data.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'app/routes/app_pages.dart';

import 'dart:math';

void main() {

  const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark, // For iOS: (dark icons)
      statusBarIconBrightness: Brightness.dark, // For Android(M and greater): (dark icons)
      systemNavigationBarIconBrightness: Brightness.dark
  );

  WidgetsFlutterBinding.ensureInitialized();

  late StreamSubscription streamSubscription;

  AC().getNetworkConnectionType();
  streamSubscription = AC().checkNetworkConnection();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) async {
    runApp(
      DevicePreview(
        enabled: false,
        builder: (context) => ResponsiveSizer(
          builder: (buildContext, orientation, screenType) => GestureDetector(
            onTap: () async {
              KNPMethods.unFocsKeyBoard();
              await Fluttertoast.cancel();
            },
            child: GetMaterialApp(
              title: "Application",
              translations: LanguageTranslations(),
              locale: const Locale("en", "US"),
              theme: AppThemeData.kNPThemeData(fontFamily: 'HelveticaNeue'),
              initialRoute: AppPages.INITIAL,
              getPages: AppPages.routes,
              defaultTransition: Transition.rightToLeft,
              debugShowCheckedModeBanner: false,
              scrollBehavior: ListScrollBehavior(),
            ),
          ),
        ),
      ),
    );
  });

}

/*void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Custom Spinner Example'),
        ),
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset('assets/image/wheel.png'),
              Padding(
                padding:  EdgeInsets.only(bottom: 34.px),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CustomSpinner(
                      colors: const [
                        Colors.red,
                        Colors.white,
                        Colors.blue,
                        Colors.white,
                        Colors.orange,
                        Colors.white,
                        Colors.cyan,
                        Colors.white,
                        Colors.teal,
                        Colors.white,
                        Colors.indigo,
                        Colors.white,
                      ],
                      labels: const [
                        '5\$',
                        '10\$',
                        'ZERO',
                        '2\$',
                        '50\$',
                        '1\$',
                        '15\$',
                        '100\$',
                        '15\$',
                        'JACKPOT',
                        '20\$',
                        '5\$',
                      ],
                      targetIndex: randomNumberMethod(),
                    ),
                    Container(
                      height: 26,
                      width: 26,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white,
                            blurRadius: 10,
                            spreadRadius: 4,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  int randomNumberMethod() {
    Random random = Random();
    int randomNumber = random.nextInt(12);
    print('Selected Segment: $randomNumber');
    return randomNumber;
  }
}

class PointerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class CustomSpinner extends StatefulWidget {
  final List<Color> colors;
  final List<String> labels;
  final int targetIndex;

  const CustomSpinner({super.key, required this.colors, required this.labels, required this.targetIndex});

  @override
  _CustomSpinnerState createState() => _CustomSpinnerState();
}

class _CustomSpinnerState extends State<CustomSpinner> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );

    final double sweepAngle = 2 * pi / widget.colors.length;
    final double targetAngle = (widget.targetIndex * sweepAngle) + (sweepAngle / 2);

    _animation = Tween<double>(
      begin: 0,
      end: 2 * pi * 5 + targetAngle,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {});
      });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: SpinnerPainter(widget.colors, widget.labels, _animation.value),
      child: SizedBox(
        width: 300,
        height: 300,
      ),
    );
  }
}

class SpinnerPainter extends CustomPainter {
  final List<Color> colors;
  final List<String> labels;
  final double rotationAngle;

  SpinnerPainter(this.colors, this.labels, this.rotationAngle);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2);

    final sweepAngle = 2 * pi / colors.length;
    for (int i = 0; i < colors.length; i++) {
      final startAngle = i * sweepAngle + rotationAngle;
      paint.color = colors[i];
      canvas.drawArc(Rect.fromCircle(center: center, radius: radius), startAngle, sweepAngle, true, paint);

      canvas.save();
      canvas.translate(center.dx, center.dy);
      canvas.rotate(startAngle + sweepAngle / 2);
      final textPainter = TextPainter(
        text: TextSpan(
          text: labels[i],
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      )..layout();

      textPainter.paint(
        canvas,
        Offset(radius - 60, -textPainter.height / 2),
      );
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}*/