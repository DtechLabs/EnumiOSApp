//
//  ApplicationTableVC.swift
//  EnumAPP
//
//  Created by Yuri Drigin on 20.10.16.
//  Copyright © 2016 Dtech Labs Ltd. All rights reserved.
//

import UIKit

class ApplicationTableVC: UITableViewController {

    @IBOutlet weak var bundleNameLabel: UILabel!
    @IBOutlet weak var appDSIDLabel: UILabel!
    @IBOutlet weak var identifierLabel: UILabel!
    @IBOutlet weak var vendorLabel: UILabel!
    @IBOutlet weak var uniqueIDLabel: UILabel!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var registerDateLabel: UILabel!
    @IBOutlet weak var installTypeLabel: UILabel!
    @IBOutlet weak var purchaserDSIDLabel: UILabel!
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var descriptionLabek: UILabel!

    var app : LMApp? {
        didSet {
            self.updateInfo()
        }
    }
    
    func updateInfo() {
        self.navigationItem.title = app?.shortLocalName
        appDSIDLabel?.text = app?.applicationDSID
        bundleNameLabel?.text = app?.bundleIdentifier
        identifierLabel?.text = app?.applicationIdentifier
        vendorLabel?.text = app?.vendorName
        uniqueIDLabel?.text = app?.uniqueIdentifier().uuidString
        itemNameLabel?.text = app?.itemName
        registerDateLabel?.text = app?.registeredDate.description
        installTypeLabel?.text = app?.originalInstallType.description
        purchaserDSIDLabel?.text = app?.purchaserDSID.description
        rankLabel?.text = "Unknown" // app?.ratingRank.description
        descriptionLabek?.text = "\(app?.description())"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateInfo()
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 6
        case 1:
            return 5
        default:
            return 0
        }
    }
}
