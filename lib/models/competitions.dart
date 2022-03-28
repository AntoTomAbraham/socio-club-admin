class competitions {
  String? sId;
  String? author;
  String? startDate;
  String? endDate;
  String? description;
  String? topic;
  String? status;
  String? image;
  int? limit;
  List<Null>? entries;
  int? iV;

  competitions(
      {this.sId,
      this.author,
      this.startDate,
      this.endDate,
      this.description,
      this.topic,
      this.status,
      this.image,
      this.limit,
      this.entries,
      this.iV});

  competitions.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    author = json['author'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    description = json['description'];
    topic = json['topic'];
    status = json['Status'];
    image = json['image'];
    limit = json['limit'];
    // if (json['entries'] != null) {
    //   entries = <Null>[];
    //   json['entries'].forEach((v) {
    //     entries!.add(new Null.fromJson(v));
    //   });
    // }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['author'] = this.author;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['description'] = this.description;
    data['topic'] = this.topic;
    data['Status'] = this.status;
    data['image'] = this.image;
    data['limit'] = this.limit;
    // if (this.entries != null) {
    //   data['entries'] = this.entries!.map((v) => v.toJson()).toList();
    // }
    data['__v'] = this.iV;
    return data;
  }
}
