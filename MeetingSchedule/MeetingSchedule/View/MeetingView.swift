//
//  MeetingView.swift
//  MeetingSchedule
//
//  Created by Ashis Laha on 20/01/18.
//  Copyright © 2018 Ashis Laha. All rights reserved.
//

import UIKit

class MeetingView: UIView {
    
    public var tableView: UITableView!
    public var meetingModel: [MeetingViewCellModel]?  {
        didSet {
            tableView.reloadData()
        }
    }
    // MARK: init
    override init(frame: CGRect) {
        super.init(frame: frame)
        tableViewSetUp()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        tableViewSetUp()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    // table view setup
    private func tableViewSetUp() {
        tableView = UITableView(frame: bounds)
        addSubview(tableView)
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isScrollEnabled = true
        // register cells
        tableView.register(MeetingViewTableCell.self, forCellReuseIdentifier: Constants.MeetingView.meetingCell)
        tableView.register(MeetingSectionHeader.self, forHeaderFooterViewReuseIdentifier:  Constants.MeetingView.meetingHeader)
        // resize based on content
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
        // scroll Indicator insets
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableView.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableView.reloadData()
    }
}
