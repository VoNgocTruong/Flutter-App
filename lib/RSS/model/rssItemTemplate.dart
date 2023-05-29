Map<String, String> descriptionMap = {
  "vnexpress_start": "</a></br>",
  "vnexpress_end": "",
  "tuoi_tre_start": "</a>",
  "tuoi_tre_end": "",
};

String startPatternImage = 'img src="';
String endPatternImage = '"';

class RSSItem {
  String rssResourceName;
  String? title;
  String? pubDate;
  String? description;
  String? link;
  String? imageUrl;

  String get startPatternDescription => descriptionMap[rssResourceName + "_start"] as String;
  String get endPatternDescription => descriptionMap[rssResourceName + "_end"] as String;

  RSSItem.resourceNameOnly({
    required this.rssResourceName,
  });



  String _getDescription(String rawDescription) {
    int start = rawDescription.indexOf(startPatternDescription) + startPatternDescription.length;
    if(start > startPatternDescription.length) {
      if(endPatternDescription.length > 0) {
        int end = rawDescription.indexOf(endPatternDescription, start);
        return rawDescription.substring(start, end);
      }
      return rawDescription.substring(start);
    }
    return "";
  }

  String? _getImageUrl(String rawDescription) {
    int start = rawDescription.indexOf(startPatternImage) + startPatternImage.length;
    if(start > startPatternImage.length) {
      if(endPatternImage.length > 0) {
        int end = rawDescription.indexOf(endPatternImage, start);
        return rawDescription.substring(start, end);
      }
      return rawDescription.substring(start);
    }
    return null;
  }

  RSSItem getFromJson(Map<String, dynamic> json) {
      title = json['title'];
      pubDate = json['pubDate'] ;
      description = _getDescription(json['description']) ;
      link = json['link'];
      imageUrl = _getImageUrl(json['description']) ;
    return this;
  }

  Map<String, dynamic> toJson() {
    return {
      'title': this.title,
      'pubDate': this.pubDate,
      'description': this.description,
      'link': this.link,
      'imageUrl': this.imageUrl,
    };
  }
}