import 'package:flutter/material.dart';

import '../widgets/common/title.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.black,
          // title: const TitleWWidget(),
          centerTitle: true,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                TitleWidget(size: 25),
              ]),
          )
        )
      );
  }
}
