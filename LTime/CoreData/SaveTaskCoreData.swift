//
//  SaveTaskCoreData.swift
//  LTime
//
//  Created by komamura ryuichi on 2024/02/26.
//

//入力したデータを保存・編集

import Foundation
import SwiftUI
import CoreData

class SaveTaskCoreData: ObservableObject{
    @Published var date = Date()
    @Published var time = Date()
    @Published var title = ""
    @Published var height = Int16()
    @Published var width = Int16()
    @Published var trailing = Int16()
    @Published var colorR = Double()
    @Published var colorG = Double()
    @Published var colorB = Double()

    @Published var isNewData = false
    @Published var updateItem:TaskCoreData!

    func writeData(context :NSManagedObjectContext){
        if updateItem != nil {
            updateItem.date = date
            updateItem.time = time
            updateItem.title = title
            updateItem.height = height
            updateItem.width = width
            updateItem.trailing = trailing
            updateItem.colorR = colorR
            updateItem.colorG = colorG
            updateItem.colorB = colorB
            try! context.save()

            updateItem = nil
            isNewData.toggle()

            date = Date()
            time = Date()
            title = ""
            height = Int16()
            width = Int16()
            trailing = Int16()
            colorR = Double()
            colorG = Double()
            colorB = Double()

            return
        }
        //データ新規作成（作成したデータをTaskCoreDataに）
        let newTaskCoreData = TaskCoreData(context: context)
        newTaskCoreData.date = date
        newTaskCoreData.time = time
        newTaskCoreData.title = title
        newTaskCoreData.height = height
        newTaskCoreData.width = width
        newTaskCoreData.trailing = trailing
        newTaskCoreData.colorR = colorR
        newTaskCoreData.colorG = colorG
        newTaskCoreData.colorB = colorB

        do {
            try context.save()
            isNewData.toggle()

            date = Date()
            time = Date()
            title = ""
            width = Int16()
            height = Int16()
            trailing = Int16()
            colorR = Double()
            colorG = Double()
            colorB = Double()
        }
        catch {
            print(error.localizedDescription)
        }
    }
    //編集機能（未実装）優先度中
    func editItem(item: TaskCoreData) {
        updateItem = item

        date = item.wrappedDate
        time = item.wrappedTime
        title = item.wrappedTitle
        height = item.wrappedHeight
        width = item.wrappedWidth
        trailing = item.wrappedTrailing
        colorR = item.wrappedColorR
        colorG = item.wrappedColorG
        colorB = item.wrappedColorB
        isNewData.toggle()
    }
}
