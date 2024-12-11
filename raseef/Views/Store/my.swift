

////
////  my.swift
////  raseef
////
////  Created by Teamx tec on 01/12/2022.
////
//
//import SwiftUI
//struct Box: Identifiable  {
//    var id: Int
//    var title: String
//}
//
//
//
//struct my: View {
//    let boxes:[Box] = [
//    Box(id: 0, title: "Home"),
//    Box(id: 1, title: "Subjects"),
//    Box(id: 2, title: "attendence")
//    ]
// // @Binding var showMenu: Bool
//  @State var selected = 0    // 1
//  var body: some View{
//    VStack {
//      ScrollView(.horizontal,showsIndicators: false){
//        VStack{
//          ForEach(boxes, id: \.id) { box in
//            BoxView1(box: box, selectedBtn: self.$selected)  // 2
//          }
//        }
//      }
//    }.padding()
//  }
//}
//
//struct BoxView1: View {
//  var box: Box
//  @Binding var selectedBtn: Int  // 3
//  var body: some View{
//    Button(action: {
//      self.selectedBtn = self.box.id
//    }){
//      Text(box.title)
//       .foregroundColor(.white)
//    }
//    .frame(width: 130, height: 50)
//    .background(self.selectedBtn == self.box.id ? Color.red : Color.blue)
//    .cornerRadius(25)
//    .shadow(radius: 10)
//    .padding(10)
//  }
//}
//struct my2: View {
//    @State var items: [String] = ["Visa", "MasterCard"]
//    @State var selected : String? // <-- Here
//    @State var  s = true
//    /////////////////////////////////////////
//    ///////////////////////////////////////
//    let dict3 = ["key1":["hy","oe"],"key2":["h","oe"],"key3":["1","2"]]
//
//
//    @State var myButtonsArray : [String] = []
//
//    @State var emptyDictionary = [String: Bool]()
//    @State var objectKeys = [String]()
//
//   @ObservedObject var ptlvm =  ProductTypeListViewModel()
//    var cnt = 0
//    var body: some View {
//
//
//       // ScrollView(.vertical, showsIndicators: false){
//
//            VStack{
//                ForEach(enumerating: ptlvm.dict3.keys.sorted(),id: \.self)
//                { keyInd, Keyvalue in
//                    HStack{
//                        Text("\(keyInd)")
//
//                        Text("\(Keyvalue)")
//                    }
//
//                    VStack(spacing: 17) {
//
//
//
//
//                      // button dict
//                        ForEach(0..<ptlvm.keycounter, id: \.self) { button in
//
////                            if button  <= String(ptlvm.keycounter)
////                            {
////
////                            }
//
//                            Button(action: {
//                                let btn = self.ptlvm.myButtonsArray2[keyInd]
//                               // print("\(button)")
//                               // print(self.ptlvm.emptyDictionary[btn] as Any)
//                                for i in ptlvm.emptyDictionary.keys.sorted(){
//                                   // print("My I \(i)")
//                                   // print("My dict kEY INDx \(keyInd)")
//                                     if ((keyInd == 0) && (i == "Button 1" || i == "Button 2")){
//
//                                        self.ptlvm.emptyDictionary[i] = false
//                                    }
//                                    else if((keyInd == 1) && (i == "Button 3" || i == "Button 4")){
//                                        self.ptlvm.emptyDictionary[i] = false
//                                    }
//                                    else if((keyInd == 2) && (i == "Button 5" || i == "Button 6"))
//                                    {
//                                        self.ptlvm.emptyDictionary[i] = false
//                                    }
//
//
//
//                                    print(self.ptlvm.emptyDictionary[i] as Any)
//                                }
////                                for k in ptlvm.dict3.keys.sorted(){
////
////                                   // print(dict3[k] as Any)
////                                    for n in 0..<ptlvm.dict3[k]!.count{
////                                      //  print(n)
////                                        print(ptlvm.dict3[k]?[n] as Any)
////
////
////                                    }
////
////                                }
//                                if ((keyInd == 0) && (button == 0 )){
//                                    self.ptlvm.emptyDictionary["Button 1"] = true
//                                }
//                                else if ((keyInd == 0) && ( button == 1)){
//                                    self.ptlvm.emptyDictionary["Button 2"] = true
//                                }
//                                else if ((keyInd == 1) && (button == 0 )){
//                                    self.ptlvm.emptyDictionary["Button 3"] = true
//                                }
//                                else if ((keyInd == 1) && (button == 1)){
//                                    self.ptlvm.emptyDictionary["Button 4"] = true
//                                }
//                                else if ((keyInd == 2) && (button == 0 )){
//                                    self.ptlvm.emptyDictionary["Button 5"] = true
//                                }
//                                else if ((keyInd == 2) && ( button == 1)){
//                                    self.ptlvm.emptyDictionary["Button 6"] = true
//                                }
//
//
////                                self.ptlvm.emptyDictionary["Button 2"] = true
//                                for i in ptlvm.emptyDictionary.keys.sorted(){
//                                    print(self.ptlvm.emptyDictionary[i] as Any)
//                                }
//                                //print(button)
//
//                            }, label: {
//                                Text("Button \(button)")
//
//                                    .fontWeight(.semibold)
//                            })
//                        }
//                        //                        ForEach(items, id: \.self) { item in
//                        //                            Button(action: {
//                        //                                let btn = self.ptlvm.myButtonsArray2[keyInd]
//                        //                                print(btn)
//                        //                                print(self.ptlvm.emptyDictionary[btn] as Any)
//                        //
//                        //                                self.selected = item  // <-- Here
//                        //                                //print("item \(item) tapped")
//                        //
//                        //                            }, label: {
//                        //                                Text(item)
//                        //                                    .foregroundColor(self.selected == item ? .blue: .black)  // <-- Here
//                        //                                    .fontWeight(.semibold)
//                        //                            })
//                        //                        }
//                    }
//
//                    Divider()
//                }
//
////                Text("dasd")
////                ForEach(ptlvm.emptyDictionary.keys.sorted(), id: \.self) { key in
////                    HStack {
////                        Text(key)
////
////
////                    }
////                }
//
//            }
//
//
////            ForEach(enumerating: ptlvm.dict.keys, id: \.self)
////            {_,_ in
////
////                          //  Text("(\(key),\(value))")
////                            Button{
////                                                self.s = false
////                                                //print(myButtonsArray)
////                                            }label:{
////                                                Text("\($0)")
////                                               // Image(systemName: self.s ? "circle":"circle.fill")
////                                            }
////                        }
//
//        //}
////        ScrollView(.horizontal, showsIndicators: false)
////        {
////
////            ForEach(enumerating: dict3.keys.sorted(), id: \.self)
////            { keyInd, Keyvalue in
//////                HStack{
//////                    Text("\(keyInd)")
//////                        .onAppear{
//////
//////
//////                           // for i in 0..<dict3.values.count{
//////                                self.myButtonsArray.append("Button \(keyInd)")
//////
//////                          //  }
//////                        }
//////                    Text("\(Keyvalue)")
//////                }
//////                .onAppear{
//////
//////                  //  print(keyInd)
//////                   // print(Keyvalue)
//////
//////
//////
//////
//////
//////
//////                }
//////                 VStack(spacing: 17) {
//////                    ForEach(items, id: \.self) { item in
//////                        Button(action: {
//////                            self.selected = item  // <-- Here
//////                            print("item \(item) tapped")
//////
//////                        }, label: {
//////                            Text(item)
//////                                .foregroundColor(self.selected == item ? .blue: .black)  // <-- Here
//////                                .fontWeight(.semibold)
//////                        })
//////                    }
//////                }
//////                 .onAppear{
//////                    //print(myButtonsArray)
//////
//////                   // for i in myButtonsArray{
//////                      //  print(i)
//////                       // self.emptyDictionary[myButtonsArray[String(i)]] = false
//////                   // }
//////                  //  print(emptyDictionary)
//////                }
//////                Divider()
////            }
////
////            ForEach(myButtonsArray.sorted(),id:\.self)
////            {
////                indx in
////
////                Button{
////                    self.s = false
////                    //print(myButtonsArray)
////                }label:{
////Text(indx)
////                   // Image(systemName: self.s ? "circle":"circle.fill")
////                }
//////                .onAppear{
//////
//////                    for i in(0..<(myButtonsArray.sorted()).count)
//////                    {
//////
//////                        self.emptyDictionary[myButtonsArray[i]] = false
//////                     //  print(i)
//////                       // dict["key"] = "value"
//////                      // print(self.emptyDictionary.keys.sorted())
//////                    }
//////                    for (key, value) in emptyDictionary.enumerated() {
//////                      print("(\(key),\(value))")
//////                    }
//////                        //print(Array(emptyDictionary.keys.sorted().enumerated()))
//////                    //dict sorted
//////                  //  let a = self.emptyDictionary.sorted {$0.key < $1.key}
//////                  //  print(a)
//////                    let fruitsTupleArray = self.emptyDictionary.sorted { $0.key.localizedCompare($1.key) == .orderedAscending  }
//////                    print(fruitsTupleArray)
//////                }
////
////            }
//////            ForEach(enumerating: emptyDictionary.keys.sorted(),id: \.self)
//////            { (key, value) in
//////
//////                Text("(\(key),\(value))")
//////            }
//////            ForEach(Array(emptyDictionary.keys.sorted().enumerated()), id:\.0) { _, element in
//////
//////                Text(element)
//////
//////
//////            }
////        }
//
//
//        .padding(.vertical)
//        .onAppear{
//
//            Task
//            {
//                await
//
//                ptlvm.products(slug: "blush-on-facial-care---ny")
//
//            }
//        }
//
//
//    }
//}
////struct my: View {
////    @ObservedObject var productType = ProductTypeListViewModel()
////    let dict = ["key1": "value1", "key2": "value2"]
////    let dict3 = ["key1":["hy","oe"],"key2":["h","oe"]]
////    let dict2 = ["key1":["hy","oe"],"key2":["h","oe"]]
////    var body: some View {
////
////        List {
////
////            ForEach(enumerating: dict3.keys.sorted(), id: \.self) { keyInd, Keyvalue in
//////                Section(header: Text("\(value)")) {
//////                           //Text("\(key)")
//////                       }
////                Text("\(Keyvalue)")
////                Text("\(dict3[Keyvalue])" as String)
////
////
////                ForEach(0..<dict3.keys.count,id: \.self)
////                {
////                    indx in
////                    Text("\(indx)" as String)
////
////                    Text("\(dict3[Keyvalue]?[indx])" as String)
////
////                }
//////                ForEach(enumerating: Array(dict3), id: \.0) { (_, elem) in
//////                    //elem is a (key, value) pair
//////
//////
//////                    Text("\(elem.value[0])" as String)
//////
//////
//////                }
////
////
////
////                   }
////
//////            ForEach(dict2.keys.sorted(), id:\.self)
//////            { index in
////
//////
//////                ForEach(enumerating: Array(dict2), id: \.0) { (_, elem) in
//////                    //elem is a (key, value) pair
//////
//////
//////                    Text("\(elem.value[1])" as String)
//////
//////                }
////
////                //Text("Game \(index): \(String(describing: dict2[index]![1])) ")
////                               // }
////                             }
////               }
////
////    }
//
//

import SwiftUI
struct my: View {
    @ObservedObject var productType = ProductTypeListViewModel()
    @State var extra = 0
    @State var ex = 0
    @State var checkRadioList : [Variations] = []
    
    func call(){
        self.ex += 1
    }
    var body: some View{
        VStack {
            
            ForEach(enumerating: (productType.slugDict.keys.sorted()), id: \.self)
            { key,keyvalue in
                
                
                
                Text("\(keyvalue)")
                
                
                ForEach(0..<productType.slugDict[keyvalue]!.count,id:\.self)
                {
                    v in
                    
                    Button{
                        
                        
                        
                        
                        
                        // option id
                        let select_OpId = (productType.slugDict[keyvalue]?[v].id ?? "")
                        
                        //option att id
                        let select_AtId = (productType.slugDict[keyvalue]?[v].attribute?.id)
                        //print(select_AtId)
                        
                        
                        if checkRadioList.isEmpty{
                            
                            self.checkRadioList.append(productType.slugDict[keyvalue]?[v] as Any as! Variations)
                            // self.showimg = true
                        }
                        
                        
                        else if(checkRadioList.isEmpty == false)
                        {
                            for i in 0..<checkRadioList.count{
                                
                                let array_select_Id = self.checkRadioList[i].id
                                if(select_OpId == array_select_Id)
                                {
                                    print("No Work")
                                    
                                    self.extra = 0
                                    
                                    break
                                }
                                // agr yaha not equal wali cond likhi wo usme jakr kam kerdega or loop nh chelega secnd time agr chal gya tu double entry kredega
                                self.extra += 1
                            }
                            if  self.extra == 0{print("no need to check it")}
                            else{
                                for i in 0..<checkRadioList.count{
                                    
                                    var array_AtId = self.checkRadioList[i].attribute?.id
                                    if(select_AtId == array_AtId)
                                    {
                                        self.checkRadioList.remove(at: i)
                                        self.checkRadioList.append(productType.slugDict[keyvalue]?[v] as Any as! Variations)
                                        //self.showimg = true
                                        self.extra = 0
                                        break
                                    }
                                    self.extra += 1
                                    // agr yaha not equal wali cond likhi wo usme jakr kam kerdega or loop nh chelega secnd time agr chal gya tu double entry kredega
                                }
                                
                            }
                            
                            
                            if (self.extra != 0){
                                self.checkRadioList.append(productType.slugDict[keyvalue]?[v] as Any as! Variations)
                                // self.showimg = true
                                
                            }
                            
                            
                        }
                        
                        
                        
                        
                        var b = ""
                        
                        
                        
                        
                        
                        
                        
                        
                        
                    }
                label:{
                    HStack{
                        
                        if (self.checkRadioList.isEmpty){
                            
                            Image(systemName: "circle")
                                .foregroundColor(Color.black)
                            
                        }
                        else if(self.checkRadioList.count != 0){
                            ForEach(0..<checkRadioList.count,id:\.self)
                            { indx in
                                if (self.checkRadioList[indx].id == (productType.slugDict[keyvalue]?[v].id ?? ""))
                               {
                                    Image(systemName:  "circle.circle")
                                    
                                        .foregroundColor(Color.yellow)
                                    
                                }
                                else{
                                    Text("")
                                        .onAppear{
                                            self.call()
                                        }
                                    
                                }
                           
                            
                          
//                                else{
//                                    Image(systemName: "circle")
//
//                                        .foregroundColor(Color.orange)
//
//                                }
                            }
                          
                            if (self.ex != 0) {
                                
                                Image(systemName: "circle")
                            }
                            else{
                              Text("dasd")
                            }
                        }
                       
                        
                    }
                    
                }
                }
                
            }
        }
           .onAppear{
            
            Task
            {
                await
                
                productType.products(slug: "blush-on-facial-care---ny")
                
            }
        }
        
        
    }
   
}
struct my_Previews1: PreviewProvider {
    static var previews: some View {
        my()
    }
}
