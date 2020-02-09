//
//  BaseTableView.swift
//  Swift-Framework
//
//  Created by wujun on 2019/4/27.
//  Copyright © 2019 wujun. All rights reserved.
//

import UIKit

class BaseTableView: BaseTemplateView {
    
    public var baseTableView:YYUITableView = YYUITableView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.baseTableView = YYUITableView.init(frame: self.bounds, style: UITableView.Style.plain)
        self.addSubview(self.baseTableView)
        self.baseTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.baseTableView.separatorColor = UIColor.gray
//        var inset:UIEdgeInsets!
//        inset.left = -40
//        self.baseTableView.separatorInset
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func reloadView(baseTableViewVo:BaseTableViewVo) -> () {
        self.reloadTableView()
        self.reloadOtherViewsByVo(baseTableViewVo: baseTableViewVo)
    }
    
    @objc public func reloadTableViewImmediately() -> () {
        self.baseTableView.reloadData()
    }
    @objc public func reloadTableView() -> () {
        self.baseTableView.performSelector(onMainThread: #selector(reloadData), with: nil, waitUntilDone: true)
        self.baseTableView.reloadData()
        self.baseTableView.layoutIfNeeded()
    }
    @objc func reloadData() -> () {
        self.baseTableView.reloadData()
    }
    public func reloadOtherViewsByVo(baseTableViewVo:BaseTableViewVo) -> () {
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
}
