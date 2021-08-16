import 'package:flutter/cupertino.dart';

class ToWatchNotifier extends ChangeNotifier {
  List<ToWatch> currentToWatch = toWatchList;

  void addToWatch(ToWatch toWatch) {
    currentToWatch.add(toWatch);
    notifyListeners();
  }

  void updateToWatch(ToWatch toWatch) {
    final index = currentToWatch.indexOf(toWatch);
    final isDone = currentToWatch.elementAt(index).isDone;
    currentToWatch.elementAt(index).isDone = !isDone;
    notifyListeners();
  }

  void deleteToWatch(ToWatch toWatch) {
    final index = currentToWatch.indexOf(toWatch);
    currentToWatch.removeAt(index);
    notifyListeners();
  }

  void editToWatch(
      String updatedTitle, String updatedDirector, String updatedImgUrl,
      {ToWatch toWatch}) {
    final index = currentToWatch.indexOf(toWatch);
    currentToWatch.elementAt(index).title = updatedTitle;
    currentToWatch.elementAt(index).director = updatedDirector;
    currentToWatch.elementAt(index).imgUrl = updatedImgUrl;

    notifyListeners();
  }
}

class ToWatch {
  String title;
  String director;
  String imgUrl;
  bool isDone;

  ToWatch({this.title, this.director, this.imgUrl, this.isDone = false});
}

final toWatchList = [
  ToWatch(
      title: 'ShawShank Redemption',
      director: 'Zuckerberg',
      imgUrl: 'https://m.media-amazon.com/images/I/51NiGlapXlL._AC_.jpg'),
  ToWatch(
      title: 'The return of jedi',
      director: 'Hamilton',
      imgUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5OFYYm4YnkLnCOwR213Pui4ftaaO_R8NGRDcvIGYjT7o0noquHqutVqRGIGVxppSvNKE&usqp=CAU'),
];
