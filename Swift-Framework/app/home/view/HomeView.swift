//
//  HomeView.swift
//  Swift-Framework
//
//  Created by wujun on 2020/2/7.
//  Copyright © 2020 wujun. All rights reserved.
//

import UIKit

class HomeView: BaseTableView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.baseTableView.backgroundColor = UIColor.white
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func reloadOtherViewsByVo(baseTableViewVo: BaseTableViewVo) {
        print("reloadOtherViewsByVo",baseTableViewVo.dataArray.count)
    }
    
}
