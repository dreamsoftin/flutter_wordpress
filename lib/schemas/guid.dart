class Guid {
  String rendered;
  String raw;

  Guid.fromJson(Map<String, dynamic> json) {
    rendered = json['rendered'];
    raw = json['raw'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.rendered != null) data['rendered'] = this.rendered;
    if (this.raw != null) data['raw'] = this.raw;
    return data;
  }
}
