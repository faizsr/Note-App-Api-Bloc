import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonCubit extends Cubit<bool> {
  ButtonCubit() : super(false);

  void enableBtn() {
    emit(true);
  }

  void resetBtn() {
    emit(false);
  }
}
