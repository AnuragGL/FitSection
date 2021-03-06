
import Foundation

struct DaxkoFit:Codable {
    var name:String
    var food:[Food]
}

struct Food:Codable {
    var id:Int
    var name:String
    var imageUrl:String
    var calories:String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case imageUrl = "image_url"
        case calories = "calories"
    }
}



