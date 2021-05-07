class Language {
  final int id;
  final String flag;
  final String name;
  final String languageCode;

  Language(this.id, this.flag, this.name, this.languageCode);

  static List<Language> languageList() {
    return <Language>[
      Language(1, "🇺🇸", "English", "en"),
      Language(2, "🇮🇳", "ગુજરાતી", "gu"),
      Language(3, "🇮🇳", "ਪੰਜਾਬੀ", "pa"),
      Language(4, "🇮🇳", "हिंदी", "hi"),
      Language(5, "🇮🇳", "मराठी", "mr")
    ];
  }
}
