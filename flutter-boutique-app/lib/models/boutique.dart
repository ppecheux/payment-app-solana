class Boutique {
  final String shortName;
  final String topic;
  final String desc;
  final String photoUrl;
  final List<String> hashtags;
  bool? isSelected;

  Boutique(
    this.shortName,
    this.topic,
    this.desc,
    this.photoUrl,
    this.hashtags,
  );
}
