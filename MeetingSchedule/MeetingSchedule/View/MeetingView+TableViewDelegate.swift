//
//  MeetingView+TableViewDelegate.swift
//  MeetingSchedule
//
//  Created by Ashis Laha on 20/01/18.
//  Copyright © 2018 Ashis Laha. All rights reserved.
//

import UIKit

extension MeetingView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
}

