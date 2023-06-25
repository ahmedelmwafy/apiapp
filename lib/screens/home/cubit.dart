import 'package:apiapp/helpers/dio.dart';
import 'package:apiapp/screens/home/model.dart';
import 'package:apiapp/screens/home/state.dart';
import 'package:apiapp/widgets/toast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  bool isHomeLoading = false;
  EventsModel? eventsModel;
  Future<void> getHomedata() async {
    isHomeLoading = true;
    emit(HomeLoading());
    await DioHelper.getData(path: 'events').then((value) {
      eventsModel = EventsModel.fromJson(value!.data);
      isHomeLoading = false;
      emit(HomeLoaded());
    }).catchError((e) {
      isHomeLoading = false;
      emit(HomeError());
    });
  }

  String? qrCode;

  Future<void> postScan() async {
    await DioHelper.postData(path: 'account/scan/qr', data: {'qr': qrCode})
        .then((value) {
      customToast(value!.data!['message']);
      isHomeLoading = false;
      emit(HomeLoaded());
    }).catchError((onError) {
      isHomeLoading = false;
      emit(HomeError());
    });
  }
  //account/scan/qr
}
