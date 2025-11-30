import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Container(
          margin: EdgeInsets.only(left: 30),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Text(
                  "Let's Sign you in",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                flex: 1,
                child: Image.asset(
                  'template/img/pizza_welcome.png',
                  height: 32,
                  width: 32,
                ),
              ),
            ],
          ),
        ),
        actions: [],
      ),
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.only(left: 35, right: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Enter registered name to Sign in',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 42),
            Text(
              'Name',
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                border: Border.all(color: Colors.red, width: 1),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black87.withOpacity(0.2),
                    blurRadius: 8,
                    offset: Offset(0, 2),
                    spreadRadius: 2,
                  ),
                  BoxShadow(
                    color: Colors.red.withOpacity(0.2),
                    blurRadius: 12,
                    offset: Offset(2, 0),
                    spreadRadius: 3,
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  border: InputBorder.none, // Ẩn border mặc định của TextField
                  hintText: 'Enter your name',
                  hintStyle: TextStyle(color: Colors.grey[400]),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Password',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8)),
                border: Border.all(color: Colors.red, width: 1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black87.withOpacity(0.2),
                    blurRadius: 8,
                    offset: Offset(2, 0),
                    spreadRadius: 2,
                  ),
                  BoxShadow(
                    color: Colors.red.withOpacity(0.2),
                    blurRadius: 8,
                    offset: Offset(0, 2),
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: TextField(
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  border: InputBorder.none, // Ẩn border mặc định của TextField
                  hintText: 'Enter password',
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            Center(
              child: Text(
                'Or Sign up with',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.g_mobiledata),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.mail_lock),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.tab_unselected),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
