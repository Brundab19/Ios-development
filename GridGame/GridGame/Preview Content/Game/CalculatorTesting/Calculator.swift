import Foundation

protocol CalculatorProtocol {
    func add(_: Int,_: Int) -> Int
    func sub(_: Int,_: Int) -> Int
    func mul(_: Int,_: Int) -> Int
    func div(_: Int,_: Int) -> Int
}

class Calculator : CalculatorProtocol {
    func add(_ num1: Int , _ num2: Int) -> Int {
        return num1 + num2
    }
    
    func sub(_ num1: Int , _ num2:Int) -> Int {
        return num1 - num2
    }
    
    func mul(_ num1:Int ,_ num2:Int) -> Int {
        return num1 * num2
    }
    
    func div(_ num1:Int ,_ num2:Int) -> Int {
        return num1 / num2
    }
    
    
}



