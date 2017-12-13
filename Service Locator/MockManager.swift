//
//  MockManager.swift
//  Service Locator
//
//  Created by N A Shashank on 12/13/17.
//  Copyright © 2017 N A Shashank. All rights reserved.
//

import UIKit

class TestModel{
    
}

class MockManager{
    
    init() {
        ServiceLocator.defaultLocator.register(type: ServiceLocatorType.mock,method:self.abc)
    }
    
    func abc(model:TestModel) -> TestModel
    {
        print("in mock manager")
        return TestModel()
    }
}
