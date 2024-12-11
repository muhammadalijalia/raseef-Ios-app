//
//  PageIndicator.swift
//  dot
//
//  Created by Teamx tec on 13/10/2022.
//

import SwiftUI
struct PageIndicator: View {
    let screenSize = UIScreen.main.bounds;
    @State var offset : CGFloat = 0
    @State private var currentPage = 0
    let numPages: Int = 4
    public var timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    private let spacing: CGFloat = 4
    private let dotSize: CGFloat = 12
    @State var pushtonextview = false
  //  var login = Login()
    var body: some View {
        VStack(spacing:20) {
            
          
            HStack(alignment: .center, spacing: spacing) {
                ForEach(0 ..< numPages, id: \.self)
                {
                    DotIndicator(pageIndex: $0, isOn: self.$currentPage)
                    .frame(width: self.dotSize, height: self.dotSize)

               
                }
              

            }
            .onReceive(timer, perform: { _ in
    
                withAnimation{
                    print("current page is",currentPage)
                    currentPage = currentPage < 4 ? currentPage + 1 : 0
                    if currentPage == 2{
                        
                       // self.timer.upstream.connect().cancel()
                       // login.showGetbutton.toggle()
                    }
                    
                }
                       })
            
//            Button {
//            
//                self.pushtonextview.toggle()
//            } label: {
//              Text("Skip")
//                    .padding(8)
//                    .padding([.trailing,.leading],100)
//                    .background(Color(hex: 0xFA6109))
//                    .foregroundColor(Color.white)
//                   
//                    .textButton()
//                  
//                }
        }
        .frame(width: screenSize.width*1, height: screenSize.height*0.1, alignment: .center)
    }
}
struct PageIndicator_Previews2: PreviewProvider {
    static var previews: some View {
        PageIndicator()
    }
}
