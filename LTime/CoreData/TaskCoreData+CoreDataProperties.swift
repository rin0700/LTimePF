//
//  TaskCoreData+CoreDataProperties.swift
//  LTime
//
//  Created by komamura ryuichi on 2024/02/26.
//
//入力されたデータを保存しFetchRepuestで表示

import Foundation
import CoreData


extension TaskCoreData {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<TaskCoreData> {
        return NSFetchRequest<TaskCoreData>(entityName: "TaskCoreData")
    }
    
    @NSManaged public var date: Date?
    @NSManaged public var time: Date?
    @NSManaged public var title: String?
    @NSManaged public var width: Int16
    @NSManaged public var height: Int16
    @NSManaged public var trailing: Int16
    @NSManaged public var colorR: Double
    @NSManaged public var colorG: Double
    @NSManaged public var colorB: Double
    
}
extension TaskCoreData {
    public var wrappedDate:  Date {date ?? Date()}
    public var wrappedTime:  Date {time ?? Date()}
    public var wrappedTitle: String {title ?? ""}
    public var wrappedWidth: Int16 {width}
    public var wrappedHeight: Int16 {height}
    public var wrappedTrailing : Int16{trailing}
    public var wrappedColorR: Double{colorR}
    public var wrappedColorG: Double{colorG}
    public var wrappedColorB: Double{colorB}
}

extension TaskCoreData : Identifiable {
    
}
