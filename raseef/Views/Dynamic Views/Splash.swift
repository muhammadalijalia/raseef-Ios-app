//
//  LoginView.swift
//  LoginTest02
//
//  Created by apple on 10/09/2022.
//


import SwiftUI

//import AlertToast
struct Splash: View {


    let screenSize = UIScreen.main.bounds.size;
 
 
    //@ObservedObject var networkcall : NetworkCall = NetworkCall()
    //@ObservedObject var LoginPostString = LoginRequest();
    
   var Onbard = Onboarding()
   // @FocusState private var focusedField: Field?
              
    @State var isActive:Bool = false
   
    var body: some View {

  

        VStack{
             if (self.isActive == true)
                {
                
                self.Onbard

                }
                else{
                    ScrollView(showsIndicators: false)
                    {
                   ZStack{
                       
                       Image(icon: .Splash)
                                   .resizable()
                                   .scaledToFill()
                                   .edgesIgnoringSafeArea(.all)
                                   .frame(width: screenSize.width,
                                                  height: screenSize.height, alignment: .top)
                                          
                                               
                       VStack{
                           
                           Image(icon: .splash_logo)
                                       .resizable()
                                       .scaledToFill()
                                       .frame(width: screenSize.width*0.3,
                                              height: screenSize.height*0.3, alignment: .top)
                                      
                           
                           
                       }
                        
                    }
               
                    }
                    .edgesIgnoringSafeArea(.all)
                
                    //.preferredColorScheme(.light)
                      //  .navigationBarHidden(true)
              
                    
                }
                
            }
        

              
      
                .onAppear(perform: {
                              self.gotoLoginScreen(time: 3)
                          })
    
    }
    func gotoLoginScreen(time: Double) {
           DispatchQueue.main.asyncAfter(deadline: .now() + Double(time)) {
               self.isActive = true
           }
       }
    
}
struct Splash_Previews2: PreviewProvider {
    static var previews: some View {
        Splash()
    }
}
