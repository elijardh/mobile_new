import 'package:flutter/material.dart';
import '';

class ArticleView extends StatefulWidget {
  final String url;
  ArticleView({@required this.url});
  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.black12,
        title: Container(
          alignment: Alignment.center,
          child: RichText(text: TextSpan(children: [
            TextSpan(text: 'Mobile', style: TextStyle(fontSize: 20,fontFamily: 'Montserrat', color: Colors.black)),
            TextSpan(text: 'NEWS', style: TextStyle(fontSize: 20,color: Colors.blueAccent, fontWeight: FontWeight.bold, fontFamily: 'Playfair')),
          ])),
        ),
      ),
      body: Container()
    );
  }
}
