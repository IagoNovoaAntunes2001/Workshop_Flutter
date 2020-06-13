class ShoesResult {
  bool active;
  String id;
  String title;
  String slug;
  String description;
  int price;
  String imageUrl;

  ShoesResult(
      {this.active,
      this.id,
      this.title,
      this.slug,
      this.description,
      this.price,
      this.imageUrl});

  ShoesResult.fromJson(Map<String, dynamic> json) {
    active = json['active'];
    id = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    price = json['price'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['active'] = this.active;
    data['_id'] = this.id;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['description'] = this.description;
    data['price'] = this.price;
    data['image_url'] = this.imageUrl;
    return data;
  }

  @override
  String toString() {
    return 'ShoesResult{active: $active, sId: $id, title: $title, slug: $slug, description: $description, price: $price, imageUrl: $imageUrl}';
  }
}
