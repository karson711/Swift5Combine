//
//  CollectionViewController.swift
//  SwiftControls
//
//  Created by jikun on 2019/9/11.
//  Copyright © 2019 anfa. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController{
    
    var collectionView:UICollectionView?
    let Identifier       = "CollectionViewCell"
    let headerIdentifier = "CollectionHeaderView"
    let footIdentifier   = "CollectionFootView"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationItem.title = "UICollectionView详解"
        self.view.backgroundColor = UIColor.white
        
        //初始化
        let layout = UICollectionViewFlowLayout.init()
        layout.itemSize = CGSize.init(width: 60, height: 60)
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets.init(top: 5, left: 5, bottom: 5, right: 5)
        // 设置分区头视图和尾视图宽高
        layout.headerReferenceSize = CGSize.init(width: ScreenWidth, height: 80)
        layout.footerReferenceSize = CGSize.init(width: ScreenWidth, height: 80)
        
        collectionView = UICollectionView.init(frame: CGRect.init(x: 0, y: 64, width: ScreenWidth, height: 400), collectionViewLayout: layout)
        collectionView?.backgroundColor = UIColor.white
        collectionView?.delegate = self
        collectionView?.dataSource = self
        self.view.addSubview(collectionView!)
        
        //注册cell
        collectionView?.register(UINib.init(nibName: Identifier, bundle: nil), forCellWithReuseIdentifier: Identifier)
        //注册headerView
        collectionView?.register(CollectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerIdentifier)
        //注册footerView
        collectionView?.register(CollectionFootView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footIdentifier)
        
    }

}


extension CollectionViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    //header高度
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize.init(width: ScreenWidth, height: 80)
    }
    //footer高度
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize.init(width: ScreenWidth, height: 80)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 18
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifier, for: indexPath) as! CollectionViewCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    //设定header和footer的方法，根据kind不同进行不同的判断即可
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let headerView:CollectionHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdentifier, for: indexPath) as! CollectionHeaderView
            headerView.view.backgroundColor = UIColor.red
            headerView.label.text = "This is HeaderView"
            return headerView
        }else{
            let footView:CollectionFootView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footIdentifier, for: indexPath) as! CollectionFootView
            footView.view.backgroundColor = UIColor.purple
            footView.label.text = "This is Foot"
            return footView
        }
        
    }
}
