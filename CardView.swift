//
//  CardView.swift
//  CardGame
//
//  Created by 최진용 on 2023/03/29.
//

import SwiftUI


struct CardView: View {
    // 선언부
//    let Date = Date()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let futureData: Date = Calendar.current.date(byAdding: .second, value: 40, to: Date()) ?? Date()
    @State var timeRemaining: String = ""
    @State var timeOver: Bool = false
    @State var pageIdx: Int = 0
    

    var body: some View {
        VStack {
            Text("시간이 낭비되고 있어요~")
            Text("\(timeRemaining)")
            ScrollView(.horizontal) {
                HStack {
                    SwipeView().frame(width: 311)
                    SwipeView().frame(width: 311)
                    SwipeView().frame(width: 311)
                    SwipeView().frame(width: 311)
                    SwipeView().frame(width: 311)
                }
                .frame(height: 420)
                .padding()
                .onTapGesture {
                    print("hi")
                }
            }.padding(.bottom, 30)
            Image(systemName: "chevron.up").padding(.bottom, 5)
            Text("카드를 뽑아주세요").font(.system(size: 16, weight: .medium))
        }.onAppear {
//            getTime()
            upDateTimeRemaining()
        }.onReceive(timer) { newValue in
            upDateTimeRemaining()
        }
    }
    
//MARK: - Methods

    func upDateTimeRemaining() {
        if timeRemaining == "0 : 0" {
            timeRemaining = "timeOver"
            self.timer.upstream.connect().cancel()
        } else {
            let remaining = Calendar.current.dateComponents([.minute, .second], from: Date(), to: futureData)
            let min = remaining.minute ?? 0
            let sec = remaining.second ?? 0
            timeRemaining = "\(min) : \(sec)"
        }
    }
    func getIndex(_ currentOffet: CGFloat) -> Int {
            return Int(round(Double(currentOffet / UIScreen.main.bounds.width)))
        }
}


struct Card_Preview: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
