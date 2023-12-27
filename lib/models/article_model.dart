
class ArticleModel {
  final String? name;
  final String? title;
  final String? author;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? content;
  final String? publishedAt;
  ArticleModel(
      {required this.name,
      required this.title,
      required this.author,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.content,
      required this.publishedAt});
  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
      name: json['source']['name'],
      title: json['title'],
      author: json['author'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      content: json['content'],
      publishedAt: json['publishedAt']);
}
// List<ArticleModel> articles = [
//   ArticleModel(name: "Engadget", title: "Beeper Mini team says a fix is ‘coming soon’ and promises to extend users’ free trials", author: "Cheyenne MacDonald", description: "The Beeper Mini team has apparently been working around the clock to resolve the outage affecting the new “iMessage on Android” app\r\n, and says a fix is “very close.” And once the fix rolls out, users’ seven-day free trials will be reset so they can start ove…", url: "https://www.engadget.com/beeper-mini-team-says-a-fix-is-coming-soon-and-promises-to-extend-users-free-trials-171310651.html", urlToImage: "https://s.yimg.com/ny/api/res/1.2/qPB1PR_4F2sxnCN_UKlS9A--/YXBwaWQ9aGlnaGxhbmRlcjt3PTEyMDA7aD02NzU-/https://s.yimg.com/os/creatr-uploaded-images/2023-12/3caa3a20-96b5-11ee-bfb7-fe583ad9fd08", content: "The Beeper Mini team has apparently been working around the clock to resolve the outage affecting the new iMessage on Android app\r\n, and says a fix is very close. And once the fix rolls out, users se… [+1948 chars]", publishedAt: "2023-12-09T17:13:10Z"),
//   ArticleModel(name: "Engadget", title: "Beeper Mini team says a fix is ‘coming soon’ and promises to extend users’ free trials", author: "Cheyenne MacDonald", description: "The Beeper Mini team has apparently been working around the clock to resolve the outage affecting the new “iMessage on Android” app\r\n, and says a fix is “very close.” And once the fix rolls out, users’ seven-day free trials will be reset so they can start ove…", url: "https://www.engadget.com/beeper-mini-team-says-a-fix-is-coming-soon-and-promises-to-extend-users-free-trials-171310651.html", urlToImage: "https://s.yimg.com/ny/api/res/1.2/qPB1PR_4F2sxnCN_UKlS9A--/YXBwaWQ9aGlnaGxhbmRlcjt3PTEyMDA7aD02NzU-/https://s.yimg.com/os/creatr-uploaded-images/2023-12/3caa3a20-96b5-11ee-bfb7-fe583ad9fd08", content: "The Beeper Mini team has apparently been working around the clock to resolve the outage affecting the new iMessage on Android app\r\n, and says a fix is very close. And once the fix rolls out, users se… [+1948 chars]", publishedAt: "2023-12-09T17:13:10Z"),
//   ArticleModel(name: "Engadget", title: "Beeper Mini team says a fix is ‘coming soon’ and promises to extend users’ free trials", author: "Cheyenne MacDonald", description: "The Beeper Mini team has apparently been working around the clock to resolve the outage affecting the new “iMessage on Android” app\r\n, and says a fix is “very close.” And once the fix rolls out, users’ seven-day free trials will be reset so they can start ove…", url: "https://www.engadget.com/beeper-mini-team-says-a-fix-is-coming-soon-and-promises-to-extend-users-free-trials-171310651.html", urlToImage: "https://s.yimg.com/ny/api/res/1.2/qPB1PR_4F2sxnCN_UKlS9A--/YXBwaWQ9aGlnaGxhbmRlcjt3PTEyMDA7aD02NzU-/https://s.yimg.com/os/creatr-uploaded-images/2023-12/3caa3a20-96b5-11ee-bfb7-fe583ad9fd08", content: "The Beeper Mini team has apparently been working around the clock to resolve the outage affecting the new iMessage on Android app\r\n, and says a fix is very close. And once the fix rolls out, users se… [+1948 chars]", publishedAt: "2023-12-09T17:13:10Z"),
//   ArticleModel(name: "Engadget", title: "Beeper Mini team says a fix is ‘coming soon’ and promises to extend users’ free trials", author: "Cheyenne MacDonald", description: "The Beeper Mini team has apparently been working around the clock to resolve the outage affecting the new “iMessage on Android” app\r\n, and says a fix is “very close.” And once the fix rolls out, users’ seven-day free trials will be reset so they can start ove…", url: "https://www.engadget.com/beeper-mini-team-says-a-fix-is-coming-soon-and-promises-to-extend-users-free-trials-171310651.html", urlToImage: "https://s.yimg.com/ny/api/res/1.2/qPB1PR_4F2sxnCN_UKlS9A--/YXBwaWQ9aGlnaGxhbmRlcjt3PTEyMDA7aD02NzU-/https://s.yimg.com/os/creatr-uploaded-images/2023-12/3caa3a20-96b5-11ee-bfb7-fe583ad9fd08", content: "The Beeper Mini team has apparently been working around the clock to resolve the outage affecting the new iMessage on Android app\r\n, and says a fix is very close. And once the fix rolls out, users se… [+1948 chars]", publishedAt: "2023-12-09T17:13:10Z"),
// ];