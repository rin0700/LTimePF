//
//  CreateTaskView.swift
//  MyTaskApp
//
//  Created by komamura ryuichi on 2024/02/19.
//

import SwiftUI

struct CreateTaskView: View {
    @EnvironmentObject var taskData: TaskData
    @Environment(\.managedObjectContext)private var context
    @ObservedObject var saveTaskCoreData = SaveTaskCoreData()

    @State private var inputTaskName = "" //タスク名
    @State private var selectedColor = Color.blue //カラー
    @State private var showSelectDate: Bool = false //日付選択画面の表示
    @State private var showSelectTime: Bool = false //時間選択画面の表示

    //TaskViewのタスク表示用
    let randomWidth = Int.random(in: 1..<100)
    let randomHeight = Int.random(in: 1..<80)
    let randomTrailing = Int.random(in: -120..<120)

    var body: some View {
        NavigationStack {
            VStack {
                HStack (spacing: 0) {
                    ZStack{
                        Image("backgrounditem6")
                            .resizable()
                            .frame(width: 256, height: 209)
                            .offset(x: 100,y: -100)
                        NavigationLink {
                            TaskView()
                        } label: {
                            Image("backgrounditemLeft")
                                .resizable()
                                .frame(width: 256, height: 180)
                        }
                    }
                    Spacer().frame(width: 350)
                }
                .padding(.top,-230)
                ZStack {
                    //入力したタスクのPreview
                    Ellipse()
                        .frame(width: 320, height: 220)
                        .foregroundColor(selectedColor)
                    Text(inputTaskName)
                    Text(taskData.SelectDataText)
                        .padding(.bottom,180)
                    Text(taskData.SelectTimeText)
                        .padding(.bottom,130)

                }.padding()
                //入力画面
                TextField("                 タスクを入力してください", text: $inputTaskName)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 350)

                HStack (spacing: 40){
                    //色変更ボタン
                    Button(action: {
                        UIColorWellHelper.helper.execute?()
                    }, label: {
                        Image(systemName: "paintbrush")
                            .foregroundColor(.black)
                            .font(.system(size: 35))
                            .background(
                                ColorPicker("タスクごとに色を変更できます", selection: $selectedColor, supportsOpacity: false)
                                    .labelsHidden().opacity(0)
                            )
                    })
                    //日付変更ボタン
                    Button(action: {
                        showSelectDate = true
                    }, label: {
                        Image(systemName: "calendar")
                            .foregroundColor(.black)
                            .font(.system(size: 35))
                    })
                    .sheet(isPresented: $showSelectDate,content: {
                        SelectDate()
                            .presentationDetents([.medium])
                    })
                    //時間変更ボタン
                    Button(action: {
                        showSelectTime = true
                    }, label: {
                        Image(systemName: "clock")
                            .foregroundColor(.black)
                            .font(.system(size: 35))
                    })
                    .sheet(isPresented: $showSelectTime, content: {
                        SelectTime()
                            .presentationDetents([.medium])
                    })
                    //タップしたとき各タスクデータをCoreDataに保存 && TaskViewに移動
                    NavigationLink(destination: TaskView()) {
                        Image(systemName: "plus.circle")
                            .foregroundColor(.blue)
                            .font(.system(size: 35))
                    }.simultaneousGesture(TapGesture().onEnded{
                        saveTaskCoreData.title = inputTaskName
                        saveTaskCoreData.date = taskData.SelectDataValue
                        saveTaskCoreData.time = taskData.SelectTimeValue
                        saveTaskCoreData.height = Int16(randomHeight)
                        saveTaskCoreData.width = Int16(randomWidth)
                        saveTaskCoreData.trailing = Int16(randomTrailing)
                        let(red, green, blue) = selectedColor.toRGBA()
                        saveTaskCoreData.colorR = red
                        saveTaskCoreData.colorG = green
                        saveTaskCoreData.colorB = blue
                        saveTaskCoreData.writeData(context: context)
                    })
                }//HStack
            }
            .navigationBarBackButtonHidden(true)
        }

    }
}
//ColorPiker//

//CoreData保存用 R,G,B(alpha消すとエラーになるので注意)
extension Color {
    func toRGBA() -> (red: Double, green: Double, blue: Double) {

        let uiColor = UIColor(self)
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        return (Double(red), Double(green), Double(blue))
    }
}
//ColorPickerのボタンのデザインを任意に設定
extension UIColorWell {

    override open func didMoveToSuperview() {
        super.didMoveToSuperview()

        if let uiButton = self.subviews.first?.subviews.last as? UIButton {
            UIColorWellHelper.helper.execute = {
                uiButton.sendActions(for: .touchUpInside)
            }
        }
    }
}
class UIColorWellHelper: NSObject {
    static let helper = UIColorWellHelper()
    var execute: (() -> ())?
    @objc func handler(_ sender: Any) {
        execute?()
    }
}



#Preview {
    CreateTaskView()
        .environmentObject(TaskData())
}
