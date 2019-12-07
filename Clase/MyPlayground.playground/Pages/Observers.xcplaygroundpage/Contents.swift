//: [Previous](@previous)

import Foundation

struct StepCounter{
    var totalSteps: Int = 6{
        willSet {
            print("About to set totalSteps to \(newValue)")
        }
        didSet {
            print("Added \(totalSteps - oldValue) steps")
        }
    }
}


var stepCounter = StepCounter()
stepCounter.totalSteps = 20
