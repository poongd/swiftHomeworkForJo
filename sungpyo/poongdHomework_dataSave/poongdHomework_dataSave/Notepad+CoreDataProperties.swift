//
//  Notepad+CoreDataProperties.swift
//  poongdHomework_dataSave
//
//  Created by jsp on 2016. 5. 28..
//  Copyright © 2016년 jsp. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Notepad {

    @NSManaged var text: String?
    @NSManaged var date: String?
}
