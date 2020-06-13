
import 'package:palestra_introducao/model/ShoesRequest.dart';

abstract class RegisterShoeRepositoryContract {

  Future register(ShoesRequest shoesRequest);

}