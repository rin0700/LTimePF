//
//  ContentView.swift
//  MyTaskApp
//
//  Created by komamura ryuichi on 2024/02/17.
//

import SwiftUI

struct StartView: View {
    @State private var aniFlag1 = false
    @State private var aniFlag2 = false
    @State private var txtFlag = false
    @AppStorage("is_init") var isInit = true
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    Image("backgrounditem4")
                        .resizable()
                        .frame(width: 371, height: 483)
                        .offset(x: aniFlag1 ? -250: -800, y: aniFlag1 ? 250: 800)//-250,250
                        .onAppear(){
                            DispatchQueue.main.async {
                                withAnimation(.easeInOut(duration: 1.2)) {
                                    aniFlag1.toggle()
                                }
                            }
                        }
                    Image("backgrounditem3")
                        .resizable()
                        .frame(width: 349, height: 269)
                        .offset(x: aniFlag2 ? -200: -300, y: aniFlag2 ? 0: -100)//-200,0
                        .onAppear() {
                            DispatchQueue.main.async {
                                withAnimation(.easeInOut(duration: 2.0)){
                                    aniFlag2.toggle()
                                }
                            }
                        }
                    Image("backgrounditem2")
                        .resizable()
                        .frame(width: 214, height: 329)
                        .offset(x: -50, y: aniFlag1 ? 50: -140)//-50,50
                        .onAppear() {
                            DispatchQueue.main.async {
                                withAnimation(.easeInOut(duration: 3.0)){
                                }
                            }
                        }
                    Image("backgrounditem1")
                        .resizable()
                        .frame(width: 412, height: 337)
                        .offset(x: aniFlag2 ? 120: 400, y: aniFlag2 ? 0: -150)//120,0
                        .onAppear() {
                            DispatchQueue.main.async {
                                withAnimation(.easeInOut(duration: 1.0)){
                                }
                            }
                        }
                }
                .padding(.top, -250)
                //Logo
                HStack(spacing: -25){
                    Text("L")
                        .font(.system(size: 120))
                        .fontWeight(.bold)
                        .opacity(txtFlag ? 1 : 0)
                        .onAppear() {
                            DispatchQueue.main.async {
                                withAnimation(.easeInOut(duration: 3.0)){
                                }
                            }
                        }
                    Text("T")
                        .font(.system(size: 120))
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 0.016, green: 0.44, blue: 0.29))
                        .opacity(txtFlag ? 1 : 0)
                        .onAppear() {
                            DispatchQueue.main.async {
                                withAnimation(.easeInOut(duration: 3.0)){
                                }
                            }
                        }
                    VStack(spacing: -10){
                        Text("エルタイム")
                            .font(.system(size:18))
                            .fontWeight(.bold)
                            .foregroundColor(Color(red: 0.016, green: 0.44, blue: 0.29))
                            .opacity(txtFlag ? 1 : 0)
                            .onAppear() {
                                DispatchQueue.main.async {
                                    withAnimation(.easeInOut(duration: 3.0)){
                                    }
                                }
                            }
                        Text("ime")
                            .font(.system(size:55))
                            .fontWeight(.bold)
                            .opacity(txtFlag ? 1 : 0)
                            .onAppear() {
                                DispatchQueue.main.async {
                                    withAnimation(.easeInOut(duration: 3.0)){
                                    }
                                }
                            }
                    }
                    .padding(.bottom,-30)
                }
                .padding(.top, -100)
                
                Text("タスクの管理はお任せください")
                    .font(.system(size:20))
                    .padding(.top,-90)
                    .opacity(txtFlag ? 1 : 0)
                    .onAppear() {
                        DispatchQueue.main.async {
                            withAnimation(.easeInOut(duration: 3.0)){
                            }
                        }
                    }
                
                Spacer()
                NavigationLink {
                    TutorialView()
                } label: {
                    Text("チュートリアルを始める")
                        .font(.system(size:28))
                        .foregroundColor(.black)
                        .padding(.bottom, 8)
                }
                .opacity(txtFlag ? 1 : 0)
                .onAppear() {
                    DispatchQueue.main.async {
                        withAnimation(.easeInOut(duration: 4.0)){
                            txtFlag.toggle()
                        }
                    }
                }
                NavigationLink(destination: TaskView()){
                    Text("スキップ")
                        .font(.system(size:20))
                }.simultaneousGesture(TapGesture().onEnded{
                    isInit = false //チュートリアルを終了すると初回起動のフラグをfalseに
                })
                .opacity(txtFlag ? 1 : 0)
                .onAppear() {
                    DispatchQueue.main.async {
                        withAnimation(.easeInOut(duration: 4.0)){
                        }
                    }
                }
                Spacer()
                //BackgroundItems(bottom)
                ZStack {
                    
                    Image("backgrounditem6")
                        .resizable()
                        .frame(width: 256, height: 209)
                        .offset(x: aniFlag1 ? 0: 200,y: aniFlag1 ? 0: 150)
                        .onAppear() {
                            DispatchQueue.main.async {
                                withAnimation(.easeInOut(duration: 1.0)){
                                }
                            }
                        }
                    Image("backgrounditem5")
                        .resizable()
                        .frame(width: 189, height: 209)
                        .offset(x: aniFlag2 ? -150: -500, y: aniFlag2 ? -50: -300)
                        .onAppear() {
                            DispatchQueue.main.async {
                                withAnimation(.easeInOut(duration: 1.9)){
                                }
                            }
                        }
                    Image("backgrounditem7")
                        .resizable()
                        .frame(width: 256, height: 173)
                        .offset(x: aniFlag1 ? 200: 400, y: aniFlag1 ? 30: 100)
                        .onAppear() {
                            DispatchQueue.main.async {
                                withAnimation(.easeInOut(duration: 1.0)){
                                }
                            }
                        }
                }
                .padding(.bottom,-123)
            }
        }
    }
}

#Preview {
    StartView()
}
