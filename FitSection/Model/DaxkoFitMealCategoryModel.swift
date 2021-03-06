
import Foundation
struct DaxkoFitMealCategoryModel: Codable {
    
    let id: Int
    let name: String
    let imageUrl: String

    enum CodingKeys :String, CodingKey {
        case id = "id"
        case name = "name"
        case imageUrl = "image_url"
      
    }
}

