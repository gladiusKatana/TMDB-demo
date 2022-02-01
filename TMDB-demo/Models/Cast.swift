import Foundation

struct Cast: Decodable {
    
    //let adult: Bool
    
    let gender: Int
    let id: Int
    
    //let knownForDepartment: String
    
    let name: String
    
    //let originalName: String
    //let popularity: Double
    
    let profilePath: String?    /// optional - profile picture sometimes missing for cast member (*make all properties optional?)
    
    let castId: Int
    let character: String
    let creditId: String
    let order: Int
    
}


//struct Cast: Decodable {
//    let castId: Int
//    let character: String
//    let creditId: String
//    let gender: Int
//    let name: String
//    let id: Int
//    let order: Int
//    let profilePath: String
//}

