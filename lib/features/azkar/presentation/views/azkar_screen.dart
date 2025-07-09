import 'package:al_minhaj/core/widgets/build_app_bar.dart';
import 'package:al_minhaj/features/azkar/data/repos/azkar_repo.dart';
import 'package:al_minhaj/features/azkar/presentation/cubit/azkar_cubit.dart';
import 'package:al_minhaj/features/azkar/presentation/widgets/azkar_page_content.dart';
import 'package:al_minhaj/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/api/azkar_api.dart';

class AzkarScreen extends StatelessWidget {
  const AzkarScreen({super.key});
  static const String routeName = 'AzkarScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: S.of(context).azkar,
        context: context,
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(
          horizontal: 10,
        ),
        child: BlocProvider(
          create: (context) => AzkarCubit(
            azkarRepo: AzkarRepo(azkarApi: AzkarApi()),
          ),
          child: AzkarPageContent(),
        ),
      ),
    );
  }
}
