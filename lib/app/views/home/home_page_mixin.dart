class HomePageMixin {
  formatterMovieTitle(String title) {
    if (title.length > 16) {
      return title.substring(0, 17) + '...';
    }
    return title;
  }
}
