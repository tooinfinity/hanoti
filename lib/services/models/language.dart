// class Language {
//   final String name;
//   final String languageCode;

//   Language(this.name, this.languageCode);

//   static List<Language> languageList() {
//     return <Language>[
//       Language("English", "en"),
//       Language("Francais", "fr"),
//       Language("اَلْعَرَبِيَّةُ‎", "ar"),
//     ];
//   }
// }

class Language {
  List<String> _languagesListDefault = [
    'English',
    'Français',
    'العربية',
  ];

  get languagesListDefault => _languagesListDefault;
}
