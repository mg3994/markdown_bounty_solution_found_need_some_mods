import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_markdown_latex/flutter_markdown_latex.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:markdown_fade/custom/builder.dart' as bldr;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Markdown Latex Example',
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
    r"""
This is inline latex: $f(x) = \sum_{i=0}^{n} \frac{a_i}{1+x}$

This is block level latex:

$$
c = \pm\sqrt{a^2 + b^2}
$$""",
    r"""This is inline latex: $f(x) = \sum_{i=0}^{n} \frac{a_i}{1+x}$

This is block level latex:

$$
c = \pm\sqrt{a^2 + b^2}
$$

**hi** This is inline latex with displayMode: $$f(x) = \sum_{i=0}^{n} \frac{a_i}{1+x}$$ and""",
    r"""
This is inline latex: $f(x) = \sum_{i=0}^{n} \frac{a_i}{1+x}$

This is block level latex:

$$
c = \pm\sqrt{a^2 + b^2}
$$

**hi** This is inline latex with displayMode: $$f(x) = \sum_{i=0}^{n} \frac{a_i}{1+x}$$ and here is a very long text that should be in the same line.

The relationship between the height and the side length of an equilateral triangle is:

\[ \text{Height} = \frac{\sqrt{3}}{2} \times \text{Side Length} \]

\[ \text{X} = \frac{1}{2} \times \text{Y} \times \text{Z} =""",
    r"""
This is inline latex: $f(x) = \sum_{i=0}^{n} \frac{a_i}{1+x}$

This is block level latex:

$$
c = \pm\sqrt{a^2 + b^2}
$$

**hi** This is inline latex with displayMode: $$f(x) = \sum_{i=0}^{n} \frac{a_i}{1+x}$$ and here is a very long text that should be in the same line.

The relationship between the height and the side length of an equilateral triangle is:

\[ \text{Height} = \frac{\sqrt{3}}{2} \times \text{Side Length} \]

\[ \text{X} = \frac{1}{2} \times \text{Y} \times \text{Z} = \frac{1}{2} \times 9 \times \frac{\sqrt{3}}{2} \times 9 = \frac{81\sqrt{3}}{4} \]

The basic form of the Taylor series is:

\[f(x) = f(a) + f'(a)(x-a) + \frac{f''(a)}{2!}(x-a)^2 + \frac{f'''(a)}{3!}(x-a)^3 + \cdots\]

where \(f(x)\) is the function to be expanded, \(a\) is the expansion point, \(f'(a)\), \(f''(a)\), \(f'''(a)\), etc., are the first, second, third, and so on derivatives of the function at point \(a\), and \(n!\) denotes the factorial of \(n\).

In particular, when \(a=0\), this expansion is called the Maclaurin series.

"""
  ];

  String previousText = "";
  String currentText = "";
  String newText = "";

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
        title: const Text('Latex Markdown Example'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Markdown(
            selectable: true,
            data: currentText,
            builders: {
              'latex': bldr.LatexElementBuilder(
                textStyle: const TextStyle(
                  // color: Colors.blue,
                  fontWeight: FontWeight.w100,
                ),
                textScaleFactor: 1.2,
              ),
            },
            extensionSet: md.ExtensionSet(
              [LatexBlockSyntax()],
              [LatexInlineSyntax()],
            ),
          )),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Move to the next version and restart the animation
          int nextIndex = (markdownVersions.indexOf(currentText) + 1) %
              markdownVersions.length;
          _updateText(nextIndex);
        },
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
