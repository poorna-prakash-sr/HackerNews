

class UrlService {

  static String urlForStory(int storyId) {
    return "https://hacker-news.firebaseio.com/v0/item/$storyId.json?print=pretty";
  }

  static String urlForBestStories() {
    return "https://hacker-news.firebaseio.com/v0/beststories.json";
  }




}