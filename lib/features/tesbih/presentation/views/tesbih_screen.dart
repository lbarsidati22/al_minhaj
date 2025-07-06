import 'package:al_minhaj/core/utils/theme/app_font_styles.dart';
import 'package:al_minhaj/core/utils/theme/app_theme.dart';
import 'package:al_minhaj/core/widgets/build_app_bar.dart';
import 'package:al_minhaj/core/widgets/sized_box.dart';
import 'package:al_minhaj/features/tesbih/cubit/tesbih_cubit.dart';
import 'package:al_minhaj/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TesbihScreen extends StatelessWidget {
  const TesbihScreen({super.key});
  static const String routeName = 'TesbihScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: S.of(context).electronicRosary,
        context: context,
      ),
      body: BlocProvider(
        create: (context) => TesbihCubit(),
        child: Builder(
          builder: (context) {
            return BlocBuilder<TesbihCubit, TesbihState>(
              builder: (context, state) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemCount: state.items.length,

                          itemBuilder: (context, index) {
                            final item = state.items[index];
                            final isSelected =
                                state.selectedIndex ==
                                index;

                            return Card(
                              shadowColor:
                                  AppTheme.isDark(context)
                                  ? null
                                  : Colors.black,
                              elevation:
                                  AppTheme.isDark(context)
                                  ? 0
                                  : 5,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(
                                        12,
                                      ),
                                  color: isSelected
                                      ? Color(0xff785548)
                                      : Theme.of(context)
                                            .colorScheme
                                            .primaryContainer,
                                ),
                                child: ListTile(
                                  leading: Icon(
                                    item.count == item.limit
                                        ? Icons.check
                                        : Icons.close,
                                    color:
                                        item.count ==
                                            item.limit
                                        ? Colors.green
                                        : Colors.red,
                                    size: 32,
                                  ),
                                  title: Text(
                                    item.text,
                                    textAlign:
                                        TextAlign.right,
                                    style:
                                        AppFontStyles.styleBold20(
                                          context,
                                        ).copyWith(
                                          color: isSelected
                                              ? Colors.white
                                              : Colors
                                                    .black,
                                        ),
                                  ),
                                  trailing: Text(
                                    '${item.count}/${item.limit}',
                                    style:
                                        AppFontStyles.styleBold16(
                                          context,
                                        ).copyWith(
                                          color: isSelected
                                              ? Colors.white
                                              : Colors
                                                    .black,
                                        ),
                                  ),
                                  onTap: () {
                                    context
                                        .read<TesbihCubit>()
                                        .selecItem(index);
                                  },
                                ),
                              ),
                            );
                          },
                          separatorBuilder:
                              (context, index) {
                                return SizedBox(
                                  height: 1.heightPercent(
                                    context,
                                  ),
                                );
                              },
                        ),
                      ),
                      SizedBox(
                        height: 1.heightPercent(context),
                      ),

                      Text(
                        state
                            .items[state.selectedIndex]
                            .text,
                        style: AppFontStyles.styleBold20(
                          context,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 4.heightPercent(context),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          right: 88,
                          left: 88,
                          bottom: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(
                            context,
                          ).colorScheme.primaryContainer,
                          borderRadius:
                              BorderRadius.circular(16),
                        ),
                        child: Text(
                          state
                              .items[state.selectedIndex]
                              .count
                              .toString()
                              .padLeft(2, '0'),
                          style: TextStyle(
                            fontFamily: 'Digital',
                            fontSize: 50,
                            color: Theme.of(
                              context,
                            ).colorScheme.primary,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.heightPercent(context),
                      ),
                      Column(
                        mainAxisAlignment:
                            MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              context
                                  .read<TesbihCubit>()
                                  .resetSelectedCount();
                            },
                            icon: Icon(
                              Icons.refresh,
                              size: 44,
                              color: Theme.of(
                                context,
                              ).colorScheme.primary,
                            ),
                          ),

                          GestureDetector(
                            onTap: () {
                              context
                                  .read<TesbihCubit>()
                                  .incrementCount();
                            },
                            child: Container(
                              width: 20.heightPercent(
                                context,
                              ),
                              height: 30.widthPercent(
                                context,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.brown,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.heightPercent(
                              context,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
