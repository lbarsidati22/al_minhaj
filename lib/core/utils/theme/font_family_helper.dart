class FontFamilyHelper {
  FontFamilyHelper._();
  static const String cairoArabic = 'Cairo';
  static const String poppinsEnglish = 'Poppins';
  static bool isArabic = false;
  static String getFontFamily(String languageCode) {
    return languageCode == 'ar'
        ? cairoArabic
        : poppinsEnglish;
  }
}
