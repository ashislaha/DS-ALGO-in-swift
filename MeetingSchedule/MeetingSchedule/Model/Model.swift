//
//  Model.swift
//  MeetingSchedule
//
//  Created by Ashis Laha on 20/01/18.
//  Copyright © 2018 Ashis Laha. All rights reserved.
//

import Foundation

// Define meeting data set
struct MeetingData: Decodable {
    let myself: String
    let meetings: [Meeting]
}

// Define Meeting
struct Meeting: Decodable {
    let meetingName: String
    let startTime: String
    let endTime: String
    let organiser: String
    let attendees: [Person]
}

// Define Person
struct Person: Decodable {
    let name: String
    let rank: Int
}

class Parser {
    static func parseJSON(completionBlock : @escaping (MeetingData)->()) {
        guard let path = Bundle.main.url(forResource: "MeetingData", withExtension: "json"), let data = try? Data(contentsOf: path) else { return }
        guard let meetingData = try? JSONDecoder().decode(MeetingData.self, from: data) else { return }
        completionBlock(meetingData)
    }
}
