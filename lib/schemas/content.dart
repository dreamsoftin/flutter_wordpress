class Content {
  String raw;
  String rendered;
  bool protected;
  int blockVersion;

  Content({this.rendered});

  Content.fromJson(Map<String, dynamic> json) {
    raw = json['raw'];
    rendered = json['rendered'];
    protected = json['protected'];
    blockVersion = json['block_version'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.raw != null) data['raw'] = this.raw;
    if (this.rendered != null) data['rendered'] = this.rendered;
    if (this.protected != null) data['protected'] = this.protected;
    if (this.blockVersion != null) data['block_version'] = this.blockVersion;
    return data;
  }
}
