import 'package:flutter/material.dart';
import 'package:hope/layers/config.dart';

class LayerThree extends StatefulWidget {
  @override
  _LayerThreeState createState() => _LayerThreeState();
}

class _LayerThreeState extends State<LayerThree> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20),
          _buildTextField(
            hintText: 'Enter User ID or Email',
            icon: Icons.person_outline,
          ),
          SizedBox(height: 20),
          _buildTextField(
            hintText: 'Enter Password',
            icon: Icons.lock_outline,
          ),
          SizedBox(height: 20),
          _buildForgotPasswordText(),
          SizedBox(height: 20),
          _buildRememberMeRow(),
          SizedBox(height: 20),
          _buildNewUserRow(),
          SizedBox(height: 20),
          _buildSignInButton(),
          SizedBox(height: 20),
          _buildSocialLoginOptions(),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildTextField({required String hintText, required IconData icon}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            icon,
            color: Config.hintText,
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: Config.hintText),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
      ),
    );
  }

  Widget _buildForgotPasswordText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextButton(
        onPressed: () {
          // Handle forgot password action
        },
        child: Text(
          'Forgot Password?',
          style: TextStyle(
            color: Config.forgotPasswordText,
            fontSize: 16,
            fontFamily: 'Poppins-Medium',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildRememberMeRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Checkbox(
            checkColor: Colors.white,
            activeColor: Config.checkbox,
            value: _isChecked,
            onChanged: (bool? value) {
              setState(() {
                _isChecked = value!;
              });
            },
          ),
          Text(
            'Remember Me',
            style: TextStyle(
              color: Config.hintText,
              fontSize: 16,
              fontFamily: 'Poppins-Medium',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNewUserRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'New User? ',
            style: TextStyle(
              fontSize: 16.0,
              color: Config.hintText,
            ),
          ),
          TextButton(
            onPressed: () {
              // Handle sign-up navigation (replace with your logic)
              print('Navigate to Sign Up page');
            },
            child: Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 16.0,
                color: Config.signInButton,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignInButton() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        onPressed: () {
          // Add your login logic here
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Config.signInButton,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Text(
            'Sign In',
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'Poppins-Medium',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialLoginOptions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildSocialLoginOption(
            icon: 'images/icon_google.png', // Replace with your Google icon
            label: 'Google',
          ),
          SizedBox(width: 20),
          Text(
            'or',
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'Poppins-Regular',
              color: Config.hintText,
            ),
          ),
          SizedBox(width: 20),
          _buildSocialLoginOption(
            icon: 'images/icon_apple.png', // Replace with your Apple icon
            label: 'Apple',
          ),
        ],
      ),
    );
  }

  Widget _buildSocialLoginOption(
      {required String icon, required String label}) {
    return Container(
      width: 110,
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Config.signInBox),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextButton(
        onPressed: () {
          // Handle social login action
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              width: 20,
              height: 21,
            ),
            SizedBox(width: 10),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Poppins-Regular',
                color: Config.hintText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
