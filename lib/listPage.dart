import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:towatch/towatch_notifier.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    final toWatchNotifier = Provider.of<ToWatchNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello ,xyz'),
        backgroundColor: Theme.of(context).primaryColorDark,
        centerTitle: true,
      ),
      body: Column(
        children: [
          for (var toWatch in toWatchNotifier.currentToWatch)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                height: 100.0,
                width: double.infinity,
                child: CheckboxListTile(
                  value: toWatch.isDone,
                  onChanged: (value) {
                    toWatchNotifier.updateToWatch(toWatch);
                  },
                  title: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image(
                        image: NetworkImage(toWatch.imgUrl),
                        height: 100.0,
                        width: 70.0,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 12.0),
                              child: Text(
                                toWatch.title,
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                    decoration: toWatch.isDone
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  toWatch.director,
                                  style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      decoration: toWatch.isDone
                                          ? TextDecoration.lineThrough
                                          : TextDecoration.none),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.edit),
                                      onPressed: () {
                                        final imgUrlController =
                                            TextEditingController(
                                                text: toWatch.imgUrl);
                                        final titleController =
                                            TextEditingController(
                                                text: toWatch.title);
                                        final directorController =
                                            TextEditingController(
                                                text: toWatch.director);

                                        showDialog(
                                          context: context,
                                          builder: (context) => SimpleDialog(
                                            contentPadding:
                                                EdgeInsets.all(15.0),
                                            title: Text('Edit'),
                                            children: [
                                              TextField(
                                                controller: titleController,
                                                decoration: InputDecoration(
                                                  hintText: 'Movie Name',
                                                ),
                                              ),
                                              SizedBox(
                                                height: 15.0,
                                              ),
                                              TextField(
                                                controller: directorController,
                                                decoration: InputDecoration(
                                                  hintText: 'Director Name',
                                                ),
                                              ),
                                              SizedBox(
                                                height: 15.0,
                                              ),
                                              TextField(
                                                controller: imgUrlController,
                                                decoration: InputDecoration(
                                                  hintText: 'Image Url',
                                                ),
                                              ),
                                              // ignore: deprecated_member_use
                                              OutlineButton(
                                                onPressed: () {
                                                  toWatchNotifier.editToWatch(
                                                      titleController.text,
                                                      directorController.text,
                                                      imgUrlController.text,
                                                      toWatch: toWatch);
                                                  Navigator.pop(context);
                                                },
                                                child: Text('Add to main menu'),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                      splashRadius: 20.0,
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.delete),
                                      onPressed: () {
                                        toWatchNotifier.deleteToWatch(toWatch);
                                      },
                                      splashRadius: 20.0,
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
        onPressed: () {
          final titleController = TextEditingController();
          final directorController = TextEditingController();
          final imgUrlController = TextEditingController();
          showDialog(
            context: context,
            builder: (context) => SimpleDialog(
              contentPadding: EdgeInsets.all(15.0),
              title: Text('Add movies here'),
              children: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    hintText: 'Movie Name',
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextField(
                  controller: directorController,
                  decoration: InputDecoration(
                    hintText: 'Director Name',
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextField(
                  controller: imgUrlController,
                  decoration: InputDecoration(
                    hintText: 'Image Url',
                  ),
                ),

                // ignore: deprecated_member_use
                OutlineButton(
                  onPressed: () {
                    toWatchNotifier.addToWatch(
                      ToWatch(
                          title: titleController.text,
                          director: directorController.text,
                          imgUrl: imgUrlController.text),
                    );
                    Navigator.pop(context);
                  },
                  child: Text('Add to main menu'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

//   void takePhoto(ImageSource source) async {
//     final pickedFile = await _picker.getImage(
//       source: source,
//     );
//     setState(() {
//       _imageFile = pickedFile;
//     });
//   }
//
//   Widget bottomSheet() {
//     return Container(
//       height: 100.0,
//       width: MediaQuery.of(context).size.width,
//       margin: EdgeInsets.symmetric(
//         horizontal: 20,
//         vertical: 20,
//       ),
//       child: Column(
//         children: <Widget>[
//           Text(
//             "Choose photo",
//             style: TextStyle(
//               fontSize: 20.0,
//             ),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
//             IconButton(
//               icon: Icon(Icons.camera),
//               onPressed: () {
//                 takePhoto(ImageSource.camera);
//               },
//               // label: Text("Camera"),
//             ),
//             IconButton(
//               icon: Icon(Icons.image),
//               onPressed: () {
//                 takePhoto(ImageSource.gallery);
//               },
//               // label: Text("Gallery"),
//             ),
//           ])
//         ],
//       ),
//     );
//   }
// }
