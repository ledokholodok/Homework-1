//
//  MyFriendsDataSource.swift
//  Homework 2
//
//  Created by Lidiya Karnaukhova on 19.04.2022.
//

import Foundation
import UIKit

class MyFriendsDataSource {
    
    let friends: [Friend] = [
        Friend(photo: UIImage(named: "Tucker")!, name: "Savannah Tucker", job: "Retail Supervisor", statusColor: UIColor(named: "Online")!),
        Friend(photo: UIImage(named: "Murphy")!, name: "Kathryn Murphy", job: "Photographer", statusColor: UIColor(named: "Online")!),
        Friend(photo: UIImage(named: "Stewart")!, name: "Darrel Stewart", job: "UI/UX Designer", statusColor: UIColor(named: "Offline")!),
        Friend(photo: UIImage(named: "Wilson")!, name: "Jenny Wilson", job: "Model, Actress", statusColor: UIColor(named: "Offline")!),
        Friend(photo: UIImage(named: "Henry")!, name: "Courtney Henry", job: "Taxi Driver", statusColor: UIColor(named: "Busy")!),
        Friend(photo: UIImage(named: "Warren")!, name: "Jim Warren", job: "Company CEO", statusColor: UIColor(named: "Offline")!),
        Friend(photo: UIImage(named: "Wilkins")!, name: "Tim Wilkins", job: "Mobile Developer", statusColor: UIColor(named: "Busy")!)
    ]

    func getMyFriends() -> [Friend] {
        return friends
    }
}
