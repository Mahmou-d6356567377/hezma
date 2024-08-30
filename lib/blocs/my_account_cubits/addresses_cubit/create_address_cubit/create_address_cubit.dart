import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'create_address_state.dart';

class CreateAddressCubit extends Cubit<CreateAddressState> {
  CreateAddressCubit() : super(CreateAddressInitial());
}
