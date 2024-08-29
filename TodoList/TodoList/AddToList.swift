//
//  AddToList.swift
//  TodoList
//
//  Created by Brunda Basavarajappa on 09/02/24.
//

import SwiftUI

struct AddToList: View {
    
//    @Binding var taskName: String
//    @Binding var arrayOfTask: [String]
      @ObservedObject var vm = ViewModel()
    
 //   @StateObject var vm = ViewModel()
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Add the task",text: $vm.taskName)
                Spacer()
            }.navigationTitle("Add Task")
        
        }
        Button {
            vm.arrayOfTask.append(vm.taskName)
        }label: {
            Text("Save")
        }
        
        ForEach(vm.arrayOfTask, id:\.self) { task in
                Text(task)
        }
       
    }
}

//#Preview {
//    AddToList(taskName: constant("Read Book"), arrayOfTask: constant(["hello"]))
//}
