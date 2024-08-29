import XCTest
@testable import GridGame

final class GridGameTests: XCTestCase {

    func textCalculatorAdd() {
        //Given
//when
       //then
        
        let num1 = 10
        let num2 = 90
        let obj = Calculator()
        
       // let result = obj.add(10,20)
        
       // XCTAssertEqual(result,30)
        
        let result1 = obj.sub(20,30)
        XCTAssertEqual(result1, 50)
    }
    
    

}
