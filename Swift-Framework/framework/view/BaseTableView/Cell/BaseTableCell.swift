//
//  BaseTableCell.swift
//  Swift-Framework
//
//  Created by wujun on 2020/2/8.
//  Copyright © 2020 wujun. All rights reserved.
//

import UIKit

class BaseTableCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    

    
    func setCellDataByCellVo(baseTableCellVo:BaseTableCellVo) -> () {
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
