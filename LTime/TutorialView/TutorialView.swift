//
//  TutorialView.swift
//  LTime
//
//  Created by komamura ryuichi on 2024/03/02.
//

import SwiftUI

struct TutorialView: View {
    @State private var pageIndex = 0
    private let pages: [Page] = Page.tutorialPages
    private let dotAppearance = UIPageControl.appearance()
    @AppStorage("is_init") var isInit = true
    
    var body: some View {
        NavigationStack {
            TabView(selection: $pageIndex) {
                ForEach(pages) { page in
                    ZStack {
                        PageView(page: page)
                        VStack {
                            if page == pages.last {
                                NavigationLink(destination: TaskView()) {
                                    Text("チュートリアルを終わる")
                                        .font(.system(size:28))
                                }.simultaneousGesture(TapGesture().onEnded{
                                    isInit = false //チュートリアルを終了すると初回起動のフラグをfalseに
                                })
                            }
                        }
                        .padding(.top,100)
                    }
                    .tag(page.tag)
                }
            }.navigationBarBackButtonHidden(true)
                .animation(.easeInOut, value: pageIndex)
                .indexViewStyle(.page(backgroundDisplayMode: .interactive))
                .tabViewStyle(PageTabViewStyle())
                .edgesIgnoringSafeArea(.all)
            //?画面が下に少しずれる,原因不明（後日修正）
        }
    }
}

#Preview {
    TutorialView()
}
