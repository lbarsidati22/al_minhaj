// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `العربيه`
  String get lang {
    return Intl.message('العربيه', name: 'lang', desc: '', args: []);
  }

  /// `Activate night mode`
  String get darkNight {
    return Intl.message(
      'Activate night mode',
      name: 'darkNight',
      desc: '',
      args: [],
    );
  }

  /// `Ahzab`
  String get ahzab {
    return Intl.message('Ahzab', name: 'ahzab', desc: '', args: []);
  }

  /// `Application Of Worship`
  String get applicationOfWorship {
    return Intl.message(
      'Application Of Worship',
      name: 'applicationOfWorship',
      desc: '',
      args: [],
    );
  }

  /// `Learn the Islamic religion through classifications, files, explanations, lectures, etc. It provides prayer times, sermons, and the entire Holy Quran, with interpretation and audio reading. Discover more for yourself.`
  String get welcomeMessage {
    return Intl.message(
      'Learn the Islamic religion through classifications, files, explanations, lectures, etc. It provides prayer times, sermons, and the entire Holy Quran, with interpretation and audio reading. Discover more for yourself.',
      name: 'welcomeMessage',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get startNow {
    return Intl.message('Get Started', name: 'startNow', desc: '', args: []);
  }

  /// `Tafsir`
  String get tafsir {
    return Intl.message('Tafsir', name: 'tafsir', desc: '', args: []);
  }

  /// `Kneeling`
  String get kneeling {
    return Intl.message('Kneeling', name: 'kneeling', desc: '', args: []);
  }

  /// `ayat Today`
  String get ayatToday {
    return Intl.message('ayat Today', name: 'ayatToday', desc: '', args: []);
  }

  /// `Surah Al-Fateha`
  String get soraAlfateha {
    return Intl.message(
      'Surah Al-Fateha',
      name: 'soraAlfateha',
      desc: '',
      args: [],
    );
  }

  /// `Prostrations`
  String get prostrations {
    return Intl.message(
      'Prostrations',
      name: 'prostrations',
      desc: '',
      args: [],
    );
  }

  /// `More Apps`
  String get moreapps {
    return Intl.message('More Apps', name: 'moreapps', desc: '', args: []);
  }

  /// `Share the app`
  String get sharetheapp {
    return Intl.message(
      'Share the app',
      name: 'sharetheapp',
      desc: '',
      args: [],
    );
  }

  /// `Parts`
  String get parts {
    return Intl.message('Parts', name: 'parts', desc: '', args: []);
  }

  /// `Quran Kareem`
  String get quran {
    return Intl.message('Quran Kareem', name: 'quran', desc: '', args: []);
  }

  /// `Favorite`
  String get favorite {
    return Intl.message('Favorite', name: 'favorite', desc: '', args: []);
  }

  /// `Sura Name`
  String get sura_name {
    return Intl.message('Sura Name', name: 'sura_name', desc: '', args: []);
  }

  /// `Ahadeth`
  String get ahadeth {
    return Intl.message('Ahadeth', name: 'ahadeth', desc: '', args: []);
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Radio`
  String get radio {
    return Intl.message('Radio', name: 'radio', desc: '', args: []);
  }

  /// `Theme`
  String get theme {
    return Intl.message('Theme', name: 'theme', desc: '', args: []);
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Dark`
  String get dark {
    return Intl.message('Dark', name: 'dark', desc: '', args: []);
  }

  /// `Light`
  String get light {
    return Intl.message('Light', name: 'light', desc: '', args: []);
  }

  /// `Arabic`
  String get arabic {
    return Intl.message('Arabic', name: 'arabic', desc: '', args: []);
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Tap Here`
  String get press {
    return Intl.message('Tap Here', name: 'press', desc: '', args: []);
  }

  /// `About App`
  String get about {
    return Intl.message('About App', name: 'about', desc: '', args: []);
  }

  /// `Contact`
  String get contact {
    return Intl.message('Contact', name: 'contact', desc: '', args: []);
  }

  /// `Share App`
  String get share {
    return Intl.message('Share App', name: 'share', desc: '', args: []);
  }

  /// `Rate App`
  String get rate {
    return Intl.message('Rate App', name: 'rate', desc: '', args: []);
  }

  /// `Privacy Policy`
  String get privacy {
    return Intl.message('Privacy Policy', name: 'privacy', desc: '', args: []);
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `Surah Name`
  String get chaptername {
    return Intl.message('Surah Name', name: 'chaptername', desc: '', args: []);
  }

  /// `Verses Number`
  String get chapternumber {
    return Intl.message(
      'Verses Number',
      name: 'chapternumber',
      desc: '',
      args: [],
    );
  }

  /// `Ahadeth`
  String get hadethname {
    return Intl.message('Ahadeth', name: 'hadethname', desc: '', args: []);
  }

  /// `Tasbeh Number`
  String get tasbehnumber {
    return Intl.message(
      'Tasbeh Number',
      name: 'tasbehnumber',
      desc: '',
      args: [],
    );
  }

  /// `Quran Broadcast`
  String get quranradio {
    return Intl.message(
      'Quran Broadcast',
      name: 'quranradio',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
