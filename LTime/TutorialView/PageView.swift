//
//  PageView.swift
//  LTime
//
//  Created by komamura ryuichi on 2024/03/02.
//

import SwiftUI

struct PageView: View {
    var page: Page
    
    var body: some View {
        Image("\(page.imageUrl)")
            .resizable()
            .scaledToFill()
            .edgesIgnoringSafeArea(.all)
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(page: Page.tutorialPage)
    }
}
