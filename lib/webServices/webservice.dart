import 'dart:convert';
import 'package:hacker_news/webServices/url_service.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';





class WebService {

  Future<Response> _getStory(int storyId) {
    return http.get(UrlService.urlForStory(storyId));
  }

  

  Future<List<Response>> getStories(String typeStory) async {
    
    final response = await http.get(typeStory);

    if (response.statusCode == 200) {
      Iterable storyIds = jsonDecode(response.body);
      
     
      return Future.wait(storyIds.take(25).map((storyId) {
        return _getStory(storyId);
      }));
      
      
    } else {
      throw Exception("Cannot Able to Fetch Data");
    }
    

  }




}