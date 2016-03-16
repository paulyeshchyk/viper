//
//  ListViewController.swift
//  ViperListDetail
//
//  Created by Pavel Yeshchyk on 3/14/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, ListViewProtocol, UITableViewDataSource, UITableViewDelegate {

    
    var presenter:ListPresenterProtocol?
    @IBOutlet var tableView:UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView?.registerNib(UINib(nibName: "ListTableViewCell", bundle: NSBundle.mainBundle()), forCellReuseIdentifier: "ListTableViewCell")

    }
    
    //MARK: - UITableViewDatasource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if let pr = self.presenter {
            
            return pr.numberOfDetails()
        }
        
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCellWithIdentifier("ListTableViewCell") else {
            
            return UITableViewCell(style: .Default, reuseIdentifier: "")
        }

        guard let presenter = self.presenter else {
            
            return UITableViewCell(style: .Default, reuseIdentifier: "")
        }
        
        do {
            if let entity = try presenter.detailAtIndex(indexPath.row) {
            
                cell.textLabel?.text = entity.name
            }
        } catch {
            
        }

        return cell
    }
    
    //MARK: - UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        presenter?.openDetailAtIndex(indexPath.row)
        
    }
    
    //MARK: - ListViewProtocol
    func reloadTableView() {
        
        self.tableView?.reloadData()
    }
}
