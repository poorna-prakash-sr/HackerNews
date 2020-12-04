import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:hacker_news/models/story_model.dart';
import 'package:hacker_news/webServices/url_service.dart';
import 'package:hacker_news/webServices/webservice.dart';
import 'package:hacker_news/widgets/loading_widget.dart';

class BestPage extends StatefulWidget {
  @override
  _BestPageState createState() => _BestPageState();
}

class _BestPageState extends State<BestPage> {
  bool completed = false;
  List<Story> _stories = List<Story>();

  @override
  void initState() {
    super.initState();
    _newsSories();
  }

  void _newsSories() async {
    final responses =
        await WebService().getStories(UrlService.urlForBestStories());
    final stories = responses.map((response) {
      final json = jsonDecode(response.body);
      return Story.fromJSON(json);
    }).toList();

    if (mounted)
      setState(() {
        _stories = stories;
        completed = true;
      });
  }

  @override
  Widget build(BuildContext context) {
    if (completed)
      return ListView.builder(
        itemCount: _stories.length,
        itemBuilder: (_, index) {
          return ListTile(
            title: Container(
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(25.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
              ),
              child: 
              
              
              Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      _stories[index].title,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                 
                  
Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "  Score",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
 Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      "Posted By",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                  ),

                  Row(
                    children: <Widget>[
                      
                      Expanded(
                          child: Align(
                        alignment: Alignment.bottomLeft,
                        child: CircularPercentIndicator(
                          radius: 70.0,
                animation: true,
                animationDuration: 1200,
                lineWidth: 4.0,
                percent: 0.8,
                          center: new Text(
                            "${_stories[index].score}",
                            style: TextStyle(fontSize: 18),
                          ),
                          progressColor: Colors.green,
                        ),
                      )),
                      Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          "${_stories[index].by}",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  )
                  
                ],
                
              ),
            ),
          );
        },
      );
    else
      return loading(context);
  }
}
