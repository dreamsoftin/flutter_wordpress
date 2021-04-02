class Excerpt {
  String? raw;
  String? rendered;
  bool? protected;

  Excerpt({this.rendered});

  Excerpt.fromJson(Map<String, dynamic> json) {
    raw = json['raw'];
    rendered = json['rendered'];
    protected = json['protected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    
    data['raw'] = this.raw;
    data['rendered'] = this.rendered;
    data['protected'] = this.protected;
    
    return data;
  }
}
