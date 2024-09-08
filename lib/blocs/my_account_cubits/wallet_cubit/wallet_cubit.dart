import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hezma/Data/Repo/my_account_screan_repos/wallet_repo/wallet_repo.dart';

part 'wallet_state.dart';

class WalletCubit extends Cubit<WalletState> {
  WalletCubit(this.wallectRepo) : super(WalletInitial());
  
  WallectRepo wallectRepo;


  Future <void> fetchWalletData() async {
    emit(WalletLoading());
    var result = await wallectRepo.fetchWalletData();
    result.fold((failure){
     emit(WalletFailure(failure.errorMSG));
    }, (data){
      emit(WalletSuccess(data));
    }
    );
  }


  Future <void> chargeWalletData({required int amount , required int paymentMethodId}) async {
    emit(WalletLoading());
    var result = await wallectRepo.chargeWalletData(amount: amount, paymentMethodId: paymentMethodId);
    result.fold((failure){
     emit(WalletFailure(failure.errorMSG));
     print('there is an error in charge wallet Cubit function ${WalletFailure(failure.errorMSG)}');
    }, (data){
      emit(WalletSuccess(data));
    }
    );
  }
}
