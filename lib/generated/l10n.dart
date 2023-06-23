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
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
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
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Something went wrong`
  String get somethingWentWrong {
    return Intl.message(
      'Something went wrong',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Halls`
  String get halls {
    return Intl.message(
      'Halls',
      name: 'halls',
      desc: '',
      args: [],
    );
  }

  /// `Cars`
  String get cars {
    return Intl.message(
      'Cars',
      name: 'cars',
      desc: '',
      args: [],
    );
  }

  /// `Offers`
  String get offers {
    return Intl.message(
      'Offers',
      name: 'offers',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get more {
    return Intl.message(
      'More',
      name: 'more',
      desc: '',
      args: [],
    );
  }

  /// `Login or Register`
  String get loginOrRegister {
    return Intl.message(
      'Login or Register',
      name: 'loginOrRegister',
      desc: '',
      args: [],
    );
  }

  /// `Event Creator`
  String get eventCreator {
    return Intl.message(
      'Event Creator',
      name: 'eventCreator',
      desc: '',
      args: [],
    );
  }

  /// `Login to your account`
  String get loginToYourAccount {
    return Intl.message(
      'Login to your account',
      name: 'loginToYourAccount',
      desc: '',
      args: [],
    );
  }

  /// `Email address`
  String get emailAddress {
    return Intl.message(
      'Email address',
      name: 'emailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Your're new here?`
  String get youAreNewHere {
    return Intl.message(
      'Your\'re new here?',
      name: 'youAreNewHere',
      desc: '',
      args: [],
    );
  }

  /// `Create an account`
  String get createAccount {
    return Intl.message(
      'Create an account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Create a new account`
  String get createNewAccount {
    return Intl.message(
      'Create a new account',
      name: 'createNewAccount',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email address`
  String get invalidEmailAddress {
    return Intl.message(
      'Invalid email address',
      name: 'invalidEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters`
  String get passwordMustBeAtLeast8Chars {
    return Intl.message(
      'Password must be at least 8 characters',
      name: 'passwordMustBeAtLeast8Chars',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to logout?`
  String get areYouSureYouWantToLogout {
    return Intl.message(
      'Are you sure you want to logout?',
      name: 'areYouSureYouWantToLogout',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection`
  String get noInternetConnection {
    return Intl.message(
      'No internet connection',
      name: 'noInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect password`
  String get incorrectPassword {
    return Intl.message(
      'Incorrect password',
      name: 'incorrectPassword',
      desc: '',
      args: [],
    );
  }

  /// `The email address is already in use by another account`
  String get emailAlreadyInUse {
    return Intl.message(
      'The email address is already in use by another account',
      name: 'emailAlreadyInUse',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPassword {
    return Intl.message(
      'Reset Password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `can't be empty`
  String get canNotBeEmpty {
    return Intl.message(
      'can\'t be empty',
      name: 'canNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Email address can't be empty`
  String get emailCanNotBeEmpty {
    return Intl.message(
      'Email address can\'t be empty',
      name: 'emailCanNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Password can't be empty`
  String get passwordCanNotBeEmpty {
    return Intl.message(
      'Password can\'t be empty',
      name: 'passwordCanNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect email address`
  String get incorrectEmailAddress {
    return Intl.message(
      'Incorrect email address',
      name: 'incorrectEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get phoneNumber {
    return Intl.message(
      'Phone number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Phone number can't be empty`
  String get phoneNumberCanNotBeEmpty {
    return Intl.message(
      'Phone number can\'t be empty',
      name: 'phoneNumberCanNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Invalid phone number`
  String get invalidPhoneNumber {
    return Intl.message(
      'Invalid phone number',
      name: 'invalidPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `You have logged out`
  String get youHaveLoggedOut {
    return Intl.message(
      'You have logged out',
      name: 'youHaveLoggedOut',
      desc: '',
      args: [],
    );
  }

  /// `Capacity`
  String get capacity {
    return Intl.message(
      'Capacity',
      name: 'capacity',
      desc: '',
      args: [],
    );
  }

  /// `peoples`
  String get peoples {
    return Intl.message(
      'peoples',
      name: 'peoples',
      desc: '',
      args: [],
    );
  }

  /// `Model`
  String get model {
    return Intl.message(
      'Model',
      name: 'model',
      desc: '',
      args: [],
    );
  }

  /// `Contact us`
  String get contactUs {
    return Intl.message(
      'Contact us',
      name: 'contactUs',
      desc: '',
      args: [],
    );
  }

  /// `About us`
  String get aboutUs {
    return Intl.message(
      'About us',
      name: 'aboutUs',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Subject`
  String get subject {
    return Intl.message(
      'Subject',
      name: 'subject',
      desc: '',
      args: [],
    );
  }

  /// `Message`
  String get message {
    return Intl.message(
      'Message',
      name: 'message',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Sent`
  String get sent {
    return Intl.message(
      'Sent',
      name: 'sent',
      desc: '',
      args: [],
    );
  }

  /// `Number of Peoples`
  String get numberOfPeoples {
    return Intl.message(
      'Number of Peoples',
      name: 'numberOfPeoples',
      desc: '',
      args: [],
    );
  }

  /// `Min Price`
  String get minPrice {
    return Intl.message(
      'Min Price',
      name: 'minPrice',
      desc: '',
      args: [],
    );
  }

  /// `Max Price`
  String get maxPrice {
    return Intl.message(
      'Max Price',
      name: 'maxPrice',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Hall Details`
  String get hallDetails {
    return Intl.message(
      'Hall Details',
      name: 'hallDetails',
      desc: '',
      args: [],
    );
  }

  /// `Car Details`
  String get carDetails {
    return Intl.message(
      'Car Details',
      name: 'carDetails',
      desc: '',
      args: [],
    );
  }

  /// `Book`
  String get book {
    return Intl.message(
      'Book',
      name: 'book',
      desc: '',
      args: [],
    );
  }

  /// `Rate`
  String get rate {
    return Intl.message(
      'Rate',
      name: 'rate',
      desc: '',
      args: [],
    );
  }

  /// `Rate this hall`
  String get rateThisHall {
    return Intl.message(
      'Rate this hall',
      name: 'rateThisHall',
      desc: '',
      args: [],
    );
  }

  /// `Rate this car`
  String get rateThisCar {
    return Intl.message(
      'Rate this car',
      name: 'rateThisCar',
      desc: '',
      args: [],
    );
  }

  /// `Thank you for your rating`
  String get thankYouForYourRating {
    return Intl.message(
      'Thank you for your rating',
      name: 'thankYouForYourRating',
      desc: '',
      args: [],
    );
  }

  /// `Hall Booking`
  String get hallBooking {
    return Intl.message(
      'Hall Booking',
      name: 'hallBooking',
      desc: '',
      args: [],
    );
  }

  /// `Car Booking`
  String get carBooking {
    return Intl.message(
      'Car Booking',
      name: 'carBooking',
      desc: '',
      args: [],
    );
  }

  /// `from`
  String get from {
    return Intl.message(
      'from',
      name: 'from',
      desc: '',
      args: [],
    );
  }

  /// `Previous`
  String get previous {
    return Intl.message(
      'Previous',
      name: 'previous',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message(
      'Price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `EGP`
  String get egp {
    return Intl.message(
      'EGP',
      name: 'egp',
      desc: '',
      args: [],
    );
  }

  /// `Select`
  String get select {
    return Intl.message(
      'Select',
      name: 'select',
      desc: '',
      args: [],
    );
  }

  /// `Booked Successfully`
  String get bookedSuccessfully {
    return Intl.message(
      'Booked Successfully',
      name: 'bookedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Available Halls`
  String get availableHalls {
    return Intl.message(
      'Available Halls',
      name: 'availableHalls',
      desc: '',
      args: [],
    );
  }

  /// `Available Cars`
  String get availableCars {
    return Intl.message(
      'Available Cars',
      name: 'availableCars',
      desc: '',
      args: [],
    );
  }

  /// `No Available Halls`
  String get noAvailableHalls {
    return Intl.message(
      'No Available Halls',
      name: 'noAvailableHalls',
      desc: '',
      args: [],
    );
  }

  /// `No Available Cars`
  String get noAvailableCars {
    return Intl.message(
      'No Available Cars',
      name: 'noAvailableCars',
      desc: '',
      args: [],
    );
  }

  /// `Pickup Date`
  String get pickupDate {
    return Intl.message(
      'Pickup Date',
      name: 'pickupDate',
      desc: '',
      args: [],
    );
  }

  /// `Return Date`
  String get returnDate {
    return Intl.message(
      'Return Date',
      name: 'returnDate',
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
