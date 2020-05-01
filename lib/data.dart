import 'newsapi.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

List<Category> getCategories(){
  List<Category> categories = new List<Category>();

  Category category =  new Category();

  //1
  category = new Category();
  category.categoryName = 'business';
  category.categoryImage = 'asset/images.png';

  categories.add(category);

  //2
  category = new Category();
  category.categoryImage = 'asset/entertainment.png';
  category.categoryName = 'entertainment';

  categories.add(category);

  //3
  category = new Category();
  category.categoryImage = 'asset/technology.jpg';
  category.categoryName = 'technology';

  categories.add(category);

  //4
  category = new Category();
  category.categoryImage = 'asset/health.jpg';
  category.categoryName = 'health';

  categories.add(category);

  //5
  category = new Category();
  category.categoryImage = 'asset/sport.jpg';
  category.categoryName = 'sports';

  categories.add(category);

  //6
  category = new Category();
  category.categoryImage = 'asset/science.jpg';
  category.categoryName = 'science';

  categories.add(category);

  return categories;
}

class News{
  List<Article> articles = [];

  Future<void> getNews() async {
    String url = 'https://newsapi.org/v2/top-headlines?country=us&apiKey=548b774ea0f548f5a5980717c9f9ed34';

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == 'ok'){
      jsonData['articles'].forEach((element){
        if(element['urlToImage'] != null && element['description'] != null){
          Article article = new Article(
            title: element['title'],
            urlToImage: element['urlToImage'],
            url: element['url'],
            content: element['content'],
            description: element['description'],
          );
          articles.add(article);
        }
      });
    }
  }
}

class CategoryNewsClass{
  List<Article> articles = [];

  Future<void> getCate(String cate) async {
    String url = 'https://newsapi.org/v2/top-headlines?country=us&category=$cate&apiKey=548b774ea0f548f5a5980717c9f9ed34';

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == 'ok'){
      jsonData['articles'].forEach((element){
        if(element['urlToImage'] != null && element['description'] != null){
          Article article = new Article(
            title: element['title'],
            urlToImage: element['urlToImage'],
            url: element['url'],
            content: element['content'],
            description: element['description'],
          );
          articles.add(article);
        }
      });
    }
  }
}