//
//  NewsTableViewCell.swift
//  SwiftControls
//
//  Created by anfa on 2020/6/12.
//  Copyright © 2020 anfa. All rights reserved.
//

import UIKit
import Kingfisher //类似于SDWebImage

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var date: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupCell(item:DataItem) {
        let url = URL(string: item.thumbnail_pic_s!)
        img.kf.setImage(with: url!)
        title.text = item.title
        author.text = item.author_name
        date.text = item.date
    }
    
}
