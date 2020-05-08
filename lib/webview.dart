import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

const kAndroidUserAgent =
    'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Mobile Safari/537.36';

class ArticleView extends StatefulWidget {
  final String url;

  ArticleView({@required this.url});

  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.black12,
        title: Container(
          alignment: Alignment.center,
          child: RichText(
              text: TextSpan(children: [
            TextSpan(
                text: 'Mobile',
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Montserrat',
                    color: Colors.black)),
            TextSpan(
                text: 'NEWS',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Playfair')),
          ])),
        ),
      ),
      body: WebView(
        initialUrl: widget.url,
      ),
    );
//      WebviewScaffold(url: widget.url,
//        hidden: true,
//        initialChild: Container(
//          child: Center(
//            child: CircularProgressIndicator(),
//          ),
//        ),
//        withZoom: true,
//      appBar: AppBar(
//        centerTitle: true,
//        elevation: 0,
//        backgroundColor: Colors.black12,
//        title: Container(
//          alignment: Alignment.center,
//          child: RichText(text: TextSpan(children: [
//            TextSpan(text: 'Mobile', style: TextStyle(fontSize: 20,fontFamily: 'Montserrat', color: Colors.black)),
//            TextSpan(text: 'NEWS', style: TextStyle(fontSize: 20,color: Colors.blueAccent, fontWeight: FontWeight.bold, fontFamily: 'Playfair')),
//          ])),
//        ),
//      ),
//      bottomNavigationBar:  BottomAppBar(
//        child: Row(
//          children: <Widget>[
//            IconButton(icon: Icon(Icons.refresh), onPressed: (){
//              flutterWebViewPlugin.reload;
//            }),
//            IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
//              flutterWebViewPlugin.goBack();
//            }),
//            IconButton(icon: Icon(Icons.forward), onPressed: (){
//              flutterWebViewPlugin.goForward();
//            })
//          ],
//        ),
//      ),
//      );
  }
}
