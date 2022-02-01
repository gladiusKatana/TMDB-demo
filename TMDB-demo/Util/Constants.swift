import Foundation

// Globals

var globalMovieTypeString = "top_rated" // "now_playing"

// Constants

enum Constants {
    static let apiKey = "485fb80eb5476dc84b087c53f0b0e38b"
    static let baseURL = "https://api.themoviedb.org/3/"
    static let imageBaseURL = "https://image.tmdb.org/t/p/original"
}

//https://api.themoviedb.org/3/movie/top_rated?api_key=485fb80eb5476dc84b087c53f0b0e38b
//https://api.themoviedb.org/3/movie/now_playing?api_key=485fb80eb5476dc84b087c53f0b0e38b
