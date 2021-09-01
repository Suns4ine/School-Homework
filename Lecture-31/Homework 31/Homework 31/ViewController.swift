//
//  ViewController.swift
//  Homework 31
//
//  Created by Vyacheslav Pronin on 01.09.2021.
//

import UIKit
import LibOne

class ViewController: UIViewController {

    @objc public var struct1 = TestStructWrapper()
    @objc public var string = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //let test = Test()
    //let testLib = LibOne()
   // let testLib2 = LibObjc2()

}

public struct TestStruct {
    let value = 5
    
}

public class TestStructWrapper: NSObject {
    private let myStruct = TestStruct()
    
    @objc public var struct1: Int {
        myStruct.value
    }
}
