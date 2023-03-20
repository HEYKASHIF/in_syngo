import 'package:in_syngo/utilities/themeColors.dart';
import 'package:in_syngo/utilities/themeStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CreditCard2 extends StatefulWidget {
  const CreditCard2({super.key});

  @override
  State<CreditCard2> createState() => _CreditCard2State();
}

class _CreditCard2State extends State<CreditCard2> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 216,
        width: 380,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 0, 78, 212),
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 20.0,
                  ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Resp ⬆️', style: ThemeStyles.cardMoney),
                    SvgPicture.asset('assets/hide-icon.svg')

                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 24.0,
                  bottom: 32.0,
                  ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Books',style:ThemeStyles.cardDetail),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 6.0),
                          child: Text('35.7 ⬆️',style: ThemeStyles.cardDetail),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6.0,),
                          child: SvgPicture.asset("assets/card-dots.svg"),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6.0,),
                          child: SvgPicture.asset("assets/card-dots.svg"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 6.0),
                          child: Text('10.3 ⬆️',style: ThemeStyles.cardDetail),
                        )
                      ],
                    )
                  ],

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}