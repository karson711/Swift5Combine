//
//  CollectionFootView.swift
//  SwiftControls
//
//  Created by anfa on 2019/9/11.
//  Copyright © 2019 anfa. All rights reserved.
//

import UIKit

class CollectionFootView: UICollectionReusableView {
    
    var view = UIView()
    var label = UILabel()
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.view = UIView.init(frame: CGRect(x:0,y:0, width:self.frame.size.width, height:self.frame.size.height))
        self.addSubview(view)
        
        self.label = UILabel.init(frame: CGRect(x:10, y: 0, width:200, height:self.frame.size.height))
        self.addSubview(label)
    }
}
