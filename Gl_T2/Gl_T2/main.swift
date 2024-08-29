import Foundation

class Chore {
    
    var id: Int
    var title: String
    var descp: String
    var inst:  String
    var dueDate: String
    var createdDate: String
    var isComplete: Bool
    
    init(id:Int, title: String, descp: String, inst: String, dueDate: String, createdDate: String, isComplete: Bool){
        self.id = id
        self.title = title
        self.descp = descp
        self.inst = inst
        self.dueDate = dueDate
        self.createdDate = createdDate
        self.isComplete = isComplete
    }

    func show() {
        
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyyy-MM-dd"
        let duedate = dateFormat.date(from: self.dueDate)
        let compdate = dateFormat.date(from: self.createdDate)
        
        
        let outputFormat = DateFormatter()
        outputFormat.dateFormat = "dd-MM-yyyy"
        guard let duedate = duedate, let compdate = compdate else {
            exit(0)
        }
        
        let newDueDate = outputFormat.string(from: duedate)
        let newCompDate = outputFormat.string(from: compdate)
        
        print("""
            THESE ARE THE EXISTING CHORES
            -----------------------------------
            Id = "\(self.id)"
            Title = "\(self.title)"
            Description = "\(self.descp)"
            Instruction = "\(self.inst)"
            Duedate = "\(newDueDate)"
            Createddate = "\(newCompDate)"
            IsComplete = "\(self.isComplete)"
            ----------------------------------- \n
            """ )
    }
    
    

}


class PrintFunctionsAvailable {
    
    func functionAvailable() {
        
        print("""
        \n Choose what you need to do
        1. Add chores
        2. Show the chores entered
        3. To mark a chore as complete
        4. Delete the chore
        5. Edit the chore
        6. To exit loop \n
        """)
    }
    
    func inputTheValueOfChoose()->Int {
        guard let choose = readLine() , let choose = Int(choose) , choose > 0 else{
            print("Invalid choice")
            exit(0)
        }
        
        return choose
        
    }
}


class ChoreOperations {
    
    var chorearray = [Chore]()
    var cnt = 0
    
    func addChores (newchore: Chore) {
        chorearray.append(newchore)
    }
    
    func delete(pos : Int) {
        chorearray.remove(at: pos)
    }
    
  
    
    func editChores(replaceWhat:String, replaceWith:String, pos:Int) {
        switch replaceWhat {
        case "title":
            chorearray[pos].title = replaceWith
        case "description":
            chorearray[pos].descp = replaceWith
        case "instruction" :
            chorearray[pos].inst = replaceWith
        case "Duedate" :
            chorearray[pos].dueDate = replaceWith
        case  "Creationdate" :
            print("Creation date can't be change")
        default :
            print("There is no such property")
        }
    }
    
    func markComplete(pos : Int) {
        chorearray[pos].isComplete = true
    }
    
    func takingInputOfChore() {
        
        print("Enter the number of chores")
        if let size = readLine(), let size = Int(size) {
            var val = 0
            while (val < size) {
                
                let idInput = cnt
                cnt = cnt + 1
                print("Enter the title of the chore")
                
                guard let titleInput = readLine(), titleInput != "" else {
                    print ("Invalid input")
                    exit(0)
                }
                
                print("Enter the description of the chore")
                if let descInput = readLine() {
                    
                    print("Enter the Instruction of the chore")
                    if let instInput = readLine() {
                        
                        print("Enter the due date in the format yyyy-mm-dd")
                        guard let dueDate = readLine() else {
                            print("Invalid input")
                            exit(0)
                        }
                          
                        print("Enter the created date in the format yyyy-mm-dd")
                        guard let initDate = readLine() else {
                            print("INVALID")
                            exit(0)
                        }
                            
                            
                        let chore = Chore (id: idInput,title: "\(titleInput)", descp: "\(descInput)" , inst: "\(instInput)", dueDate: "\(dueDate)", createdDate: "\(initDate)", isComplete: false)
                            addChores(newchore: chore)
                            
                            val = val + 1
                            
                        }
                    }
                }
            }
    }
    
    func displayChore() {
        
        if chorearray.count >= 1 {
            for i in chorearray {
                i.show()
            }
        }
        
        else {
            print ("There is no chore to display")
        }
    }
    
    func markTaskComplete () {
        for i in chorearray {
            i.show()
        }
        
        print("Enter the title and id of the chore to mark complete")
        guard let tasktitle = readLine(), let taskid = readLine(), let taskid = Int(taskid) else {
            print("Enter it correctly")
            exit(0)
        }
        var posi = 0
        for i in chorearray {
            if i.title == tasktitle && i.id == taskid {
                    markComplete(pos:posi)
            }
            else{
                posi = posi + 1
            }
        }
        
        if posi == chorearray.count {
            print("There is no such title  or id of the chore")
        }
        else{
            print("Task \(tasktitle) is mark completed")
        }
        
    }
    
    func deleteTheChore() {
        
        if chorearray.count > 0 {
            
            for i in chorearray {
                i.show()
            }
            
            print("Enter the chore title to delete and the id of the chore")
            if let deltitle = readLine(), let id = readLine(), let id = Int(id){
                
                var posi : Int = 0
                let prevcount : Int = chorearray.count
                
                for i in chorearray {
                    
                    if deltitle == i.title && id == i.id {
                        delete(pos: posi)
                    }
                    
                    else{
                        posi = posi + 1
                    }
                }
                
                if(posi == prevcount) {
                    print("There is no such chore with that title")
                }
                else {
                    print("Removed the chore \(deltitle) ")
                }
            }
            
            else {
                print("Print a valid title or valid id")
            }
        }
        
        else {
            print("There is no chore to delete")
        }
        
    }
    
    func editTheChore() {
        
        print("Enter the title of chore you want to replace")
        guard let replacetitle = readLine() else {
            print("Invalid input")
            exit(0)
        }
        print ("Enter the property you what to replace")
        guard let property = readLine() else {
            print("Invalid input")
            exit(0)
        }
        print("Enter the value to replace with")
        guard let replace = readLine() else {
            print("Invalid input")
            exit(0)
        }
        var cnt = 0
        
        for i in chorearray {
            if i.title == replacetitle {
                editChores(replaceWhat:property, replaceWith:replace, pos:cnt)
            }
            else {
                cnt = cnt + 1
            }
        }
        
        if cnt == chorearray.count {
            print("The title don't match")
        }
        
    }
   
    func selectChoreTask(choose : Int) {
    
            switch choose {
            // Taking inputs to add the chores
            case 1: takingInputOfChore()
            //To display the chore
            case 2: displayChore()
            //To mark the task complete
            case 3: markTaskComplete()
            //To delete chore
            case 4: deleteTheChore()
            //To edit the chore
            case 5: editTheChore()
                        
            default : print("Yet to come")
            
        }
    }
    
    
}


let objChoreOprerations = ChoreOperations()
let objPrintFunction = PrintFunctionsAvailable()
var choice = 1
while choice != 6{
    objPrintFunction.functionAvailable()
    choice = objPrintFunction.inputTheValueOfChoose()
    objChoreOprerations.selectChoreTask(choose:choice)
}




