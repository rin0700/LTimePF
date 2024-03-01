//
//  TaskTemplate.swift
//  LTime
//
//  Created by komamura ryuichi on 2024/02/26.
//

//タスクの雛形を作成しグループ化する


import SwiftUI

struct TaskTemplate: View {
    @Environment(\.managedObjectContext)private var context
    @ObservedObject var saveTaskCoreData:SaveTaskCoreData
    @ObservedObject var taskCoreData:TaskCoreData
    var body: some View {
        ZStack {
            Ellipse()
                .frame(width: 320, height: 220)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            Text(taskCoreData.wrappedTitle)
            /*Text("1gatuaet")
                .padding(.bottom,180)
            Text("asfdasdf")
                .padding(.bottom,130)*/
        }
    }
}
