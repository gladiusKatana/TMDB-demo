import Foundation

struct Review: Decodable {
    
//    let rating: Double // do not implement unless in mock data or if changed url construction
    
    let author: String
    
    //let authorDetails: ...    /// (are these authors ever noteworthy people? e.g. the late Roger Ebert?)
    
    let content: String
    let createdAt: String
    let id: String
    let updatedAt: String
    let url: String
    
}

