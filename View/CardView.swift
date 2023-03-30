//
//  SwipeView.swift
//  CardGame
//
//  Created by 최진용 on 2023/03/29.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        ZStack(alignment: .topTrailing) {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color("lightGray"))
                .overlay {
                    Image("PatternImg")
                        .resizable()
                        .scaledToFit()
                        .padding(20)
                }
        }
    }
}


struct CardView_Preview: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
