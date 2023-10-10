class UnitType {
  UnitType({
      this.createAt, 
      this.createBy, 
      this.updateAt, 
      this.updateBy, 
      this.id, 
      this.name, 
      this.nameKh, 
      this.imageUrl, 
      this.status,});

  UnitType.fromJson(dynamic json) {
    createAt = json['createAt'];
    createBy = json['createBy'];
    updateAt = json['updateAt'];
    updateBy = json['updateBy'];
    id = json['id'];
    name = json['name'];
    nameKh = json['nameKh'];
    imageUrl = json['imageUrl'];
    status = json['status'];
  }
  dynamic createAt;
  dynamic createBy;
  dynamic updateAt;
  dynamic updateBy;
  int? id;
  String? name;
  String? nameKh;
  dynamic imageUrl;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['createAt'] = createAt;
    map['createBy'] = createBy;
    map['updateAt'] = updateAt;
    map['updateBy'] = updateBy;
    map['id'] = id;
    map['name'] = name;
    map['nameKh'] = nameKh;
    map['imageUrl'] = imageUrl;
    map['status'] = status;
    return map;
  }

}