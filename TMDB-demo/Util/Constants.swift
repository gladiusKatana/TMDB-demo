import Foundation

// Constants

enum Constants {
    
    static let apiKey = "485fb80eb5476dc84b087c53f0b0e38b"
    static let baseURL = "https://api.themoviedb.org/3/"
    static let imageBaseURL = "https://image.tmdb.org/t/p/original"
}


enum MovieMenuType {
    
    case topRated, nowPlaying
    
    var apiString : String {
        switch self {
        case .topRated : return "top_rated"
        case .nowPlaying : return "now_playing"
        }
    }
    
    var uiTitleString : String {
        switch self {
        case .topRated : return "Top Rated Movies"
        case .nowPlaying : return "Now Playing Movies"
        }
    }

}


//https://api.themoviedb.org/3/movie/top_rated?api_key=485fb80eb5476dc84b087c53f0b0e38b
//https://api.themoviedb.org/3/movie/now_playing?api_key=485fb80eb5476dc84b087c53f0b0e38b
