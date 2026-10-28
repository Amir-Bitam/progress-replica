import 'package:flutter/widgets.dart';

const double referenceWidth = 1080;
const double referenceHeight = 2400;

class HitAreas {
  static const home = Rect.fromLTRB(69, 2121, 383, 2308);
  static const cards = Rect.fromLTRB(383, 2121, 697, 2308);
  static const profile = Rect.fromLTRB(697, 2121, 1011, 2308);

  static const banner = Rect.fromLTRB(69, 313, 1011, 601);
  static const themeSun = Rect.fromLTRB(890, 170, 990, 265);

  static const profileEnglish = Rect.fromLTRB(805, 1240, 890, 1320);
  static const profileArabic = Rect.fromLTRB(890, 1240, 990, 1320);
  static const themeLight = Rect.fromLTRB(755, 1368, 830, 1443);
  static const themeDark = Rect.fromLTRB(832, 1368, 905, 1443);
  static const themeAuto = Rect.fromLTRB(908, 1368, 983, 1443);
  static const twoFactor = Rect.fromLTRB(58, 1470, 1022, 1637);
  static const information = Rect.fromLTRB(58, 1640, 1022, 1765);
  static const logout = Rect.fromLTRB(58, 1795, 1022, 1915);

  static const homeButtons = <({String title, Rect rect})>[
    (title: 'Discharge', rect: Rect.fromLTRB(69, 615, 523, 779)),
    (title: 'Timetable', rect: Rect.fromLTRB(557, 615, 1011, 779)),
    (title: 'Group and Section', rect: Rect.fromLTRB(69, 791, 523, 955)),
    (title: 'Exams Schedule', rect: Rect.fromLTRB(557, 791, 1011, 955)),
    (title: 'Exam Grades', rect: Rect.fromLTRB(69, 966, 523, 1130)),
    (title: 'Assessment', rect: Rect.fromLTRB(557, 966, 1011, 1130)),
    (title: 'Percentage (%)', rect: Rect.fromLTRB(69, 1141, 523, 1305)),
    (title: 'Academic transcripts', rect: Rect.fromLTRB(557, 1141, 1011, 1305)),
    (title: 'Debts', rect: Rect.fromLTRB(69, 1317, 523, 1480)),
    (title: 'Academic vacation', rect: Rect.fromLTRB(557, 1317, 1011, 1480)),
    (title: 'Enrollments', rect: Rect.fromLTRB(69, 1492, 523, 1656)),
    (
      title: 'Absences & Exclusions',
      rect: Rect.fromLTRB(557, 1492, 1011, 1656),
    ),
    (title: 'ONOU Services', rect: Rect.fromLTRB(69, 1667, 523, 1831)),
    (title: 'Other services', rect: Rect.fromLTRB(557, 1667, 1011, 1831)),
  ];
}

class PositionedRect extends StatelessWidget {
  const PositionedRect({required this.rect, required this.child, super.key});

  final Rect rect;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;
        final scaledLeft = rect.left * width / referenceWidth;
        final scaledTop = rect.top * height / referenceHeight;
        final scaledWidth = rect.width * width / referenceWidth;
        final scaledHeight = rect.height * height / referenceHeight;
        return Align(
          alignment: Alignment(
            (scaledLeft + scaledWidth / 2) / width * 2 - 1,
            (scaledTop + scaledHeight / 2) / height * 2 - 1,
          ),
          child: SizedBox(
            width: scaledWidth,
            height: scaledHeight,
            child: child,
          ),
        );
      },
    );
  }
}
