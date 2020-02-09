//
//  HomeCell.swift
//  Swift-Framework
//
//  Created by wujun on 2020/2/8.
//  Copyright © 2020 wujun. All rights reserved.
//

import UIKit

class HomeCell: BaseTableCell {
    lazy var titleLbl:UILabel = {
        let lbl = UILabel.init()
        return lbl
    }()
    lazy var detailLbl:UILabel = {
        let lbl = UILabel.init()
        return lbl
    }()
    lazy var icon:UIImageView = {
        let img = UIImageView.init()
        return img
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(titleLbl)
        self.addSubview(detailLbl)
        self.addSubview(icon)
    }
    override func setCellDataByCellVo(baseTableCellVo: BaseTableCellVo) {
        YYCreator.setCommon3LblViewMap(homeCell: self, vo: baseTableCellVo)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        icon.frame = CGRect.init(x: 10, y: self.frame.size.height/2 - 44/2, width: 44, height: 44)
        titleLbl.frame = CGRect.init(x: icon.frame.origin.x + icon.frame.size.width + 10, y: 5, width: 150, height: 25)
        detailLbl.frame = CGRect.init(x: icon.frame.origin.x + icon.frame.size.width + 10, y: titleLbl.frame.origin.y + titleLbl.frame.size.height, width: self.frame.size.width, height: 30)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
