import 'package:palestra_introducao/model/shoe/ShoesRequest.dart';
import 'package:palestra_introducao/model/shoe/GenericResult.dart';
import 'package:palestra_introducao/model/shoe/ShoesResult.dart';
import 'package:palestra_introducao/repository/Repository.dart';
import 'package:palestra_introducao/repository/shoe/shoe_repository_contract.dart';

class ShoeRepository extends Repository implements ShoeRepositoryContract {
  @override
  Future<GenericResult> register(title, slug, description, price, image) async {
    var request = ShoesRequest(title: title, slug: slug, description: description, price: price, imageUrl: image);
    var map = await this.post('/products', request.toJson()) as Map<String, dynamic>;
    return GenericResult.fromJson(map);
  }

  @override
  Future<List<ShoesResult>> find() async {
    var request = await this.get('/products') as List<dynamic>;
    return request.map((o) => ShoesResult.fromJson(o)).toList();
  }

  @override
  Future<GenericResult> deleteShoe(String id) async {
    var request = await this.delete('/products', id);
    return GenericResult.fromJson(request);
  }

  @override
  Future<GenericResult> update(String title, String slug, String description, int price, String image, String id) async {
    var request = ShoesRequest(title: title, slug: slug, description: description, price: price, imageUrl: image);
    var map = await this.put('/products', request.toJson(), id);
    return GenericResult.fromJson(map);
  }

}
