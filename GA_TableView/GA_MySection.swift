//
//  GA_MySection.swift
//  GA_TableView
//
//  Created by houjianan on 15/12/29.
//  Copyright © 2015年 houjianan. All rights reserved.
//

import UIKit
//代理
protocol GA_MySectionDelegate: NSObjectProtocol {
   func clickedSectionViewAction(tag: Int)
}

class GA_MySection: UIView {

    @IBOutlet weak var button: UIButton!

    var delegate: GA_MySectionDelegate!

    func setupSection(model: GA_SectionModel, section: Int, delegate: GA_MySectionDelegate) {
        button.setTitle(model.name, forState: .Normal)
        self.delegate = delegate
        button.tag = section
    }
    
    @IBAction func buttonAction(sender: UIButton) {
        sender.selected = !sender.selected
        delegate.clickedSectionViewAction(sender.tag)
    }
    
    class func loadMyView() -> GA_MySection {
        return NSBundle.mainBundle().loadNibNamed("GA_MySection", owner: self, options: nil).last as! GA_MySection
    }
    
    
    

}
