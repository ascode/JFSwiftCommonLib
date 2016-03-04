//
//  ViewController.swift
//  JFSwiftCommonLib
//
//  Created by arthurkiing on 03/04/2016.
//  Copyright (c) 2016 arthurkiing. All rights reserved.
//

import UIKit
import JFSwiftCommonLib

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//    print()
//        Device
        print(DeviceInfo.getCurrentLanguage())
        print(Result())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

