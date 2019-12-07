//
//  main.swift
//  Examen
//
//  Created by Sofìa Gutièrrez on 11/29/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit


//subclase de UIApplication, normalmente en una app solo hay una instancia de UIApplication y en algunas ocasiones tienen una subclase
class MyApplication: UIApplication{
    override func sendEvent(_ event: UIEvent) {
        print("Hola")
        super.sendEvent(event)
    }
}

UIApplicationMain(CommandLine.argc,
                  CommandLine.unsafeArgv,
                  NSStringFromClass(MyApplication.self),
                  NSStringFromClass(AppDelegate.self))

//UIApplicationMain(<#T##argc: Int32##Int32#>, <#T##argv: UnsafeMutablePointer<UnsafeMutablePointer<Int8>?>##UnsafeMutablePointer<UnsafeMutablePointer<Int8>?>#>, <#T##principalClassName: String?##String?#>, <#T##delegateClassName: String?##String?#>)
