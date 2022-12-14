import 'dart:async';
import 'package:tvapp/src/movies/models/genre_model.dart';
import 'package:tvapp/src/movies/models/movie_detail_model.dart';
import 'package:tvapp/src/movies/models/popular_movies.dart';
import 'package:tvapp/src/movies/models/tv_seasons.dart';
import 'package:tvapp/src/movies/network/api_provider.dart';

class Repository {
  static String baseUrl = 'https://api.themoviedb.org/3/';
  static String apiKey = '0d313aaab6f55dae42444be479291f4e';
  static String language = 'en-US';
  static String adult = 'false';
  static String mode = 'movie';

  final apiProvider = ApiProvider();

  Future<MoviesModel> fetchPopularMovies(String page, String mode) {
    String url =
        '$baseUrl$mode/popular?api_key=$apiKey&language=$language&page=$page';
    return apiProvider.get(url).then((dynamic res) {
      if (mode == 'movie') {
        return MoviesModel.fromJsonforMovie(res);
      } else {
        return MoviesModel.fromJsonforTV(res);
      }
    });
  }

  Future<MovieDetailModel> fetchMovieDetails(String id, String mode) {
    String url =
        '$baseUrl$mode/$id?api_key=$apiKey&language=$language&append_to_response=videos';
    print(url);
    return apiProvider.get(url).then((dynamic res) {
      return MovieDetailModel.fromJson(res);
    });
  }

  Future<MoviesModel> fetchRecommendations(
      String id, String page, String mode) {
    String url =
        '$baseUrl$mode/$id/recommendations?api_key=$apiKey&language=$language&page=$page';

    return apiProvider.get(url).then((dynamic res) {
      if (mode == 'movie') {
        return MoviesModel.fromJsonforMovie(res);
      } else {
        return MoviesModel.fromJsonforTV(res);
      }
    });
  }

  Future<GenreModel> fetchGenre(String mode) {
    String url =
        '${baseUrl}genre/$mode/list?api_key=$apiKey&language=$language';
    return apiProvider.get(url).then((dynamic res) {
      return GenreModel.fromJson(res);
    });
  }

  Future<String> fetchLiveTVData(String url) {
    return apiProvider.getHtml(url).then((dynamic res) {
      return res.toString();
    });
    // return Future.delayed(
    //     Duration(seconds: 4),
    //     () => data);
  }

  Future<MoviesModel> fetchMovieGenre(String id, String page, String mode) {
    String url =
        '${baseUrl}discover/$mode?api_key=$apiKey&language=$language&sort_by=popularity.desc&include_adult=$adult&include_video=false&page=$page&with_genres=$id';
    return apiProvider.get(url).then((dynamic res) {
      if (mode == 'movie') {
        return MoviesModel.fromJsonforMovie(res);
      } else {
        return MoviesModel.fromJsonforTV(res);
      }
    });
  }

  Future<MoviesModel> searchMovie(String page, String query, String mode) {
    String url =
        '${baseUrl}search/$mode?api_key=$apiKey&language=en-US&query=$query&page=$page&include_adult=$adult';
    print(url);
    return apiProvider.get(url).then((dynamic res) {
      if (mode == 'movie') {
        return MoviesModel.fromJsonforMovie(res);
      } else {
        return MoviesModel.fromJsonforTV(res);
      }
    });
  }

  Future<dynamic> getVideoContent(String url) {
    return apiProvider.getHtml(url).then((dynamic res) {
      return res.toString();
    });
  }

  Future<Seasons> fetchSeasonDetails(int id, int no) {
    String url =
        '${baseUrl}tv/$id/season/$no?api_key=$apiKey&language=$language';

    print(url);
    return apiProvider.get(url).then((dynamic res) {
      print(res);
      return Seasons.fromJson(res);
    });
  }






  String data = """
#EXTM3U#EXTINF:-1 tvg-name="******************** INDIA ***********" tvg-id="" group-title="" tvg-logo="",******************* INDIA ***********
https://dlau142f16b92.cloudfront.net/hls/ch5ctv/master02.m3u8
#EXTINF:-1 tvg-id="" tvg-name="" tvg-logo="https://static.abplive.in/wp-content/themes/abp-hindi/images/logo/hindiLogoD.png" group-title="INDIA",ABP News
https://abp-i.akamaihd.net/hls/live/765529/abphindi/masterhls_1564.m3u8
#EXTINF:-1 tvg-id="" tvg-name="" tvg-logo="http://www.bhaktisagartv.com/images/HD-Logo.png" group-title="INDIA",Bhakti Sagar
http://linear02hun-lh.akamaihd.net/i/bhaktisagar_1@665239/index_2128_av-p.m3u8
#EXTINF:-1 tvg-id="" tvg-name="" tvg-logo="https://iptv.live/images/logo/channel/smalls/4b865f70179ee2a8bebc3260a0315f67.png" group-title="INDIA",Bollywood Classic
http://telekomtv-ro.akamaized.net/shls/LIVE\$BollywoodClassic/6.m3u8/Level(1677721)?start=LIVE&end=END
#EXTINF:-1 tvg-id="" tvg-name="" tvg-logo="http://mhdtvworld.com/wp-content/uploads/2019/02/yuppclassicsmarathi.png" group-title="INDIA",Classics Marathi
https://d1fi19tywmn14b.cloudfront.net/yuppindmov/ngrp:ymarcla.stream_all/playlist.m3u8
#EXTINF:-1 tvg-id="" tvg-name="" tvg-logo="http://mhdtvworld.com/wp-content/uploads/2018/11/Screenshot_2.png" group-title="INDIA",Classics Tamil
https://d1fi19tywmn14b.cloudfront.net/yuppindmov/ngrp:ytamcla.stream_all/playlist.m3u8
#EXTINF:-1 tvg-id="" tvg-name="" tvg-logo="http://mhdtvworld.com/wp-content/uploads/2018/12/yuppclassicstelugu.png" group-title="INDIA",Classics Telugu
https://d1fi19tywmn14b.cloudfront.net/yuppindmov/ngrp:ytelcla.stream_all/playlist.m3u8
#EXTINF:-1 tvg-id="" tvg-name="" tvg-logo="https://upload.wikimedia.org/wikipedia/en/a/a7/CNBC_Awaaz_2010.png" group-title="INDIA",CNBC Awaaz
https://cnbcawaaz-lh.akamaihd.net/i/cnbcawaaz_1@174872/index_5_av-p.m3u8
#EXTINF:-1 tvg-id="" tvg-name="" tvg-logo="http://mhdtvworld.com/wp-content/uploads/2018/12/yuppcomedytelugu.png" group-title="INDIA",Comedy Telugu
https://d1fi19tywmn14b.cloudfront.net/yuppindmov/ngrp:ytelcom.stream_all/playlist.m3u8
#EXTINF:-1 tvg-id="DD News-IN" tvg-name="DD News-IN" tvg-logo="http://smumcdnems05.cdnsrv.jio.com/mumsite.cdnsrv.jio.com/jiotv.catchup.cdn.jio.com/dare_images/images/DD_News.png" group-title="INDIA",DD News
http://nicls1-lh.akamaihd.net/i/ddnews_1@409133/master.m3u8
#EXTINF:-1 tvg-id="" tvg-name="" tvg-logo="http://www.dhamaal.tv/images/logo.png" group-title="INDIA",Dhamaal
http://linear06hun-lh.akamaihd.net/i/dhamaal_1@665243/index_2128_av-p.m3u8
#EXTINF:-1 tvg-id="" tvg-name="" tvg-logo="" group-title="INDIA",Dil Se
http://linear07hun-lh.akamaihd.net/i/dilse_1@673921/master.m3u8
#EXTINF:-1 tvg-id="" tvg-name="" tvg-logo="http://mhdtvworld.com/wp-content/uploads/2018/12/et_now.png" group-title="INDIA",ET Now
http://etnowweblive-lh.akamaihd.net/i/ETN_1@348070/index_576_av-b.m3u8
#EXTINF:-1 tvg-id="India TV-IN" tvg-name="India TV" tvg-logo="http://jadootv.com/wp-content/uploads/2015/05/ai1.png" group-title="INDIA",India TV
http://indiatvnews-lh.akamaihd.net/i/ITV_1@199237//master.m3u8
#EXTINF:-1 tvg-id="" tvg-name="" tvg-logo="https://i.imgur.com/SBUPUNm.png" group-title="INDIA",Kadak Hits
http://linear01hun-lh.akamaihd.net/i/faaduhits_1@660838/master.m3u8
#EXTINF:-1 tvg-id="KTV HD-IN" tvg-name="KTV" tvg-logo="http://www.sunnetwork.in/ChannelLogo/3ktv.jpg" group-title="INDIA",KTV
https://d1fi19tywmn14b.cloudfront.net/yuppindmov/ngrp:ytamcla.stream_all/chunklist_w798628189_b232000.m3u8
#EXTINF:-1 tvg-id="" tvg-name="" tvg-logo="" group-title="INDIA",Lok Sabha TV
https://nicls1-lh.akamaihd.net/i/lst_1@26969/index_1_av-p.m3u8?sd=10&rebase=on
#EXTINF:-1 tvg-id="" tvg-name="" tvg-logo="http://mhdtvworld.com/wp-content/uploads/2018/12/mirror_now_in.png" group-title="INDIA",Mirror Now
http://mbnowweb-lh.akamaihd.net/i/MRN_1@346545/index_576_av-p.m3u8
#EXTINF:-1 tvg-id="" tvg-name="" tvg-language="Hindi" tvg-logo="https://i.imgur.com/SBUPUNm.png" group-title="",Nazrana
http://linear08hun-lh.akamaihd.net/i/nazrana_1@673935/master.m3u8
#EXTINF:-1 tvg-id="NDTV 24x7-IN" tvg-name="NDTV 24x7" tvg-logo="https://upload.wikimedia.org/wikipedia/commons/c/c6/NDTV_247.svg" group-title="INDIA",NDTV 24x7
https://ndtv24x7elemarchana.akamaized.net/hls/live/2003678/ndtv24x7/ndtv24x7master.m3u8
#EXTINF:-1 tvg-id="" tvg-name="" tvg-logo="" group-title="INDIA",News18 Lokmat
https://news18lokmat-lh.akamaihd.net/i/n18lokmat_1@178974/index_5_av-p.m3u8
#EXTINF:-1 tvg-id="" tvg-name="" tvg-logo="https://www.hungama.com/assets/images/logo.png" group-title="INDIA",Pop Pataka
https://linear04hun-lh.akamaihd.net/i/poppataka_1@665241/index_2128_av-p.m3u8
#EXTINF:-1 tvg-id="" tvg-name="" tvg-logo="http://mhdtvworld.com/wp-content/uploads/2018/12/yupppremiummarathi.png" group-title="INDIA",Premium Marathi
https://d1fi19tywmn14b.cloudfront.net/yuppindmov/ngrp:ymarpre.stream_all/playlist.m3u8
#EXTINF:-1 tvg-id="" tvg-name="" tvg-logo="" group-title="INDIA",Punjabi Tadka
http://linear05hun-lh.akamaihd.net/i/punjabitadka_1@665242/master.m3u8
#EXTINF:-1 tvg-id="" tvg-name="" tvg-logo="https://i.imgur.com/9NsI8zT.jpg" group-title="INDIA",RSTV RajyaSabha
http://nicls2-lh.akamaihd.net/i/rstv_1@26970/master.m3u8
#EXTINF:-1 tvg-id="" tvg-name="" tvg-logo="" group-title="INDIA",Sakkat
http://linear03hun-lh.akamaihd.net/i/sakkat_1@665240/master.m3u8
#EXTINF:-1 tvg-logo="https://i.imgur.com/PTdI1KE.png" group-title="INDIA",Suria
https://d11h6a6nhl9kj9.cloudfront.net/hls/suriactv/master02.m3u8
#EXTINF:-1 tvg-id="" tvg-name="" tvg-logo="http://mhdtvworld.com/wp-content/uploads/2018/12/Screenshot_1-8.png" group-title="INDIA",Times Now HD
https://timesnow-lh.akamaihd.net/i/TNHD_1@129288/master.m3u8
#EXTINF:-1 tvg-logo="https://i.imgur.com/xJYoW5I.png" group-title="INDIA",Vasantham
https://d39v9xz8f7n8tk.cloudfront.net/hls/vsnthmctv/master02.m3u8""";


}
