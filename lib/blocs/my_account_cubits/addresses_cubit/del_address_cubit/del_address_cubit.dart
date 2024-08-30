import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'del_address_state.dart';

class DelAddressCubit extends Cubit<DelAddressState> {
  DelAddressCubit() : super(DelAddressInitial());
}
