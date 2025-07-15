import 'package:al_minhaj/core/widgets/build_app_bar.dart';
import 'package:al_minhaj/core/widgets/sized_box.dart';
import 'package:al_minhaj/features/ahadith/data/ahadith_model.dart';
import 'package:al_minhaj/features/ahadith/presentation/widgets/ahadith_details.dart';
import 'package:al_minhaj/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class AhadithScreen extends StatefulWidget {
  const AhadithScreen({super.key});
  static const String routeName = 'AhadithScreen';

  @override
  State<AhadithScreen> createState() =>
      _AhadithScreenState();
}

class _AhadithScreenState
    extends State<AhadithScreen> {
  List<HadithModel> allAhadith = [];
  @override
  void initState() {
    super.initState();
    LoadHadithFile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: S.of(context).hadethname,
        context: context,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 2.heightPercent(context),
                  );
                },
                itemCount: allAhadith.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Theme.of(
                      context,
                    ).colorScheme.primaryContainer,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Color(0xff785546),
                            borderRadius:
                                BorderRadiusDirectional.only(
                                  bottomStart:
                                      Radius.circular(
                                        15,
                                      ),
                                  topEnd:
                                      Radius.circular(
                                        15,
                                      ),
                                ),
                          ),
                          child: Text(
                            allAhadith[index].title,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontWeight:
                                      FontWeight.w700,
                                  color: Colors.white,
                                ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.all(
                                8.0,
                              ),
                          child: Column(
                            children: [
                              Text(
                                overflow: TextOverflow
                                    .ellipsis,
                                maxLines: 3,
                                allAhadith[index]
                                    .Content
                                    .join(" "),
                                style:
                                    Theme.of(context)
                                        .textTheme
                                        .displayMedium,
                              ),

                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    AhadithDetails
                                        .routeName,
                                    arguments:
                                        allAhadith[index],
                                  );
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment
                                          .center,
                                  children: [
                                    Text(
                                      'عرض المزيد',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                            fontWeight:
                                                FontWeight
                                                    .w700,
                                          ),
                                    ),
                                    Icon(
                                      IconsaxPlusLinear
                                          .arrow_down,
                                      size: 40,
                                      weight: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  LoadHadithFile() {
    rootBundle
        .loadString("assets/files/ahadeth.txt")
        .then((Value) {
          List<String> ahadeth = Value.split("#");
          for (int i = 0; i < ahadeth.length; i++) {
            String HdethOne = ahadeth[i];
            List<String> HadethLine = HdethOne.trim()
                .split("\n");
            String title = HadethLine[0];
            HadethLine.removeAt(0);
            List<String> Content = HadethLine;
            HadithModel hadithModel = HadithModel(
              title,
              Content,
            );
            allAhadith.add(hadithModel);
            setState(() {});
          }
        });
  }
}
