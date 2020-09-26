class Product {
  int id;
  int categoryId;
  int weight;
  int vendorProductId;
  int price;
  String name;
  String nameUr;
  String unit;
  String desc;
  String barcode;
  String image;
  int vendorId;
  int isFeatured;
  int isDeal;
  String dealTitle;
  int dealPercentage;
  String dealExpiry;
  int maxPurchaseLimit;
  String fullImage;

  Product(
      {this.id,
      this.categoryId,
      this.weight,
      this.vendorProductId,
      this.price,
      this.name,
      this.nameUr,
      this.unit,
      this.desc,
      this.barcode,
      this.image,
      this.vendorId,
      this.isFeatured,
      this.isDeal,
      this.dealTitle,
      this.dealPercentage,
      this.dealExpiry,
      this.maxPurchaseLimit,
      this.fullImage});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    weight = json['weight'];
    vendorProductId = json['vendor_product_id'];
    price = json['price'];
    name = json['name'];
    nameUr = json['name_ur'];
    unit = json['unit'];
    desc = json['desc'];
    barcode = json['barcode'];
    image = json['image'];
    vendorId = json['vendor_id'];
    isFeatured = json['is_featured'];
    isDeal = json['is_deal'];
    dealTitle = json['deal_title'];
    dealPercentage = json['deal_percentage'];
    dealExpiry = json['deal_expiry'];
    maxPurchaseLimit = json['max_purchase_limit'];
    fullImage = json['full_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['weight'] = this.weight;
    data['vendor_product_id'] = this.vendorProductId;
    data['price'] = this.price;
    data['name'] = this.name;
    data['name_ur'] = this.nameUr;
    data['unit'] = this.unit;
    data['desc'] = this.desc;
    data['barcode'] = this.barcode;
    data['image'] = this.image;
    data['vendor_id'] = this.vendorId;
    data['is_featured'] = this.isFeatured;
    data['is_deal'] = this.isDeal;
    data['deal_title'] = this.dealTitle;
    data['deal_percentage'] = this.dealPercentage;
    data['deal_expiry'] = this.dealExpiry;
    data['max_purchase_limit'] = this.maxPurchaseLimit;
    data['full_image'] = this.fullImage;
    return data;
  }
}
