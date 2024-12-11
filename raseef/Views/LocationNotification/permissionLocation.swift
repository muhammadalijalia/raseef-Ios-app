//
//  permissionLocation.swift
//  raseef
//
//  Created by Teamx tec on 21/10/2022.
//

import SwiftUI
import PermissionsSwiftUI
struct permissionLocation: View {
    @State var showModal = false
    var body: some View {
        NavigationView{
            ZStack(alignment: .top) {
              //  NavigationLink("",destination: LoginView()
              //      .navigationBarHidden(true)
              //                 ,isActive: $pushtoLoginView)
                GeometryReader { reader in
                    Image(icon: .navbar)
                        .resizable()
                    
                        .frame(width: reader.size.width * 1,height: reader.size.height * 0.13, alignment: .top)
                        .ignoresSafeArea()
                        
                    
                }
                
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button{
                           // self.pushtoLoginView = true
                        }label:{
                            Image(icon: .leftArrow)
                                .font(.largeTitle.bold())
                                .foregroundColor(Color.white)
                        }
                        .padding(.top,10)
                    
                        
                    }
                }
                
                GeometryReader{geo in
                    
                    VStack(alignment:.center, spacing:12){
                  
                            Image(icon: .map_icon)
                                .resizable()
                                .frame(width: geo.size.width * 0.4, height: geo.size.height * 0.3,alignment: .center)
                        
                        
                        
                        
                      
                            
                            Text("\tFind Restaurants\nand Shops near you!")
                                .font(.custom(opensans: .italic1, style: .title1))
                                .foregroundColor(Color.black)
                               
                      
                        
                        
                        Text("We will need your location to\n give you better experience.")
                            .smallText()
                
                    
                     Button {
                    
                         self.showModal = true
                    
                    
             } label: {
                    
          Text("Allow Location")
                    
                   // .frame(maxWidth: .infinity)
             .frame(width: 290)
              .filledButton()
              .padding(.leading,10)
                     
             }.padding(.top,20)
                            .JMModal(showModal: $showModal, for: [.locationAlways],onAppear: {}, onDisappear: {})
                      

                        //    .JMAlert(showModal: $showModal, for: [.locationAlways, .photo])
                            .setAccentColor(toPrimary: Color(.sRGB, red: 250/255, green: 97/255,
                                                              blue: 8/255, opacity: 1),
                                            toTertiary: Color(.systemPink))
                            .changeBottomDescriptionTo("If not allowed, you have to enable permissions in settings")
                            .changeHeaderDescriptionTo("Raseef need certain permissions in order for all the features to work.")
                            .changeHeaderTo("App Permissions")
                        
                        
                        
                    }
                  
                   .padding(.top,geo.size.height * 0.16)
                   .padding(.horizontal,geo.size.width * 0.125)
                 
                       
                       
                       
                       
                
                        
                        
                    
                    
                }
                
                
            }
            .onAppear{
                
               // self.showModal = false
            }
            
            
            
        }
    }
}

struct permissionLocation_Previews: PreviewProvider {
    static var previews: some View {
        permissionLocation()
    }
}
