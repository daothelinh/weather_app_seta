import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      // controller: PageController(),
      children: [
        // Text('page1'),
        // Text('page1'),
        ...[1, 2].map((e) => Text('page')).toList(),
      ],
    );
  }
}
