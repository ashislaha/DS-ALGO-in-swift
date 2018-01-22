//
//  MeetingViewTableHeader.swift
//  MeetingSchedule
//
//  Created by Ashis Laha on 20/01/18.
//  Copyright © 2018 Ashis Laha. All rights reserved.
//

import Foundation
import UIKit

class MeetingSectionHeader: UITableViewHeaderFooterView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewSetup()
    }
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        viewSetup()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    // header label
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .center
        label.backgroundColor = .clear
        label.text = "Today's Meeting"
        return label
    }()
    // view setup
    private func viewSetup() {
        addSubview(headerLabel)
        headerLabel.anchors(top: topAnchor, leading: leadingAnchor, leadingConstants: 16.0, bottom: bottomAnchor, trailing: trailingAnchor)
    }
}

