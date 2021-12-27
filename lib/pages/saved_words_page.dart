import 'package:flutter/material.dart';
import 'package:kpi_lab/models/saved_words.dart';
import 'package:provider/provider.dart';

class SavedWordsPage extends StatefulWidget
{
  SavedWordsPage({Key? key, required this.title}): super(key:key);

  final String title;

  @override
  _SavedWordsPageState createState() => _SavedWordsPageState();
}

class _SavedWordsPageState extends State<SavedWordsPage>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 0.0,
      ),
      body: Consumer<SavedWords>(
        builder: (context, saved, child) {
          return Column(
            children: saved.favorites.map((item){
              return Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(0.0)),
                ),
                margin: const EdgeInsets.only(left: 8.0, right: 8.0, top: 0.5),
                child: Container(
                  height: 60.0,
                  padding: const EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              item.text,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              item.translatedText,
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {saved.remove(item);},
                        icon: Icon(
                          item.isFavourite ? Icons.star : Icons.star_border,
                          size: 23.0,
                          color: item.isFavourite ? Colors.yellowAccent[700] : Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList()
          );
          return Column();
        }
      )
    );
  }

}