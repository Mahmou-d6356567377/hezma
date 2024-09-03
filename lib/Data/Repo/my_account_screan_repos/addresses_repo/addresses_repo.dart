
import 'package:dartz/dartz.dart';
import 'package:hezma/Data/Errors/failures.dart';
import 'package:hezma/Data/models/my_account_screan_models/addresses/data.dart';

abstract class AddressesRepo {
Future<Either<Failure, List<AddressData>>> getAddresses ();

  Future<Either<Failure, AddressData>> createAddresses({
    required String name ,
    required String address ,
    required String latitude,
    required String longitude,
  });

Future<Either<Failure, AddressData>> editAddresses({
  required String namee,
  required String addresss,
  required String latitudee,
  required String longitudee,
  required String idd,
});

Future<Either<Failure, String>> delAddresses({required int id});
}