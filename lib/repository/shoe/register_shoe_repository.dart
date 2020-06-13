import 'package:palestra_introducao/model/shoe/ShoesRequest.dart';
import 'package:palestra_introducao/model/shoe/ShoesResult.dart';
import 'package:palestra_introducao/repository/Repository.dart';
import 'package:palestra_introducao/repository/shoe/register_shoe_repository_contract.dart';

class RegisterShoeRepository extends Repository implements RegisterShoeRepositoryContract {
  @override
  Future<ShoesResult> register(title, slug, description, price, image) async {
    var request = ShoesRequest(title: title, slug: slug, description: description, price: price, imageUrl: image);
    var map = await this.post('/products', request.toJson()) as Map<String, dynamic>;
    return ShoesResult.fromJson(map);
  }
}
