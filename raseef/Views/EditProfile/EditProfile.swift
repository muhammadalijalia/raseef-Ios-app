//
//  EditProfile.swift
//  raseef
//
//  Created by Teamx tec on 18/11/2022.
//

import SwiftUI

struct EditProfile: View {
    @State var navbarhome = false
    @State var navbarprofile = false
    @State var navbarshop = false
    @State var navbarnotify = false
    @State var name = ""
    @State var email  = ""
    @State var mobile_no = ""
    @State var password = ""
    @State var carPlateNo = ""
    var body: some View {
    

        NavigationView {
            ScrollView{
                ZStack(alignment: .top) {
                    Color.white
                    
                    
                    VStack(spacing:20){
                    
                        
                        
                        
                        VStack(alignment:.leading, spacing:5){
                            Text("Full Name")
                            
                            HStack(spacing:10){
                                Image(systemIcon: .person)
                                    .resizable()
                                    .frame(width:20,height:20)
                                    .foregroundColor(Color.orange)
                                
                                TextField("Jenna",text:$name)
                                
                                

                            }
                            Divider().frame(height: 1)
                                .background(.gray)
                        }
                        
                        VStack(alignment:.leading, spacing:5){
                            Text("Email Address")
                            
                            HStack(spacing:10){
                                Image(icon: .email_rate)
                                    .resizable()
                                    .frame(width:20,height:20)
                                    .foregroundColor(Color.orange)
                                
                                TextField("abc@gmail.com",text:$email)
                                
                                    .keyboardType(.emailAddress)
                                     .textContentType(.emailAddress)
                                     .disableAutocorrection(true)
                                     .autocapitalization(.none)

                            }
                            Divider().frame(height: 1)
                                .background(.gray)
                        }
                        VStack(alignment:.leading, spacing:5){
                            Text("Mobile Number")
                            
                            HStack(spacing:10){
                                Image(icon: .phone_call_orange)
                                    .resizable()
                                    .frame(width:20,height:20)
                                    .foregroundColor(Color.orange)
                                
                                TextField("+9716367378488",text:$mobile_no)
                                    .keyboardType(.numberPad)
                            
                                     .disableAutocorrection(false)
                                     .autocapitalization(.none)
                                

                            }
                            Divider().frame(height: 1)
                                .background(.gray)
                            
                        }
                        VStack(alignment:.leading, spacing:5){
                            Text("Password")
                            HStack(spacing:10){
                                Image(icon: .lock)
                                    .resizable()
                                    .frame(width:20,height:20)
                                    .foregroundColor(Color.orange)
                                
                                SecureField("*****",text:$name)
                           
                                     .textContentType(.password)
                                     .disableAutocorrection(false)
                                     .autocapitalization(.none)
                                Button{}label:{
                                    
                                    Text("change")
                                        .underline()
                                }
                                .foregroundColor(Color.orange)
                                
                                

                            }
                            Divider().frame(height: 1)
                                .background(.gray)
                        }
                        
                        VStack(alignment:.leading, spacing:5){
                            Text("Car Plate Number")
                            HStack(spacing:10){
                                Image(icon: .car_plate_number)
                                    .resizable()
                                    .frame(width:20,height:20)
                                    .foregroundColor(Color.orange)
                                
                               TextField("CVBD-5367",text:$carPlateNo)
                                
                                

                            }
                            Divider().frame(height: 1)
                                .background(.gray)
                        }
                        
                        VStack(alignment:.leading, spacing:5){
                            Text("Add car Image (Optional)")
                            
                            Rectangle()
                                .strokeBorder(style: StrokeStyle(lineWidth: 1, dash: [10], dashPhase: 0.0))
                                .frame(height: 150)
                                .overlay(
                                    Button{}label:{
                                        Image(icon: .plus_with_orange)
                                            .resizable()
                                            .frame(width:70,height:70)
                                    }
                              
                                )
                       
                        }
                   
                        
                        
                        
                        
                    }
                    
                    .padding(.horizontal, 30)
                    .padding(.top, 90)
                    .toolbar{
                        
                        ToolbarItem(placement: .principal)
                        {
                           
                            ZStack{
                               
                                Image(icon: .navbar)
                                    .resizable()
                                   
                                    .frame(width:UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.3)
                                    .cornerRadius(30, corners: [.bottomRight, .bottomLeft])
                                    .ignoresSafeArea()
                                    .padding(.bottom, 25)
                                 
                                    .overlay(
                                        HStack{
                                            
                                            Image(icon: .leftArrow)
                                            Spacer()
                                            Text("Edit Profile")
                                                .font(.system(size: 18))
                                            Spacer()
                                        }
                                            .foregroundColor(Color.white)
                                            .padding(.horizontal,30)
                                            .padding(.top, 20)
                                            .overlay(
                                                Image(icon: .profile_img)
                                                    .resizable()
                                                    .frame(width: 100, height: 100)
                                                    .clipShape(Circle())
                                                                .shadow(radius: 10)
                                                                .overlay(Circle().stroke(Color.white, lineWidth: 5))
                                                                .offset(x:0,y:100)
                                                
                                                                .overlay(
                                                                    Image(icon: .camera_with_bg)
                                                                        .resizable()
                                                                        .frame(width:30,height:30)
                                                                        .offset(x:30,y:145)
                                                                
                                                                )
                                            )
                                    )
                            }
                        }
                        
                    }
                  // .ignoresSafeArea(.keyboard)
                   // .adaptsToKeyboard()
                }
            }
           
             
        
        }
    }
}

struct EditProfile_Previews1: PreviewProvider {
    static var previews: some View {
        EditProfile()
    }
}
