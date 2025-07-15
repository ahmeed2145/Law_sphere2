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

  /// `email`
  String get email {
    return Intl.message('email', name: 'email', desc: '', args: []);
  }

  /// `password`
  String get password {
    return Intl.message('password', name: 'password', desc: '', args: []);
  }

  /// `login`
  String get login {
    return Intl.message('login', name: 'login', desc: '', args: []);
  }

  /// `loginLoading`
  String get loginLoading {
    return Intl.message(
      'loginLoading',
      name: 'loginLoading',
      desc: '',
      args: [],
    );
  }

  /// `forgetPasswoerd`
  String get forgetPasswoerd {
    return Intl.message(
      'forgetPasswoerd',
      name: 'forgetPasswoerd',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get createAccount {
    return Intl.message(
      'Create Account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Login successful!`
  String get loginSuccess {
    return Intl.message(
      'Login successful!',
      name: 'loginSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Login failed. Please try again.`
  String get loginFailed {
    return Intl.message(
      'Login failed. Please try again.',
      name: 'loginFailed',
      desc: '',
      args: [],
    );
  }

  /// `Let's Start`
  String get letsStart {
    return Intl.message('Let\'s Start', name: 'letsStart', desc: '', args: []);
  }

  /// `Create an account so you can access your materials.`
  String get onBoardingSlogan {
    return Intl.message(
      'Create an account so you can access your materials.',
      name: 'onBoardingSlogan',
      desc: '',
      args: [],
    );
  }

  /// `Aready has account? `
  String get alradyHasAccount {
    return Intl.message(
      'Aready has account? ',
      name: 'alradyHasAccount',
      desc: '',
      args: [],
    );
  }

  /// `Check your internet and try later`
  String get checkYourInternet {
    return Intl.message(
      'Check your internet and try later',
      name: 'checkYourInternet',
      desc: '',
      args: [],
    );
  }

  /// `An unexpected error occurred`
  String get anUnexpectedErrorOccurred {
    return Intl.message(
      'An unexpected error occurred',
      name: 'anUnexpectedErrorOccurred',
      desc: '',
      args: [],
    );
  }

  /// `This thisField Is Requiered`
  String get thisFieldIsRequiered {
    return Intl.message(
      'This thisField Is Requiered',
      name: 'thisFieldIsRequiered',
      desc: '',
      args: [],
    );
  }

  /// `Yourname`
  String get name {
    return Intl.message('Yourname', name: 'name', desc: '', args: []);
  }

  /// `phoneNumber`
  String get phone {
    return Intl.message('phoneNumber', name: 'phone', desc: '', args: []);
  }

  /// `HomePage`
  String get homePage {
    return Intl.message('HomePage', name: 'homePage', desc: '', args: []);
  }

  /// `Text Explanation`
  String get textExplanation {
    return Intl.message(
      'Text Explanation',
      name: 'textExplanation',
      desc: '',
      args: [],
    );
  }

  /// `Video Explanation`
  String get videoExplanation {
    return Intl.message(
      'Video Explanation',
      name: 'videoExplanation',
      desc: '',
      args: [],
    );
  }

  /// `Lecture Schedule`
  String get lectureSchedule {
    return Intl.message(
      'Lecture Schedule',
      name: 'lectureSchedule',
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
