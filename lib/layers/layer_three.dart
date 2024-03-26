import 'package:flutter/material.dart';
import 'package:hope/layers/config.dart'; // Assuming this holds color variables

class LayerThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isChecked = false;

    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.stretch, // Ensure children take full width
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              hintText: 'Enter User ID or Email',
              hintStyle: TextStyle(color: hintText),
            ),
          ),
          SizedBox(height: 20), // Added space between fields
          TextField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              hintText: 'Enter Password',
              hintStyle: TextStyle(color: hintText),
            ),
          ),
          SizedBox(height: 20), // Added space before Forgot Password
          Text(
            'Forgot Password',
            style: TextStyle(
              color: forgotPasswordText,
              fontSize: 16,
              fontFamily: 'Poppins-Medium',
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 20), // Added space before Remember Me
          Row(
            children: [
              Checkbox(
                checkColor: Colors.black,
                activeColor: checkbox,
                value: isChecked,
                onChanged: (bool? value) {
                  isChecked = value!;
                },
              ),
              Text(
                'Remember Me',
                style: TextStyle(
                  color: forgotPasswordText,
                  fontSize: 16,
                  fontFamily: 'Poppins-Medium',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 20), // Added space before New User section
          Row(
            mainAxisAlignment: MainAxisAlignment.center, // Center the content
            children: [
              Text(
                'New User? ',
                style: TextStyle(
                  fontSize: 16.0,
                  color: hintText,
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
                    color: signInButton,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20), // Added space before Sign In button
          ElevatedButton(
            onPressed: () {
              // Add your login logic here
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: signInButton,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
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
          SizedBox(height: 20), // Added space before Social login options
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceEvenly, // Space evenly between children
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: 48,
                decoration: BoxDecoration(
                  border: Border.all(color: signInBox),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/icon_google.png', // Replace with your Google icon
                      width: 20,
                      height: 21,
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      'Google',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Poppins-Regular',
                        color: hintText,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'or',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Poppins-Regular',
                  color: hintText,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: 48,
                decoration: BoxDecoration(
                  border: Border.all(color: signInBox),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/icon_apple.png', // Replace with your Apple icon
                      width: 20,
                      height: 21,
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      'Apple',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Poppins-Regular',
                        color: hintText,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
