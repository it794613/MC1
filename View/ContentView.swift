import SwiftUI

struct ContentView: View {
    @State var pageContent: [String] = ["빨리회의끝내고 \n 퇴근합시다", "하이", "하이입니다", "hi"]
    var data: [IntroContent] = [
        IntroContent(title: "새로운 사람과의 협업 어떠세요?", Img: "intro_1"),
        IntroContent(title: "의사결정이 어렵지 않으셨나요?", Img: "intro_2"),
        IntroContent(title: "분명히 같은 이야기를 했는데?", Img: "intro_3"),
        IntroContent(title: "이 프로젝트 언제 시작한거 였죠?", Img: "intro_4"),
        IntroContent(title: "우리 모두 칼퇴합시다!", Img: "intro_5")
        
    ]
    @State var pageIdx = 0
    @State var isHidden: Bool = true
    @State var isPresent: Bool = false
    
    
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 40)
            introduction
            HStack {
                ForEach(data.indices, id: \.self) { idx in
                    if idx == self.pageIdx {
                        Circle().foregroundColor(.black)
                    }else {
                        Circle().foregroundColor(.gray)
                    }
                }.frame(width: 10, height: 6)
            }
            .offset(y: -30)
            .padding()
            Button {
                isPresent.toggle()
            } label: {
                Text("시작하기")
                    .frame(width: 335, height: 48)
            }
            .background(Color(.black))
            .foregroundColor(.white)
            .cornerRadius(24)
            .opacity(isHidden ? 0 : 1)
            .disabled(isHidden)
            .offset(y: -20)
            Spacer()
        }.fullScreenCover(isPresented: $isPresent) {
            SwipeView()
        }
    }
    
    var introduction: some View {
        TabView(selection: $pageIdx) {
            ForEach(data.indices, id: \.self) { idx in
                ZStack{
                    IntroView(titleText: data[idx].title, imageName: data[idx].Img).tag(idx)
                }
            }
        }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .onChange(of: pageIdx) { newValue in
                print(pageIdx)
                showStart(idx: newValue)
            }
    }
    
//MARK: - methods
    func showStart(idx: Int) {
        if idx == pageContent.count {
            self.isHidden = false
        }
        else {
            self.isHidden = true
        }
    }
    
}


struct IntroView: View {
    let titleText: String
    let imageName: String
    
    var body: some View {
        VStack {
            Text(titleText)
                .frame(width: 250)
                .font(.system(size: 24).bold())
                .lineSpacing(4)
            .multilineTextAlignment(.center)
            .padding(.bottom, 40)
            Image(imageName)
                .resizable()
                .scaledToFit()
                .padding(.all, 20.0)
        }
    }
}




struct View_Preview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
