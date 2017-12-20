//
//  ServiceLocator.swift
//  Service Locator
//
//  Created by N A Shashank on 12/13/17.
//  Copyright © 2017 N A Shashank. All rights reserved.
//

import UIKit

enum ServiceLocatorType{
    case mock
    case remote
}

final class ServiceLocator
{
    static let defaultLocator = ServiceLocator()
    private init(){
        print("nothing to do here, just to prevent others from using the init method")
    }
    
    var type:ServiceLocatorType = ServiceLocatorType.mock {
        willSet(newValue) {
            guard newValue == ServiceLocatorType.mock else{
                RemoteManager.registerServices()
                return
            }
            MockManager.registerServices()
        }
    }
    private var dictMockServices = [ObjectIdentifier:Any]()
    private var dictRemoteServices = [ObjectIdentifier:Any]()
    
    func register<inputType,outputType>(type:ServiceLocatorType,method:  @escaping (inputType) -> outputType )
    {
        typealias funcType = (inputType) -> outputType
        print(ObjectIdentifier(funcType.self))
        let id = ObjectIdentifier(funcType.self)
        guard type == ServiceLocatorType.mock else{
            ServiceLocator.defaultLocator.dictRemoteServices[id] = method
            return
        }
        ServiceLocator.defaultLocator.dictMockServices[id] = method
    }
    
    func service<inputType,outputType>() -> ((inputType) -> outputType)?
    {
        typealias funcType = (inputType) -> outputType
        let id = ObjectIdentifier(funcType.self)
        guard ServiceLocator.defaultLocator.type == ServiceLocatorType.mock else{
            return ServiceLocator.defaultLocator.dictRemoteServices[id] as? (inputType) -> outputType
        }
        return ServiceLocator.defaultLocator.dictMockServices[id] as? (inputType) -> outputType
    }
}
