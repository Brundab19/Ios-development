//import Foundation
//
//protocol TryoutDelegates {
//    func printCallerName()
//}
//
//class TryingDelegate: TryoutDelegates {
//    func printCallerName() {
//        print("This was called on TryingDelegate delegate")
//    }
//}
//
//class TryingDelegate1: TryoutDelegates {
//    func printCallerName() {
//        print("This was called on TryingDelegate1 delegate")
//    }
//}
//
//class CallDelegate {
//    var delegate: TryoutDelegates
//    init(delegate: TryoutDelegates) {
//        self.delegate = delegate
//    }
//    func callingDelegateFunction() {
//        delegate.printCallerName()
//    }
//}
//
//let obj = CallDelegate(delegate: TryingDelegate1())
//obj.callingDelegateFunction()


import Foundation
