//
//  SelectTime.swift
//  MyTaskApp
//
//  Created by komamura ryuichi on 2024/02/21.
//

import SwiftUI

struct SelectTime: View {
    @EnvironmentObject var taskData: TaskData
    @State var selectedDate = Date()
    
    var df: DateFormatter {
        let df = DateFormatter()
        df.locale = Locale(identifier: "ja_JP")
        df.dateFormat = "a hh時mm分" // AM/PM 表記を追加
        return df
    }
    
    var body: some View {
        VStack {
            DatePicker("", selection: $selectedDate, displayedComponents: .hourAndMinute)
                .datePickerStyle(WheelDatePickerStyle())
                .environment(\.locale, Locale(identifier: "ja_JP"))
                .fixedSize()
                .labelsHidden()
                .onAppear{
                    taskData.SelectTimeText = df.string(from: selectedDate)
                    taskData.SelectTimeValue = selectedDate
                }
                .onChange(of: selectedDate) { newSelectedTime,oldSelectedTime in
                    taskData.SelectTimeText = df.string(from: selectedDate)
                    taskData.SelectTimeValue = selectedDate
                }
            
            Text("\(df.string(from: selectedDate))")
        }
    }
}

#Preview {
    SelectTime()
        .environmentObject(TaskData())
}
