class Category {
  int id;
  String name;
  String desc;
  int parentId;
  String image;
  int status;
  List<Subcat> subcat;
  String fullImage;

  Category(
      {this.id,
      this.name,
      this.desc,
      this.parentId,
      this.image,
      this.status,
      this.subcat,
      this.fullImage});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    desc = json['desc'];
    parentId = json['parent_id'];
    image = json['image'];
    status = json['status'];
    if (json['subcat'] != null) {
      subcat = new List<Subcat>();
      json['subcat'].forEach((v) {
        subcat.add(new Subcat.fromJson(v));
      });
    }
    fullImage = json['full_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['desc'] = this.desc;
    data['parent_id'] = this.parentId;
    data['image'] = this.image;
    data['status'] = this.status;
    if (this.subcat != null) {
      data['subcat'] = this.subcat.map((v) => v.toJson()).toList();
    }
    data['full_image'] = this.fullImage;
    return data;
  }
}

class Subcat {
  int id;
  String name;
  String nameUr;
  int status;
  int parentId;
  String image;

  String fullImage;

  Subcat(
      {this.id,
      this.name,
      this.nameUr,
      this.status,
      this.parentId,
      this.image,
      this.fullImage});

  Subcat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameUr = json['name_ur'];
    status = json['status'];
    parentId = json['parent_id'];
    image = json['image'];

    fullImage = json['full_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['name_ur'] = this.nameUr;
    data['status'] = this.status;
    data['parent_id'] = this.parentId;
    data['image'] = this.image;
    data['full_image'] = this.fullImage;
    return data;
  }
}
