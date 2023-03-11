import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zomato_ui/baseWidgets/common_bloc/common_repo.dart';

part 'common_state.dart';

class CommonCubit extends Cubit<CommonState> {
  CommonCubit({required this.commonRepo}) : super(CommonInitial());

  final CommonRepo commonRepo;

  fetchData({data}) async{
          emit(CommonStateLoading());
          try {
            var response = await commonRepo.fetchData(data: data);

            emit(CommonStateSuccess(response));

          }catch (e){
            emit(CommonStateError(e.toString()));
          }
  }

}
