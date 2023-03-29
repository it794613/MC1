import SwiftUI

struct ContentView: View {
    @State var pageContent: [String] = ["빨리회의끝내고 \n 퇴근합시다", "하이", "하이입니다."]
    @State var pageIdx = 1
    @State var isHidden: Bool = true
    @State var isPresent: Bool = false
    
    
    
    
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 40)
            introduction
            Spacer()
                .frame(height: 80)
            HStack {
                ForEach(pageContent.indices, id: \.self) { idx in
                    if idx == self.pageIdx {
                        Circle().foregroundColor(.black)
                    }else {
                        Circle().foregroundColor(.gray)
                    }
                }.frame(width: 10, height: 6)
            }
            .padding(.bottom,32)
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
        }.fullScreenCover(isPresented: $isPresent) {
            CardView()
        }
    }
    
    var introduction: some View {
        TabView(selection: $pageIdx) {
            ForEach($pageContent.indices, id: \.self) { idx in
                ZStack{
                    IntroView(titleText: $pageContent[idx], imageName: "Group").tag(idx)
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
        if idx == 2 {
            self.isHidden = false
        }
        else {
            self.isHidden = true
        }
    }
    
}


struct IntroView: View {
    @Binding var titleText: String
    let imageName: String
    
    var body: some View {
        VStack {
            Text(titleText)
                .font(.system(size: 22))
                .bold()
            .multilineTextAlignment(.center)
            Image(imageName)
                .resizable()
                .frame(width: 335, height: 348)
                .padding(.all, 20.0)
        }
    }
}

