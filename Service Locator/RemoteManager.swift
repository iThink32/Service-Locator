//
//  RemoteManager.swift
//  Service Locator
//
//  Created by N A Shashank on 12/13/17.
//  Copyright © 2017 N A Shashank. All rights reserved.
//

import UIKit

class RemoteManager
{
    
    init() {
        ServiceLocator.defaultLocator.register(type: ServiceLocatorType.remote,method:self.abc)
    }
    
    func abc(model:TestModel) -> TestModel
    {
        print("in remote manager")
        return TestModel()
    }
}
