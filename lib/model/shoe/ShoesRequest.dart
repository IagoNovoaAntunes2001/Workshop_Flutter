class ShoesRequest {
  String title;
  String slug;
  String description;
  int price;
  String imageUrl;

  ShoesRequest(
      {this.title, this.slug, this.description, this.price, this.imageUrl});

  ShoesRequest.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    price = json['price'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['description'] = this.description;
    data['price'] = this.price;
    data['image_url'] = this.imageUrl;
    return data;
  }
}