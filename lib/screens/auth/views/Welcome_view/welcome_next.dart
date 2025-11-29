import 'package:flutter/material.dart';
import 'package:pizza_app/screens/auth/views/Welcome_view/silde_view.dart';

class WelcomeNext extends StatefulWidget {
  const WelcomeNext({super.key});

  @override
  State<WelcomeNext> createState() => _WelcomeNextState();
}

class _WelcomeNextState extends State<WelcomeNext> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEF1C26),
      body: Center(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Welcome to",
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Pizza App",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30),
                      SizedBox(height: 10),
                      Container(
                        width: 300,
                        child: Text(
                          "Our chefs are working 24/7 and are ready to accept visitors and at any time of the day and night.",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    width: double.infinity,
                    constraints: BoxConstraints(maxWidth: 400, maxHeight: 400),
                    child: Image.asset(
                      'template/img/user_eating.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
        
            Positioned(
              left: 0,
              right: 0,
              bottom: 30,
              child: Container(
                alignment: Alignment.center,
                child: FloatingActionButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => SildeView()),
                    // );
                    _navigateWithCustomSlideAnimation(context);
                  },
                  backgroundColor: Colors.white,
                  child: Icon(Icons.arrow_forward, color: Color(0xFFEF1C26)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
    void _navigateWithCustomSlideAnimation(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => SildeView(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          // Animation cho trang mới (slide từ phải sang trái)
          const newPageBegin = Offset(1.0, 0.0);
          const newPageEnd = Offset.zero;
          const newPageCurve = Curves.easeInOutCubic;
          
          var newPageTween = Tween(begin: newPageBegin, end: newPageEnd)
              .chain(CurveTween(curve: newPageCurve));
          var newPageAnimation = animation.drive(newPageTween);
          
          // Animation cho trang hiện tại (slide từ trái sang trái)
          const currentPageBegin = Offset.zero;
          const currentPageEnd = Offset(-0.3, 0.0); // Di chuyển sang trái một chút
          const currentPageCurve = Curves.easeInOutCubic;
          
          var currentPageTween = Tween(begin: currentPageBegin, end: currentPageEnd)
              .chain(CurveTween(curve: currentPageCurve));
          var currentPageAnimation = animation.drive(currentPageTween);
          
          return Stack(
            children: [
              SlideTransition(
                position: currentPageAnimation,
                child: Container(color: Color(0xFFEF1C26)), // Màu nền của trang hiện tại
              ),
              SlideTransition(
                position: newPageAnimation,
                child: child,
              ),
            ],
          );
        },
        transitionDuration: Duration(milliseconds: 780),
      ),
    );
  }
}
