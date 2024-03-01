//
//  TaskData.swift
//  MyTaskApp
//
//  Created by komamura ryuichi on 2024/02/24.
//


//sheetから受け取った値を別のビューでも使用できるようにする。

import SwiftUI

class TaskData: ObservableObject {
    @Published var SelectDataValue = Date()
    @Published var SelectTimeValue = Date()
    
    @Published var SelectDataText = ""
    @Published var SelectTimeText = ""
}
