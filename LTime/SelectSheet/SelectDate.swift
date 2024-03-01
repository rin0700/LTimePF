//
//  SelectDate.swift
//  MyTaskApp
//
//  Created by komamura ryuichi on 2024/02/21.
//

import SwiftUI

struct SelectDate: View {
    @EnvironmentObject var taskData: TaskData
    @State var selectedDate: Date = Date()
    
    var df: DateFormatter {
        let df = DateFormatter()
        df.dateFormat = "yy/MM/dd"
        df.locale = Locale(identifier: "ja_JP")
        return df
    }
    
    var body: some View {
        VStack {
            DatePicker("", selection: $selectedDate, displayedComponents: .date)
                .datePickerStyle(WheelDatePickerStyle())
                .environment(\.locale, Locale(identifier: "ja_JP"))
                .fixedSize()
                .labelsHidden()
                .onAppear{//View表示時
                    taskData.SelectDataText = df.string(from: selectedDate) //CreateTaskView表示用(SelectTime同様)
                    taskData.SelectDataValue = selectedDate //CoreData保存用(SelectTime同様)
                }
                .onChange(of: selectedDate) { newSelectedDate,oldSelectedDate in //値変更時
                    taskData.SelectDataText = df.string(from: selectedDate)
                    taskData.SelectDataValue = selectedDate
                }
            
            Text("\(df.string(from: selectedDate))") //表示用テキスト
            
        }
    }
}



#Preview {
    SelectDate()
        .environmentObject(TaskData())
}
