//
//  ListAppTableVC.swift
//  EnumAPP
//
//  Created by Yuri Drigin on 20.10.16.
//  Copyright © 2016 Dtech Labs Ltd. All rights reserved.
//

import UIKit

class ListAppTableVC: UITableViewController {

    fileprivate var collapseDetail = true
    
    private let installedList = ListInstalledAPP.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        splitViewController?.delegate = self
        splitViewController?.preferredDisplayMode = .allVisible
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(ListAppTableVC.updateList(_:)),
                                               name: Notification.Name("listApdate"), object: nil)
    }

    func updateList(_ notifcation: Notification) {
        self.tableView.reloadData()
        let path = IndexPath(row: 1, section: 0)
        self.tableView.selectRow(at: path, animated: true, scrollPosition: .top)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return installedList?.count ?? 0
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "installedAPPCell", for: indexPath)
        cell.textLabel?.text = installedList?[indexPath.row].name
        cell.imageView?.image = installedList?[indexPath.row].icon
        return cell
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowAppInfo" {
          
          collapseDetail = false
          guard let navVC =  segue.destination as? UINavigationController,
                let destVC = navVC.topViewController as? ApplicationTableVC,
                let cell = sender as? UITableViewCell,
                let index = tableView.indexPath(for: cell)?.row
            else { return }
            
            destVC.app = ListInstalledAPP.shared?[index]
        }
    }

}

extension ListAppTableVC: UISplitViewControllerDelegate {
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return collapseDetail
    }
}
