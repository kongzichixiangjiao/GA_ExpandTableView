//
//  GA_MyCell.swift
//  GA_TableView
//
//  Created by houjianan on 15/12/29.
//  Copyright © 2015年 houjianan. All rights reserved.
//

import UIKit

private let identifier = "GA_MyCell"
class GA_MyCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    
    class func createCell(tableView: UITableView, indexPath: NSIndexPath) -> GA_MyCell {
        return tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath) as! GA_MyCell
    }
}
