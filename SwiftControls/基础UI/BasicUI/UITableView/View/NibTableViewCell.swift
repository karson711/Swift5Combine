//
//  NibTableViewCell.swift
//  SwiftControls
//
//  Created by anfa on 2019/9/11.
//  Copyright © 2019 anfa. All rights reserved.
//

import UIKit

class NibTableViewCell: UITableViewCell {
    
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // 给cell赋值，项目中一般使用model，我这里直接写死了
    func setValueForCell(){
        iconImage?.image = UIImage.init(named: "")
        tipLabel?.text = "主标题"
        contentLabel?.text = "副标题--测试使用"
    }
    
}
