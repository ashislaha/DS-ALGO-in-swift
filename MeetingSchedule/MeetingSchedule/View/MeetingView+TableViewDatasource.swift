//
//  MeetingView+TableViewDatasource.swift
//  MeetingSchedule
//
//  Created by Ashis Laha on 20/01/18.
//  Copyright © 2018 Ashis Laha. All rights reserved.
//

import UIKit

extension MeetingView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meetingModel?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.MeetingView.meetingCell, for: indexPath) as? MeetingViewTableCell else { return UITableViewCell() }
        cell.model = meetingModel?[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: Constants.MeetingView.meetingHeader) as? MeetingSectionHeader else{ return nil }
        return header
    }
}



