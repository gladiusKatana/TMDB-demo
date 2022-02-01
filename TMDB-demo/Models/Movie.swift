import Foundation

struct Movie: Decodable {               //* detail screen shows: backdrop image, title, rating, release date, overview
    
    let adult: Bool
    let backdropPath: String?
    
    //let genreIds: [Int]
    
    let id: Int
    let originalLanguage: String
    let originalTitle: String
    let overview: String                //*
    let popularity: Double
    let posterPath: String
    let releaseDate: String             //*
    let title: String                   //*
    
    //let video: Bool
    
    let voteAverage: Double             //*
    let voteCount: Int
}

struct Date: Decodable {
    
    let maximum: String
    let minimum: String
}

//struct Movie: Decodable {
//    let posterPath: String
//    let adult: Bool
//    let overview: String
//    let releaseDate: String
//    let id: Int
//    let originalTitle: String
//    let originalLanguage: String
//    let title: String
//    let backdropPath: String
//    let popularity: Double
//    let voteCount: Int
//    let voteAverage: Double
//}
 
