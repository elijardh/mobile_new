import 'package:flutter/material.dart';
import 'newsapi.dart';
import 'data.dart';
import 'webview.dart';

class CategoryNews extends StatefulWidget {
  final String category;

  CategoryNews({@required this.category});

  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  bool loading = true;

  List<Article> article = new List<Article>();

  getNews() async {
    CategoryNewsClass categoryNewsClass = new CategoryNewsClass();
    await categoryNewsClass.getCate(widget.category);
    article = categoryNewsClass.articles;
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNews();
  }

  @override
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
        body: loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return blogNews(
                        article[index].urlToImage,
                        article[index].title,
                        article[index].description,
                        article[index].url);
                  },
                  itemCount: article.length,
                ),
              ));
  }

  Widget blogNews(String url, String title, String desc, String arturl) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.black12, borderRadius: BorderRadius.circular(20)),
        margin: EdgeInsets.only(right: 10, left: 10, top: 10),
        child: Column(
          children: <Widget>[
            ClipRRect(
              child: Image.network(url),
              borderRadius: BorderRadius.circular(20),
            ),
            Container(
              child: Text(
                title,
                style: TextStyle(fontFamily: 'Playfair'),
              ),
              margin: EdgeInsets.all(3),
            ),
            Container(
              child: Text(
                desc,
                style: TextStyle(fontFamily: 'Montserrat'),
              ),
              margin: EdgeInsets.all(5),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ArticleView(url: arturl)));
      },
    );
  }
}
