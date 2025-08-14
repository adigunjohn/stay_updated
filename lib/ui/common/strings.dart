class AppStrings{
  static const String poppins = 'Poppins';
  static const String randomName = 'Jane Doe';

  ///API strings
  static const String endpoint = 'https://newsapi.org/v2/';
  static const String defaultCountry = 'us';
  //static const String apiKey ='&apikey=f03c7018fae34041a27deb8f8ba5c752';// NewsAPI key1
  static const String apiKey ='&apikey=c9f0486f292446d39ed4c0e47c501cf1';// NewsAPI key2
  static const String topHeadlines = '${endpoint}top-headlines?country=$defaultCountry';

  static const String breakingNewsEndpoint = '$topHeadlines$apiKey';
  static const String recommendationsEndpoint = '${endpoint}everything?domains=techcrunch.com,thenextweb.com,bbc.co.uk,engadget.com$apiKey';
  static String searchEndpoint({required String query,required String filter}) => '${endpoint}everything?q=$query&sortBy=$filter$apiKey';
  static String categoryEndpoint({required String category}) => '$topHeadlines&category=$category$apiKey';

}


//https://newsapi.org/v2/top-headlines?country=us&apiKey=API_KEY   //use category instead of country--business, entertainment, general,health, science, sports, technology
// https://newsapi.org/v2/top-headlines?country=de&category=business&apiKey=f03c7018fae34041a27deb8f8ba5c752

// https://newsapi.org/v2/everything?domains=techcrunch.com,thenextweb.com&apiKey=f03c7018fae34041a27deb8f8ba5c752  //bbc.co.uk, techcrunch.com, engadget.com
//https://newsapi.org/v2/everything?q=keyword&apiKey=f03c7018fae34041a27deb8f8ba5c752
//https://newsapi.org/v2/everything?q=apple&from=2025-08-07&to=2025-08-07&sortBy=popularity&apiKey=f03c7018fae34041a27deb8f8ba5c752    popularity/publishedAt/relevancy