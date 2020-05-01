class Article {
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  Article(
      {this.author, this.title, this.description, this.url, this.urlToImage, this.publishedAt, this.content });

}

class Category{
  String categoryName;
  String categoryImage;
  Category({this.categoryImage,this.categoryName});
}
