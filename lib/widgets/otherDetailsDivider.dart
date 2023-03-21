import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class OtherDetailsDivider extends StatefulWidget {
  const OtherDetailsDivider({super.key});

  @override
  State<OtherDetailsDivider> createState() => _OtherDetailsDividerState();
}

class _OtherDetailsDividerState extends State<OtherDetailsDivider> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Divider(
        color: Colors.grey.withOpacity(0.4),
        thickness: 0.5,
        indent: 16,
        endIndent: 16,
        
      ),
    );
  }
}