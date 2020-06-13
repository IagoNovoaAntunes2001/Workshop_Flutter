import 'package:palestra_introducao/model/shoe/ShoesResult.dart';

abstract class RegisterShoeRepositoryContract {
  Future<ShoesResult> register(
      String title, String slug, String description, int price, String image);
}
