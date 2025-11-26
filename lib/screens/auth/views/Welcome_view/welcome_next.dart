import 'package:flutter/material.dart';
import 'package:pizza_app/screens/auth/views/Welcome_view/welcome_screen.dart';

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
      body: Stack(
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
                      style: TextStyle(color: Colors.white, fontSize: 24)
                    ),
                    SizedBox(height: 10,),  
                    Text(
                      "Pizza App", 
                      style: TextStyle(
                        color: Colors.white, 
                        fontSize: 36, 
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 30,),
                    SizedBox(height: 10,),
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
                  child: Image.asset(
                    'template/img/user_eating.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
        
          // button chuyển trang
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 30),
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WelcomeScreen()),
                    );
                  },
                  backgroundColor: Colors.white,
                  child: Icon(Icons.arrow_forward, color: Color(0xFFEF1C26)),
                ),
              ),
          ],
          ),
        ],
      ),
    );
  }
}