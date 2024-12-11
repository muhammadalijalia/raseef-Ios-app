//
//  Onboarding.swift
//  raseef
//
//  Created by Teamx tec on 12/10/2022.
//

import SwiftUI

//class Login : ObservableObject{
//    
////    @Published var pushtologinview : Bool
////    init(pushtologinview: Bool){
////           self.pushtologinview = pushtologinview
////       }
//}
struct Onboarding: View {
    let screenSize = UIScreen.main.bounds;
    public var timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    @State private var selection = 0
    let images  = ["1","2","3","4"]
   
@State var showGetbutton = false
    //@ObservedObject var login : Login = Login(pushtologinview: false)
  //  @State var pushtologinview = false
    var body: some View {
     
        
            ZStack{
               
                TabView(selection : $selection){

                    ForEach(0..<4)
                    { i in
                               if (i == 0)
                               {
                                   Onboarding_1()
                                       //.gesture(DragGesture())
                                       .onAppear{

                                          // self.showGetbutton = false
                                       }

                               }
                               else if(i == 1)
                               {
                                   
                                   Onboarding_2()
                                       .onAppear{

                                         //  self.showGetbutton = false
                                       }
                               }
                               else if(i == 2)
                               {
                                   
                                   Onboarding_3()
                                       .onAppear{

                                           //self.pushtologinview.toggle()
                                       }
                               }
                               else if(i == 3)
                               {
                                 //  UserDefaults.standard.set(i, forKey: "i")
                                   Onboarding_4()
                                       .gesture(DragGesture())
                               }


                           }
                 
      }
               
                .frame(width: .infinity, height: .infinity, alignment: .center)
       .edgesIgnoringSafeArea(.all)

                     .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
    //
    //
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
    //
    //                   .id(selection)
//            .onReceive(timer, perform: { _ in
//
//                           withAnimation{
//                               print("selection is",selection)
//                               selection = selection < 4 ? selection + 1 : 0
//
//                             
//                                   
//                                 //  self.showGetbutton = true
////                               let i = UserDefaults.standard.integer(forKey: "i")
////
////                               if i == 3 {
////                                   self.timer.upstream.connect().cancel()
////
////                               }
//                               
//                               
//                               
//                               if selection > 4{
//                                  // self.showGetbutton.toggle()
//                                  self.timer.upstream.connect().cancel()
//                               }
////                               if login.pushtologinview{
////                                   
////                                   self.timer.upstream.connect().cancel()
////                               }
//
//                           }
//                       })
                      // .padding(.bottom,200)
                      
                         
                             
//                               VStack{
//                                   //PageIndicator()
//                                   Button{
//                                     self.pushtologinview.toggle()
//
//                                   }label:{
//
//                                       if showGetbutton{
//
//                                           Text("Get Started")
//                                               .frame(maxWidth:300)
//                                               .filledButton()
//                                       }
//                                      else{
//                                           Text("Skip")
//                                               .frame(maxWidth:300)
//                                               .filledButton()
//                                      }
//
//                                   }
//                 .fullScreenCover(isPresented: $pushtologinview, content:  LoginView.init)
//                               } .padding(.top,490)
                              
                    
            }
            
        
    
        
        
      
        
    }
}

struct Onboarding_Previews1: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
