//
//  MeetingViewCell.swift
//  MeetingSchedule
//
//  Created by Ashis Laha on 20/01/18.
//  Copyright © 2018 Ashis Laha. All rights reserved.
//

import UIKit

// cell model
struct MeetingViewCellModel {
    let titleName: String
    let timeInfomation: String
    var isConflict: Bool
}

class MeetingViewTableCell: UITableViewCell {
    public var model: MeetingViewCellModel? {
        didSet {
            titleLabel.text = model?.titleName ?? ""
            timeLabel.text = model?.timeInfomation ?? ""
            backgroundColor = model?.isConflict ?? false ? .red : .green
        }
    }
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    private func layoutSetUp() {
        addSubview(titleLabel)
        addSubview(timeLabel)
        selectionStyle = .none
        // anchoring
        titleLabel.anchors(top: topAnchor, topConstants: 8.0, leading: leadingAnchor, leadingConstants: 8.0, trailing: trailingAnchor, trailingConstants: 0)
        timeLabel.anchors(top: titleLabel.bottomAnchor, topConstants: 0, leading: titleLabel.leadingAnchor, bottom: bottomAnchor, bottomConstants: 0, trailing: titleLabel.trailingAnchor)
    }
    // cell loading
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layoutSetUp()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        layoutSetUp()
    }
}

