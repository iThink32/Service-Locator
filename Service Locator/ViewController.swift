
//
//  ViewController.swift
//  Service Locator
//
//  Created by N A Shashank on 12/13/17.
//  Copyright © 2017 N A Shashank. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //the first two lines are just for innitializing the mock and remote manager ideally it should not be done here,im doing it here to show you how Service Locator switches between API's
        let mockManager = MockManager()
        let remoteManager = RemoteManager()
        
        
        //fetch appropriate manager based on whether remote or mock is set in app delegate
        guard let unwrappedInstance:((TestModel)->(TestModel)) = ServiceLocator.defaultLocator.service() else{
            return
        }
        print(unwrappedInstance(TestModel()))
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

