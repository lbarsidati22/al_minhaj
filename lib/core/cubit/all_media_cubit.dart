import 'package:flutter_bloc/flutter_bloc.dart';

part 'all_media_state.dart';

class AllMediaCubit extends Cubit<AllMediaState> {
  AllMediaCubit() : super(AllMediaInitial());
}
