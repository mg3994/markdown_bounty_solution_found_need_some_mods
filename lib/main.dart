import 'package:flutter/material.dart';

import 'package:flutter_markdown/flutter_markdown.dart';

import 'custom/one_widget.dart';
//

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      checkerboardRasterCacheImages: false,
      title: 'Flutter Markdown Fadein Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> markdownVersions = [
    "## Problem\nThis is the main issue with what",
    "## Problem\nThis is the main issue with what we're trying to solve.",
    "## Problem\nThis is the main issue with what we're trying to solve. The current solution is insufficient for handling edge cases,",
    "## Problem\nThis is the main issue with what we're trying to solve. The current solution is insufficient for handling edge cases, and it leads to frequent breakdowns in production.",
    "## Problem\nThis is the main issue with what we're trying to solve. The current solution is insufficient for handling edge cases, and it leads to frequent breakdowns in production. As a result, customer satisfaction has dropped significantly.",
    "## Problem\nThis is the main issue with what we're trying to solve. The current solution is insufficient for handling edge cases, and it leads to frequent breakdowns in production. As a result, customer satisfaction has dropped significantly. We need a more robust solution.",
    "## Problem\nThis is the main issue with what we're trying to solve. The current solution is insufficient for handling edge cases, and it leads to frequent breakdowns in production. As a result, customer satisfaction has dropped significantly. We need a more robust solution that can handle these edge cases effectively.",
    "## Problem\nThis is the main issue with what we're trying to solve. The current solution is insufficient for handling edge cases, and it leads to frequent breakdowns in production. As a result, customer satisfaction has dropped significantly. We need a more robust solution that can handle these edge cases effectively. This will require a complete overhaul of the system.",
    "## Problem\nThis is the main issue with what we're trying to solve. The current solution is insufficient for handling edge cases, and it leads to frequent breakdowns in production. As a result, customer satisfaction has dropped significantly. We need a more robust solution that can handle these edge cases effectively. This will require a complete overhaul of the system. The new system should be designed with scalability and reliability in mind.",
    "## Problem\nThis is the main issue with what we're trying to solve. The current solution is insufficient for handling edge cases, and it leads to frequent breakdowns in production. As a result, customer satisfaction has dropped significantly. We need a more robust solution that can handle these edge cases effectively. This will require a complete overhaul of the system. The new system should be designed with scalability and reliability in mind. Additionally, it should be user-friendly and easy to maintain.",
    "## Problem\nThis is the main issue with what we're trying to solve. The current solution is insufficient for handling edge cases, and it leads to frequent breakdowns in production. As a result, customer satisfaction has dropped significantly. We need a more robust solution that can handle these edge cases effectively. This will require a complete overhaul of the system. The new system should be designed with scalability and reliability in mind. Additionally, it should be user-friendly and easy to maintain. The development team should also consider implementing automated testing to ensure the system's stability.",
    "## Problem\nThis is the main issue with what we're trying to solve. The current solution is insufficient for handling edge cases, and it leads to frequent breakdowns in production. As a result, customer satisfaction has dropped significantly. We need a more robust solution that can handle these edge cases effectively. This will require a complete overhaul of the system. The new system should be designed with scalability and reliability in mind. Additionally, it should be user-friendly and easy to maintain. The development team should also consider implementing automated testing to ensure the system's stability. Regular user feedback should be collected to continuously improve the system.",
    "## Problem\nThis is the main issue with what we're trying to solve. The current solution is insufficient for handling edge cases, and it leads to frequent breakdowns in production. As a result, customer satisfaction has dropped significantly. We need a more robust solution that can handle these edge cases effectively. This will require a complete overhaul of the system. The new system should be designed with scalability and reliability in mind. Additionally, it should be user-friendly and easy to maintain. The development team should also consider implementing automated testing to ensure the system's stability. Regular user feedback should be collected to continuously improve the system. The project should be managed using agile methodologies to ensure flexibility and adaptability.",
    "## Problem\nThis is the main issue with what we're trying to solve. The current solution is insufficient for handling edge cases, and it leads to frequent breakdowns in production. As a result, customer satisfaction has dropped significantly. We need a more robust solution that can handle these edge cases effectively. This will require a complete overhaul of the system. The new system should be designed with scalability and reliability in mind. Additionally, it should be user-friendly and easy to maintain. The development team should also consider implementing automated testing to ensure the system's stability. Regular user feedback should be collected to continuously improve the system. The project should be managed using agile methodologies to ensure flexibility and adaptability. The team should also focus on documentation and knowledge sharing to ensure smooth onboarding of new team members.",
    "## Problem\nThis is the main issue with what we're trying to solve. The current solution is insufficient for handling edge cases, and it leads to frequent breakdowns in production. As a result, customer satisfaction has dropped significantly. We need a more robust solution that can handle these edge cases effectively. This will require a complete overhaul of the system. The new system should be designed with scalability and reliability in mind. Additionally, it should be user-friendly and easy to maintain. The development team should also consider implementing automated testing to ensure the system's stability. Regular user feedback should be collected to continuously improve the system. The project should be managed using agile methodologies to ensure flexibility and adaptability. The team should also focus on documentation and knowledge sharing to ensure smooth onboarding of new team members. The system should be regularly audited for security vulnerabilities to ensure data protection.",
    "## Problem\nThis is the main issue with what we're trying to solve. The current solution is insufficient for handling edge cases, and it leads to frequent breakdowns in production. As a result, customer satisfaction has dropped significantly. We need a more robust solution that can handle these edge cases effectively. This will require a complete overhaul of the system. The new system should be designed with scalability and reliability in mind. Additionally, it should be user-friendly and easy to maintain. The development team should also consider implementing automated testing to ensure the system's stability. Regular user feedback should be collected to continuously improve the system. The project should be managed using agile methodologies to ensure flexibility and adaptability. The team should also focus on documentation and knowledge sharing to ensure smooth onboarding of new team members. The system should be regularly audited for security vulnerabilities to ensure data protection. The system should also be designed to comply with relevant regulations and standards.",
    "## Problem\nThis is the main issue with what we're trying to solve. The current solution is insufficient for handling edge cases, and it leads to frequent breakdowns in production. As a result, customer satisfaction has dropped significantly. We need a more robust solution that can handle these edge cases effectively. This will require a complete overhaul of the system. The new system should be designed with scalability and reliability in mind. Additionally, it should be user-friendly and easy to maintain. The development team should also consider implementing automated testing to ensure the system's stability. Regular user feedback should be collected to continuously improve the system. The project should be managed using agile methodologies to ensure flexibility and adaptability. The team should also focus on documentation and knowledge sharing to ensure smooth onboarding of new team members. The system should be regularly audited for security vulnerabilities to ensure data protection. The system should also be designed to comply with relevant regulations and standards. The system should be regularly updated to incorporate the latest",
    //  §technologies§ ~and best practices~ black text  black text ", //i am facing issue as at last it makes 2 copies
  ];

  String previousText = "";
  String currentText = "";
  String newText = "";

  //  GlobalKey _currentKey = GlobalKey();
  // GlobalKey _previousKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    // Initialize text and animation for the first version
    _updateText(0);
  }

  void _updateText(int versionIndex) {
    if (versionIndex < 0 || versionIndex >= markdownVersions.length) return;

    setState(() {
      previousText = versionIndex > 0 ? markdownVersions[versionIndex - 1] : "";
      currentText = markdownVersions[versionIndex];
      newText = _findNewText(previousText, currentText);
    });
  }

  // Compare previous and current text to return the newly added portion

  String _findNewText(String oldText, String newText) {
    if (oldText == newText) return "";
    return newText.substring(oldText.length); // Get new text after old text
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Markdown Fadein Example'),
      ),
      body: FadingMarkdownComponent(
        newData: currentText,
         previousData: previousText,
      ),
      //  FadeMarkdown(
      //     // key: ValueKey(currentText),
      //     previousText: previousText,
      //     currentText: currentText),

      //  Stack(
      //   children: [
      //     MarkdownBody(data: previousText).animate().fadeOut(
      //           duration: const Duration(milliseconds: 2000),
      //           curve: Curves.linear,
      //           begin: 1.0,
      //         ), //fade it out say hide it
      //     MarkdownBody(data: currentText).animate().fadeIn(
      //           duration: const Duration(milliseconds: 2000),
      //           curve: Curves.linear,
      //           begin: 0.0,
      //         ), //show it
      //   ],
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Move to the next version and restart the animation
          int nextIndex = (markdownVersions.indexOf(currentText) + 1) %
              markdownVersions.length;
          _updateText(nextIndex);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class FadeMarkdown extends StatefulWidget {
  final String previousText;
  final String currentText;
  const FadeMarkdown(
      {super.key, required this.previousText, required this.currentText});

  @override
  State<FadeMarkdown> createState() => _FadeMarkdownState();
}

class _FadeMarkdownState extends State<FadeMarkdown>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..forward(from: 0.0);
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void didUpdateWidget(covariant FadeMarkdown oldWidget) {
    if (widget.currentText != oldWidget.currentText ||
        widget.previousText != oldWidget.previousText) {
      _controller.forward(from: 0.0);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: _animation,
        builder: (context, value, child) {
          return Stack(
            clipBehavior: Clip.none,
            children: [
              Opacity(
                opacity: 1 - _animation.value, // Start with fading out

                child: MarkdownBody(data: widget.previousText),
              ),
              Opacity(
                opacity: _animation.value,
                child: MarkdownBody(data: widget.currentText),
              ),
            ],
          );
        });
  }
}
