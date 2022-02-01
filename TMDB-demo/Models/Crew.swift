import Foundation

struct Crew: Decodable {
    
    //let adult: Bool
    
    let gender: Int
    let id: Int
    
    //let knownForDepartment: String
    
    let name: String
    
    //let originalName: String
    //let popularity: Double
    
    let profilePath: String?    /// optional - profile picture usually missing for crew member
    
    let creditId: String
    let department: String
    
    let job: String             /// using property  job  even though not present in original struct (below)
    
}


//struct Crew: Decodable {
//    let creditId: String
//    let department: String
//    let gender: Int
//    let id: Int
//    let name: String
//    let profilePath: String
//}

