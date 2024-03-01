//
//  Task+CoreDataProperties.swift
//  LTime
//
//  Created by komamura ryuichi on 2024/02/25.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var title: String?
    @NSManaged public var date:  String?
    @NSManaged public var time:  String?
    @NSManaged public var color: String?

}

extension Task {
    public var wrappedTitle: String {title ?? ""}
    public var wrappedDate:  String {date ?? ""}
    public var wrappedTime: String { time ?? "終日" }
    public var wrappedColor: String {color ?? String()}
}

extension Task : Identifiable {

}
