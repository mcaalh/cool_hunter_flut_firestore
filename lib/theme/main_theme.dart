import 'package:flutter/material.dart';

ThemeData mainTheme() {
  return ThemeData(
    fontFamily: 'BouyguesRead',
    primaryColor: const Color(0xFF25465F),
    accentColor: const Color(0xFF109DB9),
    dividerColor: const Color(0xFFF3F3F3),
    scaffoldBackgroundColor: const Color(0xFFF9F9F9),
    backgroundColor: const Color(0xFFF2F2F2),
  );
}

//Constants
const double kCardHeight = 400;

//Colors
const Color kBackgroundColor = Color(0xFFFFFFFF);
const Color kSidebarBackgroundColor = Color(0xFFF2F2F2);
const Color kTrendBackgroundColor = Color(0xFF56BFD8);
const Color kLanguageBackgroundColor = Color(0xFFF9F9F9);
const Color kPrimaryLabelColor = Color(0xFF25465F);
const Color kSecondaryLabelColor = Color(0xFF109DB9);
const Color kHoverColor = Color(0xFF109DB9);
const Color kTrendLabelColor = Color(0xFFFFFFFF);
const Color kShadowColor = Color(0xFF109DB9);
const Color kStandardButtonColor = Color(0xFFEA5B0F);
const Color kStandardLabelColor = Color(0xFFFFFFFF);

//height of all

const double kRoundedCorner = 32.0;
const double kTrendImage = 180.0;

// Text Styles
const TextStyle kTitleSection = TextStyle(
  fontSize: 28.0,
  fontWeight: FontWeight.w700,
  fontFamily: 'BouyguesRead',
  color: kPrimaryLabelColor,
);

const TextStyle kTitleSectionInfos = TextStyle(
  fontSize: 28.0,
  fontWeight: FontWeight.w700,
  fontFamily: 'BouyguesRead',
  color: kTrendLabelColor,
);

const TextStyle kSubTitleCategory = TextStyle(
  fontSize: 14.0,
  fontWeight: FontWeight.w400,
  fontFamily: 'BouyguesRead',
  color: kPrimaryLabelColor,
);

const TextStyle kTitleHome = TextStyle(
  fontSize: 18.0,
  fontWeight: FontWeight.w500,
  fontFamily: 'BouyguesRead',
  color: kSecondaryLabelColor,
);

const TextStyle kTitleCategory = TextStyle(
  fontSize: 18.0,
  fontWeight: FontWeight.w600,
  fontFamily: 'BouyguesRead',
  color: kPrimaryLabelColor,
);

const TextStyle kLink = TextStyle(
  fontSize: 14.0,
  fontWeight: FontWeight.w500,
  fontFamily: 'BouyguesRead',
  color: kSecondaryLabelColor,
  height: 1.14,
);

const TextStyle kLabelFocus = TextStyle(
  fontSize: 14.0,
  fontWeight: FontWeight.w700,
  fontFamily: 'BouyguesRead',
  color: kSecondaryLabelColor,
);

const TextStyle kLabelTrend = TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.w600,
  fontFamily: 'BouyguesRead',
  color: kTrendLabelColor,
);

const TextStyle kLabelSidebar = TextStyle(
  fontSize: 14.0,
  fontWeight: FontWeight.w400,
  fontFamily: 'BouyguesRead',
  color: kPrimaryLabelColor,
);

const TextStyle kLabelBoldSidebar = TextStyle(
  fontSize: 14.0,
  fontWeight: FontWeight.w700,
  fontFamily: 'BouyguesRead',
  color: kPrimaryLabelColor,
);

const TextStyle kLabelCarouselHome = TextStyle(
  fontSize: 10.0,
  fontWeight: FontWeight.w200,
  fontFamily: 'BouyguesRead',
  color: kPrimaryLabelColor,
);

const TextStyle kLabel404Title = TextStyle(
  fontSize: 28.0,
  fontWeight: FontWeight.w700,
  fontFamily: 'BouyguesRead',
  color: kPrimaryLabelColor,
);

const TextStyle kSecondaryButton = TextStyle(
  fontSize: 14.0,
  fontWeight: FontWeight.w500,
  fontFamily: 'BouyguesRead',
  color: kSecondaryLabelColor,
  height: 1.14,
);
