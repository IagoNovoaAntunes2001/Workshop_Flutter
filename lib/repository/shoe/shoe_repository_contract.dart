import 'package:palestra_introducao/model/shoe/GenericResult.dart';
import 'package:palestra_introducao/model/shoe/ShoesResult.dart';

abstract class ShoeRepositoryContract {
  Future<GenericResult> register(
      String title, String slug, String description, int price, String image);

  Future<List<ShoesResult>> find();

  Future<GenericResult> deleteShoe(String id);

}
