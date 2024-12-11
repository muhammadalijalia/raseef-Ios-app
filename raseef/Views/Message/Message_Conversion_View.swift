//
//  Message_Conversion_View.swift
//  raseef
//
//  Created by Teamx tec on 16/11/2022.
//

import SwiftUI

struct Message_Conversion_View: View {
    @State var msg = ""
//    @ObservedObject private var keyboard = KeyboardResponder()
    @State private var name = "Taylor Swift"
        @FocusState var isInputActive: Bool
    var body: some View {
        NavigationView{
         
                ZStack{
                    VStack(spacing:0){
                        VStack{
                            Image(icon: .navbar)
                                .resizable()
                                
                              
                               
                             
                               
                                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.15)
                                .cornerRadius(30, corners: [.bottomRight, .bottomLeft])
                               .ignoresSafeArea()
                                .overlay(
                                    HStack(){
                                        
                                        Button{}label:{
                                            Image(icon: .leftArrow)
                                                .resizable()
                                                .frame(width: 15, height: 20)
                                        }
                                       
                                        
                                        Spacer()
                                     Text("MESSAGE")
                                            .font(.system(size: 22,weight: .bold))
                                            .foregroundColor(Color.white)
                                        Spacer()
                                        Text("MESSAGE")
                                            .hidden()
                                     
                                        
                                    }
                                        .foregroundColor(Color.white)
                                        .frame(width: 400,alignment: .leading)
                                        .padding(.leading,50)
                                     .padding(.vertical,-30)
    
                                )
                        }
                        
                      
                           
                        VStack(spacing:20){
                          
                            ScrollView{
                              
                              
                                    VStack {
                                            HStack(spacing: 18) {
                                                Image(icon: .shoplogo)
                                                    .resizable()
                                                    .scaledToFill()
                                                    .frame(width: 70, height: 70)
                                                    .cornerRadius(70)
                                                    .overlay(RoundedRectangle(cornerRadius: 70).stroke(lineWidth: 2))
                                                
                                                VStack(alignment:.leading,spacing: 5){
                                                    Text("StarBucks Coffee")
                                                        .font(.system(size:20,weight: .bold));                   Text("2 hours ago")
                                                }
                                                Spacer()
                                                Image(systemName: "homekit")
                                                    .resizable()
                                                    .frame(width: 30, height: 30)
                                            }
                                            .padding(.horizontal,25)
                                            
                                            
                                        }
                                    .foregroundColor(.label)
                               
                             Text("Saturday, March 14, 2022")
                                
                                HStack{
                                    
                                    Text("10:30 PM")
                                    
                                    
                                }
                            }
                        }
                       // .padding(.vertical,-20)
                                      
                                
   Spacer()
                        VStack{
                            TextField("",text:$msg)
                                .padding()
                                .textFieldStyle(.roundedBorder)
                                .focused($isInputActive)
                                
                        }.toolbar{
                            
                            ToolbarItemGroup(placement: .keyboard) {
                                                    Spacer()

                                                    Button("Done") {
                                                        isInputActive = false
                                                    }
                                                }
                            
                        
                        
                    }
                        
                            
                       
                    }
//                    .toolbar{
//                        ToolbarItem(placement:.bottomBar)
//                        {
////                            HStack{
////                                Image(systemName: "plus")
////                                    .resizable()
////                                    .frame(width: 30, height: 30)
//
//                                HStack{
//
//                                    TextField("",text:$msg)
//                                        .padding()
//                                        .border(.red, width: 2, cornerRadius: 20)
//                                        .ignoresSafeArea(.keyboard,edges:.bottom)
//                                }
//                          //  }
//
//                        }
//
//                    }.ignoresSafeArea(.keyboard,edges:.bottom)
                }
              
        
            
            
        }
    }
}
//final class KeyboardResponder: ObservableObject {
//    private var notificationCenter: NotificationCenter
//    @Published private(set) var currentHeight: CGFloat = 0
//
//    init(center: NotificationCenter = .default) {
//        notificationCenter = center
//        notificationCenter.addObserver(self, selector: #selector(keyBoardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
//        notificationCenter.addObserver(self, selector: #selector(keyBoardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
//    }
//
//    deinit {
//        notificationCenter.removeObserver(self)
//    }
//
//    @objc func keyBoardWillShow(notification: Notification) {
//        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
//            currentHeight = keyboardSize.height
//        }
//    }
//
//    @objc func keyBoardWillHide(notification: Notification) {
//        currentHeight = 0
//    }
//}
struct Message_Conversion_View_Previews: PreviewProvider {
    static var previews: some View {
        Message_Conversion_View()
    }
}
