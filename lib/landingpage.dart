import 'package:flutter/material.dart';
import 'newsfeedpage.dart';
import 'data.dart';
import 'newsapi.dart';
import 'webview.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  List<Category> categories = new List<Category>();
  List<Article> article = new List<Article>();

  bool loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState(
    );
    getNews();
    categories = getCategories();
  }
  getNews() async {
    News newsclass = new News();
    await newsclass.getNews();
    article = newsclass.articles;
    setState(() {
      loading = false;
    });
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
            child: RichText(text: TextSpan(children: [
              TextSpan(text: 'Mobile', style: TextStyle(fontSize: 20,fontFamily: 'Montserrat', color: Colors.black)),
              TextSpan(text: 'NEWS', style: TextStyle(fontSize: 20,color: Colors.blueAccent, fontWeight: FontWeight.bold, fontFamily: 'Playfair')),
            ])),
          ),
        ),
        body: loading ? Center(
          child: Container(
            child: CircularProgressIndicator(),
          ),
        ) :
        SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
//            Padding(padding: EdgeInsets.only(top: 15)),
                Container(height: 50,
                  padding: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(color: Colors.black12),
                  child: ListView.builder(itemBuilder: (context, index) {
                    return categoryFormat(categories[index].categoryImage, categories[index].categoryName);
                  },
                    itemCount: categories.length,
                  physics: ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  ),
                ),
                ListView.builder(itemBuilder: (context, index){
                  return blogNews(article[index].urlToImage, article[index].title, article[index].description, article[index].url);
                }, itemCount: article.length,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),)
              ],
            ),
          ),
        )
    );
  }
  Widget categoryFormat(String img, String name){
    return GestureDetector(
      child: Container(
        height: 20,
        decoration: BoxDecoration(color: Colors.white30,
        borderRadius: BorderRadius.circular(30)),
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Row(
            children: <Widget>[
              ClipRRect(child: Image.asset(img, height: 30, width: 30,),
                borderRadius: BorderRadius.circular(10),
              ),
              SizedBox(width: 10,),
              Container(child: Text(name.toUpperCase(), style:TextStyle(color: Colors.black, fontFamily: 'Montserrat'),),)
            ],
          ),
      ),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryNews(category: name,) ));
      },
    );
  }
  Widget blogNews(String url, String title, String desc, String aurl) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(color: Colors.black12, borderRadius: BorderRadius.circular(20)),
        margin: EdgeInsets.only(right: 10, left: 10, top: 10),
        child: Column(
          children: <Widget>[
            ClipRRect(
              child: Image.network(url),
              borderRadius: BorderRadius.circular(20),
            ),
            Container(child: Text(title, style: TextStyle(fontFamily: 'Playfair'),),
            margin: EdgeInsets.all(5),),
            SizedBox(height: 3),
            Container(child: Text(desc, style: TextStyle(fontFamily: 'Montserrat'),),
            margin: EdgeInsets.all(5),),
          ],
        ),
      ),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ArticleView(url: aurl)));
      },
    );
  }
}

