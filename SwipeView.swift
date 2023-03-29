//
//  SwipeView.swift
//  CardGame
//
//  Created by 최진용 on 2023/03/29.
//

import SwiftUI

struct SwipeView: View {
    var body: some View {
        ZStack(alignment: .topTrailing) {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color(uiColor: UIColor(red: 71/255, green: 71/255, blue: 71/255, alpha: 1)))
            Text("12'o Clock")
                .foregroundColor(.white).font(.system(size: 12, weight: .semibold))
                .offset(x:-20,  y: 30)
        }
    }
}


struct SwipeView_Preview: PreviewProvider {
    static var previews: some View {
        SwipeView()
    }
}
