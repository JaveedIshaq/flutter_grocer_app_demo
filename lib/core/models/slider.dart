class Sliders {
  int id;
  String name;
  String description;
  String imageUrl;
  int weight;
  String landingPage;
  String linkType;
  int linkId;
  int vendorId;
  String createdAt;
  String updatedAt;
  String fullImage;

  Sliders(
      {this.id,
      this.name,
      this.description,
      this.imageUrl,
      this.weight,
      this.landingPage,
      this.linkType,
      this.linkId,
      this.vendorId,
      this.createdAt,
      this.updatedAt,
      this.fullImage});

  Sliders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['image_url'];
    weight = json['weight'];
    landingPage = json['landing_page'];
    linkType = json['link_type'];
    linkId = json['link_id'];
    vendorId = json['vendor_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    fullImage = json['full_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image_url'] = this.imageUrl;
    data['weight'] = this.weight;
    data['landing_page'] = this.landingPage;
    data['link_type'] = this.linkType;
    data['link_id'] = this.linkId;
    data['vendor_id'] = this.vendorId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['full_image'] = this.fullImage;
    return data;
  }
}
