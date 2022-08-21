enum CharactersGender {
  female('Female'),
  male('Male'),
  genderless('Genderless'),
  unknown('Unknown');

  const CharactersGender(this.value);
  final String value;
}
