//
//  ViewController.swift
//  GA_TableView
//
//  Created by houjianan on 15/12/29.
//  Copyright © 2015年 houjianan. All rights reserved.
//



                         /*******************************/
                        /*主要思路：改变数据源,刷新section**/
                       /*******************************/
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerNib(UINib(nibName: "GA_MyCell", bundle: nil), forCellReuseIdentifier: "GA_MyCell")
    }
    //section数据源
    lazy var sectionArray: [GA_SectionModel] = {
        var arr = [GA_SectionModel]()
        for i in 0...3 {
            let model = GA_SectionModel()
            model.name = String(i)
            model.isExpand = false
            arr.append(model)
        }
        return arr
    }()
    //cell数据源
    lazy var dataArray: [GA_CellModel] = {
        var arr = [GA_CellModel]()
        for i in 0...5 {
            let model = GA_CellModel()
            model.title = "我第" + String(i) + "帅？"
            arr.append(model)
        }
        return arr
    }()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = GA_MyCell.createCell(tableView, indexPath: indexPath)
        cell.label.text = dataArray[indexPath.row].title
        return cell
    }
    //判断cell返回个数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if sectionArray[section].isExpand == false {
            return 0
        } else {
            return dataArray.count
        }
    }
    //返回sectionView GA_MySection可自定义
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionView = GA_MySection.loadMyView()
        sectionView.setupSection(sectionArray[section], section: section, delegate: self)
        return sectionView
    }
    //返回section个数
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sectionArray.count
    }
}

extension ViewController: GA_MySectionDelegate {
    //sectionView代理方法 也可用闭包
    func clickedSectionViewAction(tag: Int) {
        //改变数据源
        sectionArray[tag].isExpand! = !sectionArray[tag].isExpand!
        //刷新点击的cell
        let indexSet = NSIndexSet(index: tag)
        self.tableView.reloadSections(indexSet, withRowAnimation: UITableViewRowAnimation.Automatic)
    }
}
