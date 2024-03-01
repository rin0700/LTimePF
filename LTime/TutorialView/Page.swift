//
//  TutorialView.swift
//  LTime
//
//  Created by komamura ryuichi on 2024/02/28.
//

import SwiftUI

struct Page: Identifiable, Equatable {
    let id = UUID()
    var  imageUrl: String
    var tag: Int
    //チュートリアル画面の作成
    static var tutorialPage = Page(imageUrl: "Tutorial1", tag: 0)
    static var tutorialPages: [Page] = [
        Page(imageUrl: "Tutorial1", tag: 0),
        Page(imageUrl: "Tutorial2", tag: 1),
        Page(imageUrl: "Tutorial3", tag: 2),
        Page(imageUrl: "Tutorial4", tag: 3),
        Page(imageUrl: "Tutorial5", tag: 4),
        Page(imageUrl: "Tutorial6", tag: 5),
        Page(imageUrl: "Tutorial7", tag: 6)
    ]
    
}

