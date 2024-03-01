//
//  TaskView.swift
//  MyTaskApp
//
//  Created by komamura ryuichi on 2024/02/18.
//

import SwiftUI

//?TaskView初回起動時に未入力のデータが表示される　優先度高

struct TaskView: View {
    @Environment(\.managedObjectContext)private var context
    @ObservedObject var taskCoreData = TaskCoreData()
    
    @FetchRequest(
        entity:TaskCoreData.entity(),sortDescriptors: [NSSortDescriptor(keyPath:\TaskCoreData.date,ascending: false)],
        animation: .default)
    private var TaskCoreDataAddView: FetchedResults<TaskCoreData>
    @State var showAlert = false

    @AppStorage("is_init") var isInit = true //デバッグ用

    var body: some View {
        ZStack {
            ScrollView {
                ForEach(TaskCoreDataAddView) { ListTaskData in
                    VStack {
                        HStack {
                            ZStack {
                                Button(action: {
                                    showAlert = true
                                }, label: {
                                    Ellipse()
                                    //ランダムで大きさ設定(230,160は最小値)
                                        .frame(width: 230 + CGFloat(ListTaskData.wrappedWidth),
                                               height: 160 + CGFloat(ListTaskData.wrappedHeight))
                                    //選択したColorを表示
                                        .foregroundColor(Color(red: ListTaskData.wrappedColorR,
                                                               green: ListTaskData.wrappedColorG,
                                                               blue: ListTaskData.colorB))
                                })
                                //長押しで削除（実装済み）：優先度高
                                .alert("削除しますか？",isPresented: $showAlert) {
                                    Button("no"){
                                    }
                                    Button("yes"){
                                        context.delete(ListTaskData)
                                        try!context.save()
                                    }
                                }
                                //タスクのタイトルを表示
                                Text(ListTaskData.wrappedTitle)
                                    .font(.system(size: 24))
                                //年月日表示
                                Text("\(dfDate.string(from: ListTaskData.wrappedDate))").padding(.bottom,150) //今日だった場合は"今日"（未実装）
                                //時間表示
                                Text("\(dfTime.string(from: ListTaskData.wrappedTime))").padding(.bottom,120)//時刻に変更がなかった場合は"終日"（未実装）
                            }
                        }
                        .padding(.trailing,CGFloat(ListTaskData.wrappedTrailing)) //ランダムでtrailingの位置を変更（実装済）
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.top,130)
            }
            VStack {
                ZStack {
                    Image("backgrounditem6")
                        .resizable()
                        .frame(width: 256, height: 209)
                        .offset(x:0)
                    Image("backgrounditem5")
                        .resizable()
                        .frame(width: 189, height: 209)
                        .offset(x:-150, y:-50)
                }
            }.padding(.top, -460)
            
            NavigationStack {
                VStack {
                    HStack {
                        Spacer().frame(width: 250)
                        NavigationLink {
                            CreateTaskView()
                                .environmentObject(TaskData())
                        } label: {
                            ZStack {
                                Image("backgrounditemPlus")
                                    .resizable()
                                    .frame(width: 256, height: 180)
                            }
                        }
                    }
                }
                .padding(.top, -460)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}
var dfDate: DateFormatter {
    let df = DateFormatter()
    df.dateFormat = "yy/MM/dd"
    df.locale = Locale(identifier: "ja_JP")
    return df
}
var dfTime: DateFormatter {
    let df = DateFormatter()
    df.locale = Locale(identifier: "ja_JP")
    df.dateFormat = "a hh時mm分まで" // 午前/午後 表記を追加
    return df
}
#Preview {
    TaskView()
}
