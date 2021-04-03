class Content {
  String? raw;
  String? rendered;
  bool? protected;
  int? blockVersion;

  Content({this.rendered});

  Content.fromJson(Map<String, dynamic> json) {
    raw = json['raw'];
    rendered = json['rendered'];
    protected = json['protected'];
    blockVersion = json['block_version'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    
    data['raw'] = this.raw;
    data['rendered'] = this.rendered;
    data['protected'] = this.protected;
    data['block_version'] = this.blockVersion;
    
    return data;
  }
}
