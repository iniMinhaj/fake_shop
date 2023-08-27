String truncateText(String text, int maxWords) {
  List<String> words = text.split(' ');
  if (words.length <= maxWords) {
    return text; // If the text has fewer words than the maximum allowed, return the whole text
  }
  return words
      .sublist(0, maxWords)
      .join(' '); // Otherwise, join the first maxWords words and add ellipsis
}
