import Foundation

/*
//Recursive function for factorial
func factorial(_ value:Float)->Float{
    if value == 0 {
        return 1
    }
            else {
        return value * factorial(value-1)
    }
}


//Input of first numver
print("Enter the first number")
var num1 = Float(readLine()!)!


//Selection of operators
print ("""
 Select the operators as
 "+" -> addition
 "-" -> subraction
 "*" -> multiplication
 "/" -> division
 "!" -> factorial
 "^" -> power
 """)

print("Enter the operator")
var opr = readLine()



while opr != "=" {
    
    
    //Calculation of factorial
    if opr == "!" {
        num1 = factorial(num1)
    }
    
    else{
        
        
        //For operations other than factorial consider another number
        print("Enter the number with which you have to perform operation")
        let num2 = Float(readLine()!)!
        
        
        //Addition
        if opr == "+" {
            num1 = num1 + num2
            
        }
        
        
        //Subraction
        else if opr == "-" {
            num1 = num1 - num2
        }
        
        
        //Multiplication
        else if opr == "*" {
            num1 = num1 * num2
        }
        
        
        //Division
        else if opr == "/"{
            
            
            if num2 != 0 {
                num1 = num1 / num2
            }
            
            //Edge case of division by zero
            else {
                print("Invalid")
            }
        }
        
        //Power
        else if opr == "^" {
            num1 = pow(num1,num2)
        }
        
        //If other operation choosed than above mentioned
        else {
            print("Enter the valid operator")
        }
        
        
    }
    
    print(num1)
    
    print ("""
            Select the operators as
            "+" -> addition
            "-" -> subraction
            "*" -> multiplication
            "/" -> division
            "!" -> factorial
            "^" -> power
     """)

    print("Enter the operator")
    opr = readLine()
    
}
// Equal "="
print(num1)
*/

class Calculator {
    
    var num1 = 0.0
    var num2 = 0.0
    var opr = "="
    
    func input()->Double {
        
        print("Enter the number")
        
        guard let inputNumber = readLine(), let inputNumber = Double(inputNumber) else {
            print("Invalid input")
            exit(0)
        }
        return inputNumber
    }
    
    func operatorInput() {
        print ("""
         Select the operators as
         "+" -> addition
         "-" -> subraction
         "*" -> multiplication
         "/" -> division
         "!" -> factorial
         "^" -> power 
         "=" -> to view the final answer\n
         """)
        print("Enter the operator")
        
        guard let oprread = readLine() else{
            print("Enter the valid operator")
            return
        }
        
        opr = oprread
    }
    
    
    func chooseOperator() {
        
        
        while opr != "=" {
            
            if opr == "!" {
                num1 = factorial(num1)
                print(num1)
            }
            
            else{
                
                num2 = input()
                
                switch opr{
                case "+":
                    num1 = add(num1,num2)
                    print(num1)
                case "-":
                    num1 = subract(num1,num2)
                    print(num1)
                case "*":
                    num1 = multiply(num1,num2)
                    print(calculator.num1)
                case "/":
                    if num2 != 0{
                        num1 = division(num1,num2)
                        print(num1)
                    }
                    else{
                        print("Can't divide a number by zero")
                    }
                case "^":
                    num1 = pow(num1,num2)
                    print(num1)
                    
                default:
                    print("Entered a invalid operator \n")
                }
                
            }
            
            operatorInput()
            chooseOperator()
            
        }
        
    }
    
    func add(_ num1: Double, _ num2: Double) -> Double {
        return num1 + num2
    }
    
    func subract(_ num1:Double, _ num2:Double) -> Double{
        return num1 - num2
    }
    
    func multiply(_ num1:Double,_ num2:Double) -> Double{
        return num1 * num2
    }
    
    func division(_ num1:Double,_ num2:Double) -> Double{
        return num1 / num2
    }
    
    func factorial(_ value:Double)->Double{
        if value == 0 {
            return 1
        }
        else {
            return value * factorial(value-1)
        }
    }
}

    
let calculator = Calculator()
var num1 = calculator.input
calculator.operatorInput()
calculator.chooseOperator()
print("The final answer is \(calculator.num1)")





