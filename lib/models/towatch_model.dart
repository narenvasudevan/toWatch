class ToWatch {
  int id;
  String title;
  String director;
  String imgUrl;
  int status;
  ToWatch({this.id, this.title, this.director, this.imgUrl, this.status});
  ToWatch.withId(
      {this.id, this.title, this.director, this.imgUrl, this.status});

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['title'] = title;
    map['director'] = director;
    map['imgUrl'] = imgUrl;
    map['status'] = status;
    return map;
  }

  factory ToWatch.fromMap(Map<String, dynamic> map) {
    return ToWatch.withId(
      id: map['id'],
      title: map['title'],
      director: map['director'],
      imgUrl: map['imgUrl'],
      status: map['status'],
    );
  }
}
