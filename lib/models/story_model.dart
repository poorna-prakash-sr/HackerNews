class Story {
  
  final String title; 
  final String url; 
  String by;
  String type;
  final int score;
 


  Story({this.title,this.url,this.by,this.type,this.score});

  factory Story.fromJSON(Map<String,dynamic> json) {
    return Story(
      title: json["title"], 
      url: json["url"], 
      by:json["by"],
      type:json["type"],
      score: json["score"]
      

     
    );
  }
}
