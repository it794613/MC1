//
//  CardView.swift
//  CardGame
//
//  Created by 최진용 on 2023/03/29.
//

import SwiftUI


struct SwipeView: View {
    // 스넥코드 사용하기
    @State var currentTime = Date()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let futureData: Date = Calendar.current.date(byAdding: .second, value: 40, to: Date()) ?? Date()
    @State var timeRemaining: String = ""
    @State var timeOver: Bool = false
    
    //현재 페이지 넘버
    @State var pageIdx: Int = 0
    
    //버튼 눌렸는지, 눌렸으면, 화면을띄울지에 대한 부분
    @State var isClicked: Bool = false
    
    //화면에서 랜덤하게 값가져올때쓰는 int
    @State var randomInt: Int = 0
    
    //chevron.up이 계속해서 움직이는 애니메이션 체크용
    @State var isMoving: Bool = false
    
    
     var contents: [Content] = [
        Content(emoji: "🤫", headLine: "깊은 사념에 침묵한 그대여...", content: "오늘 제일 조용했던 사람을 지목해보세요. \n 가장 많은 지목을 당한 사람이 결정권자!"),
        Content(emoji: "✈️", headLine: "잠시 동심으로 가보자!", content: "각자 종이 비행기접기 \n 가장 멀리 날린 \n사람의 의견을 따르세요"),
        Content(emoji: "🧻", headLine: "심호흡을 해보자!", content: "얼굴에 휴지를 올려 입으로\n바람을 부는 게임\n 휴지가 가장 오래 공중에 떠있는\n 사람의 의견을 따릅니다"),
        Content(emoji: "🧙‍♂️", headLine: "옹달샘 현자를 찾아서...", content: "다같이 일어나서 카페테리아로 갑니다. \n 물을 한 잔 마시고 \n가장 먼저 눈이 마주친 멘토에게 조언을 구합니다."),
        Content(emoji: "📚", headLine: "마음의 양식", content: "링고의 책장에 갑니다.\n책장에서 책을 한권 선택하세요.\n 펼침면 왼쪽에 알파벳 C가 가장 많이 나온\n사람의 의견으로 통일합니다."),
        Content(emoji: "👖", headLine: "외부인의 시선", content: "메인랩에 있는 러너 중 청바지를 입은 사람을 찾으세요.\n잠시 초대해 토론중인 내용을 설명하고\n그 러너의 의견을 적극 수용합니다."),
        Content(emoji: "👀", headLine: "눈치게임", content: "멘토이름 말하기 눈치게임입니다.\n가장 늦게 말한 사람 또는 이름을 언급하지 않은 최후의 사람이 결정권자!"),
        Content(emoji: "🍧", headLine: "베스킨라빈스 31", content: "가위바위보로 이긴 사람이 순서 및 방향 정합니다.\n한 사람 당 숫자 3개까지 말할 수 있습니다.\n'31'을 말하는 사람이 결정권자 당첨!"),
        Content(emoji: "🅰️ 🅱️", headLine: "초성퀴즈", content: "제한시간 내에 말하지 못하는 사람은 탈락입니다.\n공정한 심사를 위해 심사위원을 한 명 초빙하기를 권유합니다.\n\n\n제시 초성 : ᄋᄂ"),
        Content(emoji: "🗣️", headLine: "이 순간 당신도 이야기 작가", content: "아래의 템플릿에 맞춰 이야기 만들기! \n말하는 순서는 선착순!\n이야기가 이어지지 않아도 괜찮아요.\n끊기는 사람 또는 마지막에 말하는 사람이 결정권자!\n\n옛날 옛적에...  매일 매일...\n그러던 어느날... 그것 때문에...\n그것 때문에... 마침내...\n그날 이후로... 이 이야기의 교훈은..."),
        Content(emoji: "🐔", headLine: "건강한 체력에 건강한 정신이!", content: "닭싸움 최강자의 의견을 따릅니다.\n(제한시간 5분)"),
        Content(emoji: "🙌🏻", headLine: "지성과 체력을 써보자!", content: "손바닥 밀치기\n승자의 의견을 따릅니다.\n(토너먼트 진행)"),
        Content(emoji: "🔖", headLine: "제비뽑기", content: "쉽죠?"),
        Content(emoji: "✊✋✌️", headLine: "가위 바위 보", content: "이긴 사람에게 반박불가!"),
        Content(emoji: "🎉", headLine: "당신은 사랑받기 위해 태어난 사람", content: "오늘 기준으로 가장 가까운 생일의 사람이\n오늘 하루 왕!")
    ]
    
    var timeFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm"
        return formatter
    }
    var amFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "a"
        return formatter
    }
    

    var body: some View {
        ZStack {
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("회의중인 지금 시간은...").font(.system(size: 16))
                        HStack(alignment: .firstTextBaseline) {
                            Text("\(currentTime, formatter: amFormatter)")
                                .onAppear {
                                    Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                                        self.currentTime = Date()
                                    }
                                }.font(.system(size: 24))
                            Text("\(currentTime, formatter: timeFormatter)")
                                .onAppear {
                                    Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                                        self.currentTime = Date()
                                    }
                                }
                                .font(.system(size: 48, weight: .bold))
                        }
                    }.padding(.leading, 30)
                    .opacity(isClicked ? 0.4 : 1)
                    .animation(.linear(duration: 0.15), value: isClicked)
                    Spacer()
                }
                GeometryReader() { proxy in
                    ZStack {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                CardView().frame(width: proxy.size.width * 0.8)
                                CardView().frame(width: proxy.size.width * 0.8)
                                CardView().frame(width: proxy.size.width * 0.8)
                                CardView().frame(width: proxy.size.width * 0.8)
                                CardView().frame(width: proxy.size.width * 0.8)
                                CardView().frame(width: proxy.size.width * 0.8)
                                CardView().frame(width: proxy.size.width * 0.8)
                                CardView().frame(width: proxy.size.width * 0.8)
                                CardView().frame(width: proxy.size.width * 0.8)
                                CardView().frame(width: proxy.size.width * 0.8)
                            }
                            .padding()
                            //MARK: -여기에서 랜덤값을 받아서 해당 값을 통해서 배열을 순회 하는것으로 데이터를 받아와서 뷰에 뿌려주는것임
                            .onTapGesture {
                                isClicked = true
                                randomInt = Int.random(in: 0..<contents.count)
                            }.onAppear {
                                print("\(proxy.size.width * 0.75), \( proxy.size.height)")
                            }.offset(x: -293)
                        }
                        .opacity(isClicked ? 0.7 : 1)
                        .animation(.linear(duration: 0.1), value: isClicked)
                        .frame(width: proxy.size.width * 1.65)
                        
                        FlippedCard(emoji: contents[randomInt].emoji, headLine: contents[randomInt].headLine, content: contents[randomInt].content).frame(width: proxy.size.width * 0.8, height: 418)
                            .foregroundColor(.white)
                            .shadow(radius: 8)
                            .offset(x: -114)
                            .opacity(isClicked ? 1 : 0)
                            .scaleEffect(isClicked ? 1.118: 1)
                            .animation(.linear(duration: 0.15), value: isClicked)
                            .onTapGesture {
                                isClicked = false
                            }
                    }
                }
                .onAppear {
                    UIScrollView.appearance().isPagingEnabled = true
                }
                .frame(height: 450)
                .padding(.bottom, 50)
                Chevronimage
                    .opacity(isClicked ? 0.4 : 1)
                    .animation(.linear(duration: 0.15), value: isClicked)
                Text("카드를 뽑아주세요").font(.system(size: 16, weight: .medium)).offset(y: -4)
                    .opacity(isClicked ? 0.4 : 1)
                    .animation(.linear(duration: 0.15), value: isClicked)
            }
            .onAppear {
                upDateTimeRemaining()
                isMoving = true
            }.onReceive(timer) { newValue in
                upDateTimeRemaining()
            }
        }
    }
//MARK: -UI
    
    var Chevronimage : some View {
        Image(systemName: "chevron.up").padding(.bottom, 5)
            .offset(y: isMoving ? 0 : -8)
            .animation(.linear(duration: 0.7).repeatForever(), value: isMoving)
    }
    
    
//MARK: - Methods
    func upDateTimeRemaining() -> Void {
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
}


struct Card_Preview: PreviewProvider {
    static var previews: some View {
        SwipeView()
    }
}
