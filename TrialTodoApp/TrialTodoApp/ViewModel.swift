//
//  ViewModel.swift
//  TrialTodoApp
//
//  Created by Brunda Basavarajappa on 31/03/24.
//

import Foundation

protocol AddItems {
    func addItems(with obj: Todo)
}


class ViewModel : AddItems, ObservableObject{
   
    var items = [Todo]()
    
    func addItems(with obj: Todo) {
        items.append(obj)
    }
    
    func deleItems(val: Int) {
        items.remove(at: val)
    }
}
