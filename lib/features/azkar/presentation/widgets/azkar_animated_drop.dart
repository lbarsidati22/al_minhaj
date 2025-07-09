import 'package:al_minhaj/core/widgets/pega_container.dart';
import 'package:al_minhaj/core/widgets/pega_text_rich.dart';
import 'package:al_minhaj/features/azkar/presentation/cubit/azkar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AzkarAnimatedDrop extends StatefulWidget {
  final int typeId;
  const AzkarAnimatedDrop({
    super.key,
    required this.typeId,
  });

  @override
  State<AzkarAnimatedDrop> createState() =>
      _AzkarAnimatedDropState();
}

class _AzkarAnimatedDropState
    extends State<AzkarAnimatedDrop> {
  late List<int> repeatCounts;
  @override
  void initState() {
    repeatCounts = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AzkarCubit, AzkarState>(
      builder: (context, state) {
        if (state is AzkarLoading) {
          return Center(
            child:
                const CircularProgressIndicator.adaptive(),
          );
        } else if (state is AzkarError) {
          return Center(child: Text(state.message));
        } else if (state is AzkarLoaded) {
          final azkarList = state.azkarList;
          if (azkarList.isEmpty) {
            return const Center(
              child: Text('No Azkar Found'),
            );
          }
          if (repeatCounts.length != azkarList.length) {
            repeatCounts = List.filled(azkarList.length, 0);
          }
          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: azkarList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (repeatCounts[index] <
                          azkarList[index].repeat) {
                        setState(() {
                          repeatCounts[index]++;
                        });
                      }
                    },

                    child: PajeContainer(
                      azkarModel: azkarList[index],
                    ),
                  ),
                  ReachTextReqaa(
                    repeatCount: repeatCounts[index],
                    azkarModel: azkarList[index],
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) =>
                const SizedBox(height: 20),
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
