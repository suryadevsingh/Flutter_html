
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';


void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HelloWorldScreen(),
    );
  }
}

class HelloWorldScreen extends StatelessWidget {
  static const kHtml = """
<h1>Heading</h1>
<p>A paragraph with <strong>strong</strong> <em>emphasized</em> text.</p>
<ol>
  <li>List item number one</li>
  <li>
    Two
    <ul>
      <li>2.1 (nested)</li>
      <li>2.2</li>
    </ul>
  </li>
  <li>Three</li>
</ol>
<p>And YouTube video!</p>
<iframe src="https://www.youtube.com/embed/jNQXAC9IVRw" width="560" height="315"></iframe>
""";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("helloworldscreen"),
      ),
      body: HtmlWidget(
        kHtml,
        webView: true,
        factoryBuilder: (config) => _CustomWidgetFactory(config),
      ),
    );
  }
}
class _CustomWidgetFactory extends WidgetFactory {
  _CustomWidgetFactory(HtmlWidgetConfig config) : super(config);

  @override
  NodeMetadata parseLocalName(NodeMetadata meta, String localName) {
    meta = super.parseLocalName(meta, localName);

    if (localName == 'blockquote') {
      meta = lazySet(meta, styles: ['height', '10']);
    }

    return meta;
  }
}
