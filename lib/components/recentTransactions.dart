import 'package:in_syngo/utilities/themeStyles.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

import '../widgets/transactionCard.dart';
class RecentTransactions extends StatefulWidget {
  const RecentTransactions({super.key});

  @override
  State<RecentTransactions> createState() => _RecentTransactionsState();
}

class _RecentTransactionsState extends State<RecentTransactions> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 15.0,
              right: 15.0,
              bottom: 16.0,
              top: 32.0,
              ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Trusted NGO's",style: ThemeStyles.primaryTitle),
                Text(
                  'Ratings',
                  style: ThemeStyles.seeAll,
                  )
              ],
              ),
          ),
          Flexible(
            flex: 1,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                TransactionCard(
                  color: Color.fromARGB(255, 198, 49, 49),
                  letter: 'S',
                  title: 'Swades Foundation',
                  subTitle: 'Be a part of the Swades Journey',
                  price: '4.8⭐',
                ),
                TransactionCard(
                  color: Color.fromARGB(255, 238, 255, 5),
                  letter: 'C',
                  title: 'CRY (Child Rights and You) ',
                  subTitle: 'Let’s ensure happyHappy Childhoods childhoods for India’s children',
                  price: '4.7⭐',
                ),
                TransactionCard(
                  color: Color(0xff103289),
                  letter: 'S',
                  title: 'Smile Foundation',
                  subTitle: 'TOWARDS ACHIEVING SUSTAINABLE DEVELOPMENT GOALS',
                  price: '4.65⭐',
                ),
                TransactionCard(
                  color: Colors.greenAccent,
                  letter: 'G',
                  title: 'Goonj',
                  subTitle: 'aims to build an equitable relationships',
                  price: '4.5⭐',
                ),
                TransactionCard(
                  color: Color(0xffe695d),
                  letter: 'C',
                  title: 'Care India',
                  subTitle: 'empower women and girls from poor and marginalised communities',
                  price: '4.54⭐',
                ),
                TransactionCard(
                  color: Colors.amberAccent,
                  letter: 'C',
                  title: 'Care India',
                  subTitle: 'Improve Lives bring smiles',
                  price: '4.54⭐',
                ),
                TransactionCard(
                  color: Color(0xffe695d),
                  letter: 'N',
                  title: 'Nanhi Kali',
                  subTitle: 'education for underprivileged girls in India.',
                  price: '4.52⭐',
                ),
                
                TransactionCard(
                  color: Colors.black,
                  letter: 'P',
                  title: 'Pratham',
                  subTitle: 'Every Child in School and Learning well',
                  price: '4.5⭐',
                ),
                
                TransactionCard(
                  color: Color(0xff103289),
                  letter: 'O',
                  title: 'Oxfam India ',
                  subTitle: '#Inequalityisunscceptable',
                  price: '4.5⭐',
                ),
              ],
            ),)
        ]
        ),
    );
  }
}