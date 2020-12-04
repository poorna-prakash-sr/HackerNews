class Story {
  
  final String title; 
  final String url; 
  String by;
  String type;
 


  Story({this.title,this.url,this.by,this.type});

  factory Story.fromJSON(Map<String,dynamic> json) {
    return Story(
      title: json["title"], 
      url: json["url"], 
      by:json["by"],
      type:json["type"]
      

     
    );
  }
}
