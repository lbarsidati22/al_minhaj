import 'package:flutter_bloc/flutter_bloc.dart';

part 'ahadith_state.dart';

class AhadithCubit extends Cubit<AhadithState> {
  AhadithCubit() : super(AhadithInitial());
}
