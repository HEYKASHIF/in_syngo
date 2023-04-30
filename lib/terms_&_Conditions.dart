import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class TermsConditions extends StatefulWidget {
  const TermsConditions({super.key});

  @override
  State<TermsConditions> createState() => _TermsConditionsState();
}

class _TermsConditionsState extends State<TermsConditions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.pink,
        title: Text('TERMS & CONDITIONS'),
      ),
      body: Text(
        "The security of your personal information is important to us. This Privacy Policy is designed to help you feel more confident about the privacy and security of your information when using or accessing any digital content (“Service”).By using our Service you agree to the collection and use of your personal information by us in accordance with this Privacy Policy. This Privacy Policy (together with our Terms and Conditions of Use) sets out the basis on which we process any personal information we collect from you, or that you provide to us through the Service.The terms “GI”/”we”/”our”/”us” when used in this TERMS | PRIVACY POLICY means “IN_SYNGO Platform” , and “you”/”your” means you as a user of our Service.",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
