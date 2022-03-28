class stories {
  String? sId;
  String? story;
  String? author;
  String? updatedAt;
  int? iV;

  stories({this.sId, this.story, this.author, this.updatedAt, this.iV});

  stories.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    story = json['story'];
    author = json['author'];
    updatedAt = json['UpdatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['story'] = this.story;
    data['author'] = this.author;
    data['UpdatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
