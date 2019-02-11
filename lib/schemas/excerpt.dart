
class Excerpt {
  String rendered;
  bool protected;

  Excerpt({this.rendered, this.protected});

  Excerpt.fromJson(Map<String, dynamic> json) {
    rendered = json['rendered'];
    protected = json['protected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(this.rendered != null) {
      data['rendered'] = this.rendered;
    }
    if(this.protected != null) {
      data['protected'] = this.protected;
    }
    return data;
  }
}