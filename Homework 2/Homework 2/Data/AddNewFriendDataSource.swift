//
//  MightKnowDataSource.swift
//  Homework 2
//
//  Created by Lidiya Karnaukhova on 20.04.2022.
//

import Foundation
import UIKit

class AddNewFriendDataSource {
    
    let profiles: [CellConfigurator] = [
        NewContactCellConfigurator(item: NewContactOption(iconTitle: "book", buttonTitle: "From Contacts")),
        NewContactCellConfigurator(item: NewContactOption(iconTitle: "signature", buttonTitle: "By Username")),
        NewContactCellConfigurator(item: NewContactOption(iconTitle: "phone.connection", buttonTitle: "By Phone Number")),
        MightKnowCellConfigurator(item: MightKnow(profileImage: "Tucker", statusColor: "Offline", profileName: "Savannah Tucker", friendsCount: "1298 Friends", friendToggle: "added"),
        MightKnowCellConfigurator(item: MightKnow(profileImage: "Murphy", statusColor: "Offline", profileName: "KathMur96", friendsCount: "12.6K Friends", friendToggle: "added")
    ]

    func getMightKnowProfiles() -> [MightKnow] {
        return profiles
    }
}
