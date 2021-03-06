
import Foundation

func readJson(jsonFileName:String) -> Data? {
    var data:Data?
    do {
        if let file = Bundle.main.url(forResource: jsonFileName, withExtension: "json") {
            data = try Data(contentsOf: file)
            
          } else {
            print("no file")
        }
    } catch {
        print(error.localizedDescription)
    }
    return data
}


