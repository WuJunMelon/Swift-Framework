//
//  CoreVC.swift
//  Swift-Framework
//
//  Created by wujun on 2019/4/27.
//  Copyright © 2019 wujun. All rights reserved.
//

import UIKit

class CoreVC: UIViewController {
    public var elementKey = String()
    public func getElementKey() ->(String){
        return ""
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        elementKey = self.getElementKey()
        // Do any additional setup after loading the view.
    }
    


}
