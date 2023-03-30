//
//  FlipedCard.swift
//  CardGame
//
//  Created by 최진용 on 2023/03/30.
//

import SwiftUI

struct FlippedCard: View {
    let emoji: String
    let headLine: String
    let content: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color("darkGray"))
                .overlay {
                    VStack{
                        HStack{
                            Spacer()
                            Image("12 O’CLOCK")
                                .padding([.top,.trailing], 20)
                        }
                        Spacer()
                    }
                }
            VStack(spacing: 20) {
                Text("\(emoji)")
                    .font(.system(size: 39))
                Text("\(headLine)")
                    .font(.system(size: 28).bold())
                    .frame(width: 200)
                    .multilineTextAlignment(.center)
                Text("\(content)")
                    .font(.system(size: 14))
                    .frame(width: 250)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .lineSpacing(2)
            }
        }
    }
}


struct Flipped_preview: PreviewProvider {
    static var previews: some View {
        SwipeView()
    }
}


//struct SolutionView : View {
//    let emoticon : String
//    let solutionHeadline : String
//    let solutionText : String
//
//    var body: some View {
//        VStack {
//            Text(emoticon)
//                .font(.system(size: 39))
//                .padding(.bottom, 30)
//            Text(solutionHeadline)
//                .font(.system(size: 25).bold())
//                .padding(.bottom, 50.0)
//            Text(solutionText)
//                .font(.system(size: 17))
//                .multilineTextAlignment(.center)
//        }
//    }
//}
