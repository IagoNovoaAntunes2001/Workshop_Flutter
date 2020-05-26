class ShoesResponse {
  String sId;
  String title;
  String slug;
  String description;
  int price;
  String imageUrl;

  ShoesResponse(
      {this.sId,
        this.title,
        this.slug,
        this.description,
        this.price,
        this.imageUrl});

  ShoesResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    price = json['price'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['description'] = this.description;
    data['price'] = this.price;
    data['image_url'] = this.imageUrl;
    return data;
  }
}