import 'package:flutter_bloc/flutter_bloc.dart';
part 'almohadra_state.dart';

class AlmohadraCubit extends Cubit<AlmohadraState> {
  AlmohadraCubit() : super(AlmohadraInitial());
}
