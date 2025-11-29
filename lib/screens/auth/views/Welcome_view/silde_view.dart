import 'package:flutter/material.dart';
import 'package:pizza_app/screens/auth/views/sign_in_screen.dart';
import 'package:pizza_app/screens/auth/views/sign_up_screen.dart';

class SildeView extends StatefulWidget {
  const SildeView({super.key});

  @override
  State<SildeView> createState() => _SildeViewState();
}

class _SildeViewState extends State<SildeView> {
  int currentIndex = 0;
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20, top: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SignInScreen()),
                );
              },
              child: Text(
                "Skip",
                style: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Arial',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            children: const [
              creatPage(
                img: 'template/img/slide1.png',
                title: 'Get Delivered at your door step',
                decp: 'Your food at your door step and just click on one step.',
                buttonText: 'Next',
              ),
              creatPage(
                img: 'template/img/slide2.png',
                title: 'Pick Up Delivery at your door and enjoy',
                decp: 'Your food at your door step and just click on one step.',
                buttonText: 'Get Started',
              ),
              SignOrScreen(),
            ],
          ),
          Positioned(
            bottom:30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildIndicator(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 3),
      height: 8,
      width: isActive ? 32 : 8,
      decoration: BoxDecoration(
        color: isActive
            ? Color(0xFFEF1C26)
            : Color(0xFFEF1C26).withOpacity(0.3),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < 3; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }
}

class creatPage extends StatelessWidget {
  final String img;
  final String title;
  final String decp;
  final String buttonText;
  const creatPage({
    super.key,
    required this.img,
    required this.title,
    required this.decp,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
        child: Column(
          children: [
            // Phần nội dung có thể mở rộng
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      img,
                      fit: BoxFit.cover,
                      height: 430,
                      width: double.infinity,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      decp,
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            
            // Button cố định
            Container(
              width: double.infinity,
              height: 50,
              margin: const EdgeInsets.only(bottom: 70),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SignInScreen()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFEF1C26),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      buttonText,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Sign or Register Screen
class SignOrScreen extends StatelessWidget {
  const SignOrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'template/img/slide3.png',
            fit: BoxFit.cover,
            height: 400,
            width: double.infinity,
          ),
          const SizedBox(height: 20),
          Text(
            "Let's Get Started",
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            "Create an account or sign in to get started",
            style: const TextStyle(fontSize: 14, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SignInScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFEF1C26),
              minimumSize: Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              "Sign In",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SignUpScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              minimumSize: Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(color: Color(0xFFEF1C26)),
              ),
            ),
            child: Text(
              "Register",
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
