class Guid {
  String? rendered;
  String? raw;

  Guid.fromJson(Map<String, dynamic> json) {
    rendered = json['rendered'];
    raw = json['raw'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    
    data['rendered'] = this.rendered;
    data['raw'] = this.raw;
    
    return data;
  }
}
