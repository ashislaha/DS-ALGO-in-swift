//
//  ViewController.swift
//  MeetingSchedule
//
//  Created by Ashis Laha on 20/01/18.
//  Copyright © 2018 Ashis Laha. All rights reserved.
//

import UIKit

class MeetingViewController: UIViewController {

    public var meetingData: MeetingData?
    
    private let meetingView: MeetingView = {
        let view = MeetingView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private func layoutConstraint() {
        view.addSubview(meetingView)
        meetingView.anchors(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor,  trailing: view.safeAreaLayoutGuide.trailingAnchor)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layoutConstraint()
        parseJson()
    }
}

//MARK:- Extension
extension MeetingViewController {
    
    private func parseJson() {
        Parser.parseJSON { [weak self] (meetingData) in
            let meetings = self?.computeMeetingModel(meetingData: meetingData)
            self?.meetingView.meetingModel = meetings
        }
    }
    
    private func computeMeetingModel(meetingData: MeetingData) -> [MeetingViewCellModel] {
        
        guard !meetingData.meetings.isEmpty else { return [] }
        var cellModels: [MeetingViewCellModel] = []
        
        // As the meeting are sorted as per end time, no need to sort them again, simply use it
        let meetings = meetingData.meetings
        let mySelf = meetingData.myself
        
        let clusters = conflictMeetings(meetings: meetings)
        print(clusters)
        
        // iterate over clusters
        for eachCluster in clusters {
            if eachCluster.count == 1 { // no conflict, add into cellmodel
                cellModels.append(getCellModel(meeting: meetings[eachCluster[0]]))
            } else { // having some conflicts
                
                // find out the highest priority meeting
                var highestPriorityIndex = eachCluster[0]
                var maxAttendies = meetings[eachCluster[0]].attendees.count
                for eachConflictIndex in eachCluster {
                    
                    let organiser = meetings[eachConflictIndex].organiser
                    if organiser == mySelf { // CASE 1 : let's check the who is organizing the meeting
                        highestPriorityIndex = eachConflictIndex
                        break
                    } else { // CASE 2 : check for number of people
                        let currentMeetingAttendies = meetings[eachConflictIndex].attendees.count
                        if currentMeetingAttendies > maxAttendies {
                            maxAttendies = currentMeetingAttendies
                            highestPriorityIndex = eachConflictIndex
                        }
                    }
                }
                
                for eachConflictIndex in eachCluster {
                    if eachConflictIndex == highestPriorityIndex { // having highest priority
                        cellModels.append(getCellModel(meeting: meetings[eachConflictIndex]))
                    } else {
                        cellModels.append(getCellModel(meeting: meetings[eachConflictIndex], isConflict: true))
                    }
                }
            }
        }
        
        return cellModels
    }
    
    // create the conflict meeting
    private func conflictMeetings(meetings: [Meeting]) -> [[Int]] {
        
        var visited: [Bool] = Array<Bool>(repeating: false, count: meetings.count)
        var conflictClusters: [[Int]] = []
        
        for i in 0..<meetings.count where !visited[i] { // iterate over non-visited meetings
            visited[i] = true
            var cluster: [Int] = [i]
            let currentEndTime = Int(meetings[i].endTime) ?? 0
            
            for j in i+1..<meetings.count where !visited[j] { // check start time and end time and identify conflicts
                let nextStartTime = Int(meetings[j].startTime) ?? 0
                if nextStartTime < currentEndTime { // then conflict, append into cluster
                    cluster.append(j)
                    visited[j] = true
                }
            }
            conflictClusters.append(cluster)
        }
        return conflictClusters
    }
    
    // Considering current JSON. Not more than 2 meetings conflict in here
    private func simplestApproachCreateCellModels(meetingData: MeetingData) -> [MeetingViewCellModel] {
        
        guard !meetingData.meetings.isEmpty else { return [] }
        var cellModels: [MeetingViewCellModel] = []
        
        // As the meeting are sorted as per end time, no need to sort them again, simply use it
        let meetings = meetingData.meetings
        let mySelf = meetingData.myself
        
        // insert the first meeting
        cellModels.append(getCellModel(meeting: meetings[0]))
        
        // iterate all other meetings
        for index in 1..<meetings.count {
            // check the start time is greater than previous meeting finish time
            if let currentStartTime = Int(meetings[index].startTime), let previousEndTime = Int(meetings[index-1].endTime) {
                
                if currentStartTime >= previousEndTime { // no conflict, add it
                    cellModels.append(getCellModel(meeting: meetings[index]))
                } else if currentStartTime < previousEndTime { // conflict, solve the conflict
                    
                    // make both conflict
                    cellModels.append(getCellModel(meeting: meetings[index], isConflict: true))
                    cellModels[index-1].isConflict = true
                    
                    //CASE 1 : let's check the who is organizing the meeting
                    let organiser = meetings[index].organiser
                    if organiser == mySelf {
                        cellModels[index].isConflict = false
                    } else {
                        //CASE 2: check for number of people, I am comparing only 2 successive meetings,
                        
                        let currentAttendies = meetings[index].attendees.count
                        let previousAttendies = meetings[index-1].attendees.count
                        
                        // give more priority
                        if currentAttendies > previousAttendies {
                            cellModels[index].isConflict = false
                        } else {
                            cellModels[index-1].isConflict = false
                        }
                    }
                }
            }
        }
        return cellModels
    }
    private func getCellModel(meeting: Meeting, isConflict: Bool = false) -> MeetingViewCellModel {
        let meetingName = meeting.meetingName
        let startTime = meeting.startTime
        let endTime = meeting.endTime
        let timeInformation = startTime + " to " + endTime
        let cellModel = MeetingViewCellModel(titleName: meetingName, timeInfomation: timeInformation, isConflict: isConflict)
        return cellModel
    }
}
