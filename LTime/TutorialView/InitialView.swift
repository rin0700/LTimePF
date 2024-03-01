//
//  InitialView.swift
//  LTime
//
//  Created by komamura ryuichi on 2024/03/02.
//


import SwiftUI

struct InitialView: View {
    @AppStorage("is_init") var isInit = true  //初回起動時のみ画面を表示できるように設定

    var body: some View {
        if isInit {
            StartView()
        } else {
            TaskView()
            //StartView() //テスト用
        }
    }
}
