import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "ChoreModel")
    
    init() {
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Failed to load the data \(error.localizedDescription)")
            }
        }
    }
    
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Data saved")
        } catch {
            print("We could not save the data ...")
        }
    }
    
    func addChore(title: String, desp: String, date: Date, context: NSManagedObjectContext) {
        
        let chores = ChoreDataModel(context: context)
        chores.id = UUID()
        chores.title = title
        chores.desp = desp
        chores.date = date
        save(context: context)
        
    }
        
    func editChore(chores: ChoreDataModel, title: String, desp: String, date: Date, context: NSManagedObjectContext) {
            
            chores.title = title
            chores.desp = desp
            chores.date = date
            save(context: context)
    }
    
    

}

