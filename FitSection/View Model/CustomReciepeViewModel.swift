
import Foundation


protocol CustomReciepeViewModelDelegate:class {
    func reloadTableView()
}

class CustomReciepeViewModel {
    weak var delegate: CustomReciepeViewModelDelegate?
    var customReciepeArray:[DaxkoFit] = [DaxkoFit]()
    
    func count() -> Int {
        return self.customReciepeArray.count
    }
    
    func numberOfRow(section:Int) -> Int {
        return self.customReciepeArray.count
    }
    
    func modelAtItem(Index:Int) -> DaxkoFit {
        return self.customReciepeArray[Index]
    }
    func  getDaxkoFitArray () -> [DaxkoFit] {
        return customReciepeArray
    }
    func cellForRowAtIndex(indexpath:IndexPath) -> [Food] {
        let FoodArray = customReciepeArray[indexpath.section].food
        return FoodArray
    }
    
    func parseJsonData() {
        guard let dataOfJson =  readJson(jsonFileName: "MealFit") else {return}
        do {
            let decoder = JSONDecoder()
            self.customReciepeArray = try decoder.decode([DaxkoFit].self, from: dataOfJson)
            delegate?.reloadTableView()
            
        } catch {
            debugPrint(error)
        }
    }
    
}
