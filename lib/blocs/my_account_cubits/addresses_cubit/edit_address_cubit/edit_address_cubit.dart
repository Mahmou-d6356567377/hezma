import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'edit_address_state.dart';

class EditAddressCubit extends Cubit<EditAddressState> {
  EditAddressCubit() : super(EditAddressInitial());
}
