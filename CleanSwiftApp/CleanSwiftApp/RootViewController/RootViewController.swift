//
//  RootViewController.swift
//  CleanSwiftApp
//
//  Created by Pavel Yeshchyk on 3/10/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import UIKit

class RootViewController: UIViewController, RootControllerProtocol, UITableViewDataSource, UITableViewDelegate {

    var localData:[String]?
    @IBOutlet var tableview:UITableView?
    
    //MARK: - RootControllerProtocol
    var router:RootRouterProtocol?
    var output:RootIteractorProtocol?

    
    func displayData(data: [String]) {
        
        self.localData = data
        self.tableview?.reloadData()
    }
    
    //MARK: - UIViewController
    override func awakeFromNib() {
        
        super.awakeFromNib()

    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        RootConfigurator.sharedInstance?.configure(self)

        self.tableview?.registerNib(UINib(nibName: "RootViewCell", bundle: NSBundle.mainBundle()), forCellReuseIdentifier: "RootViewCell")
        
        self.fetchData()
    }

    //MARK: - private
    func fetchData() {
        
        self.output?.fetchData()
    }
    
    
    //MARK: - UITableViewDatasource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var result:Int = 0
        if let data = self.localData {

            result = data.count
        }
        return result
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let result = tableView.dequeueReusableCellWithIdentifier("RootViewCell", forIndexPath: indexPath)
        result.textLabel?.text = self.localData![indexPath.row]
        return result
    }
    
    //MARK: - UITableViewDelegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableview?.deselectRowAtIndexPath(indexPath, animated: true)
        if let data = self.localData {
            
            self.router?.openRootDetail(data[indexPath.row])
        }
        
    }
}
