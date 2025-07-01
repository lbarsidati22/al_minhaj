class Language {
  final String code;
  final String name;
  final String flagAsset;

  Language({
    required this.code,
    required this.name,
    required this.flagAsset,
  });

  static List<Language> languageList() {
    return <Language>[
      Language(
        code: "en",
        name: "English",
        flagAsset: "assets/images/en.png",
      ),
      Language(
        code: "ar",
        name: "العربية",
        flagAsset: "assets/images/ar_t.png",
      ),
    ];
  }
}
