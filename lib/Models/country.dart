class Country {
  String code;
  String language;
  String name;

//  String flag;

  Country({this.code, this.language, this.name});

  static List<Country> getCountries() {
    return <Country>[
      Country(code: "AZ", language: "Azerbaycan", name: "Azerbaijan"),
      Country(code: "CZ", language: "Cestina", name: "Czech Republic"),
      Country(code: "DK", language: "Danish", name: "Denmark"),
      Country(code: "DE", language: "Deutsch", name: "Germany"),
      Country(code: "FR", language: "French", name: "France"),
      Country(code: "MY", language: "Malaysia", name: "Malaysia"),
      Country(code: "MX", language: "Espanol - Mexico", name: "Mexico"),
      Country(code: "MZ", language: "Mozambique", name: "Mozambique"),
      Country(code: "PT", language: "Portugues", name: "Portugal"),
      Country(code: "RO", language: "Romana", name: "Romania"),
      Country(code: "RS", language: "Srpski", name: "Serbia"),
      Country(code: "ES", language: "Espanol - Espana", name: "Spain"),
      Country(code: "TZ", language: "Swahili", name: "Tanzania"),
      Country(code: "US", language: "English - US", name: "United States"),
      Country(code: "GB", language: "English - UK", name: "United Kingdom"),
    ];
  }
}
