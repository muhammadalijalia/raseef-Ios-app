//
//  ProductTypeListViewModel.swift
//  raseef
//
//  Created by Teamx tec on 29/11/2022.
//


import UIKit
import Foundation
import SwiftUI
import SwiftUIX
extension Array where Element: Hashable {
    func removingDuplicates() -> [Element] {
        var addedDict = [Element: Bool]()

        return filter {
            addedDict.updateValue(true, forKey: $0) == nil
        }
    }

    mutating func removeDuplicates() {
        self = self.removingDuplicates()
    }
}
//@MainActor
class ProductTypeListViewModel: ObservableObject {
    @Published var groupedAttSlug = [String]()
  
    @Published var rad = []
    @Published var attSlug = [String]()
    @Published var variations = [Variations]()
    @Published var variationsOp = [VariationOptions]()
    @Published var attRadio :[String:[String]] = [:]
    ///
    @Published var dict3 = ["key1":["hy","oe"],"key2":["h","oe"],"key3":["1","2"]]

  //  @Published var emptyDictionary = [String: Bool]()
   // @Published  var myButtonsArray2  = [String]()
    
    @Published var dict = [String:Bool]()
    @Published var slugDict = [String:[Variations]]()
    @Published var keycounter = 0
    
    /////////////////////////////////////////////////////////////////

    @Published var id: String = ""
 
    @Published var rating: Double = 0

    @Published var image: String? = ""
    @Published var name: String? = ""

    @Published var slug: String? = ""
        

        @Published var description: String? = ""
    @Published var price: Int = 0

    @Published var reviewDate: String? = ""
    @Published var PaymentGateway: [String] = []
 ////////////////////////////////////////////////////////////
    @Published var option = []
    ///
    @Published var optionDict = [String:[Options]]()
    func products(slug: String) async {
        do {/////////
           ////////////////MY LOGIC
//            DispatchQueue.main.async {
//                var objectKeys2 = [String]()
//                for k in self.dict3.keys.sorted(){
//
//                   // print(dict3[k] as Any)
//                    for n in 0..<self.dict3[k]!.count{
//                      //  print(n)
//                       // print(dict3[k]?[n] as Any)
//                        objectKeys2.append((self.dict3[k]?[n])!)
//
//                    }
//
//                }
//
//                self.keycounter = ((self.dict3["key1"]?.count) ?? 0)
//               // print(keycounter)
//               // print(objectKeys2.count)
//                for p in 0..<objectKeys2.count
//                {
//                    self.myButtonsArray2.append("Button \(p+1)")
//                }
//                //6 Button Declare
//                ///print(myButtonsArray2)
//
//    //      Array to Dict
//                for i in 0..<(self.myButtonsArray2.count)
//                {
//
//                    if i == 5{
//                        self.emptyDictionary[myButtonsArray2[i]] = true
//                    }
//                    else
//                    {
//                        self.emptyDictionary[self.myButtonsArray2[i]] = false
//                    }
//                }
//
//
//                //self.emptyDictionary  = Dictionary(uniqueKeysWithValues: myButtonsArray2.map{ ($0, false) })
//
//
//                //print(dict)
//
//
//                //////////////// Array to Dict
//
//
//
//
//                //// SORTING
//    //            let fruitsTupleArray = dict.sorted { $0.key.localizedCompare($1.key) == .orderedAscending  }
//    //            print(fruitsTupleArray)
//                let sorted = self.emptyDictionary.sorted {$0.key < $1.key}  // or {$0.value < $1.value} to sort using the dictionary values
//               //print(sorted) // "[(key: "name1", value: "Loy"), (key: "name2", value: "Roy"), (key: "name3", value: "Tim"), (key: "name4", value: "Steve")]\n"
//                for element in sorted {
//                   // print("Key = \(element.key) Value = \(element.value)" )
//                  //  print("\(element.key) : \(element.value)" )
//                }
//                ////////////////MY LOGIC
//            }
     
            /////SORTING
            
            
            
            
        let product_type_simple = UserDefaults.standard.bool(forKey: "pushtoProductSimple")
          //true
            if (product_type_simple == true) {
            //stylish-women-blazer-5/6
            //laptop-bag-new-style
                let url = Constants.getProductBySlug + slug;

             let component = URL(string:url);
               guard let url = component else {
                        throw NetworkError.badURL
                    }

            let (data, _) = try await URLSession.shared.data(from: url)

              if let ProductResponse = try? JSONDecoder().decode(ProductsSimple.self, from: data)
                {





                  DispatchQueue.main.async {
                     // print(ProductResponse.welcomeDescription as Any)

                    //  print(shopResponse.id as Any)
                      self.id =  ProductResponse.id ?? "0"
                      self.PaymentGateway.append(contentsOf: ProductResponse.productOrderTypes ?? [])
                      //print(self.PaymentGateway)
                      self.image = ProductResponse.image ?? ""
                      self.name = ProductResponse.name ?? "Summer Sale"
                      self.slug = ProductResponse.slug  ?? "Laundary Basket | 1 km"
                      self.rating = Double(ProductResponse.ratings ?? 0)
                      self.price = ProductResponse.price ?? 0
                      self.description = ProductResponse.welcomeDescription  ?? "dsdasdasds"
                    //  print(self.id as Any)
                    //  print(self.slug as Any)
                     // print(self.rating)
                     // print(self.price as Any)
                  }





                     }
                    else
                    {
                        print("No response")
                        self.PaymentGateway = []

                    }
//            }
         //   else{
                //            ///
                            //blush-on-facial-care---ny
                //cyo-crush-on-blush-powder-blush
                          //  let url = Constants.getProductBySlug+slug;
//                let url = Constants.getProductBySlug+"cyo-crush-on-blush-powder-blush";
//                         let component = URL(string:url);
//                           guard let url = component else {
//                                    throw NetworkError.badURL
//                                }
//
//                        let (data, _) = try await URLSession.shared.data(from: url)
//
//                          if let shopResponse = try? JSONDecoder().decode(ProductsVariable.self, from: data)
//                            {
//                                    self.variationsOp = shopResponse.variationOptions ?? []
//                                    self.variations = shopResponse.variations ?? []
//
//                              print(self.variationsOp)
//
//                              for i in 0..<self.variationsOp.count{
//
//                                  self.option.append(self.variationsOp[i].options ?? [])
//                              }
//                              print(self.option)
//                              let s = "pink"
//
//                              for indx in 0..<variations.count{
//
//                                  self.variations[indx].check = false
//                              }
//                            //  print(variations)
//                             // self.variations.append("Boolcheck")
//
//                              let  a = Dictionary(grouping: variations, by: { return $0.attribute?.slug})
//                              self.slugDict = Dictionary(grouping: variations, by: { return ($0.attribute?.slug)!})
//                          //    print(slugDict)
//
//
                              
                              
//                              for c in 0..<slugDict.keys.count{
//
//
//                              }
//                              for key in slugDict.keys.sorted(){
//
//                                  print(key)
//                                  for value in 0..<slugDict[key]!.count{
//                                      print(value)
//                                     // slugDict["BoolCheck"] = false
//                                  }
//
//                              }
//
                              
                              
                              
                              
                              
                              
                              ///// NEW WORk
//                              for k in a.keys{
//                               ///   print((k ?? "Nil") as String)
//                                  var objectKeys = [String]()
//                                 // print(a[k]?.count)
//                                  for n in 0..<a[k]!.count{
//                                 //     print((a[k]?[n].value ?? "Nil") as String)
//                                      objectKeys.append((a[k]?[n].value)!)
//                                  }
//                                  attRadio.updateValue(objectKeys, forKey: k!)
//                              }
                             // print(attRadio)
                            
                          
                            //  var data : [String: [String:String]]

                           //   data = ["finish": ["attribute": "gloss"], "size": ["attribute": "medium"]]
                //   var array = data.map { $0.value }
                              //print(array)
                              //var arr = array.flatMap { $0.keys.first }

                              //print(arr)
                              //print(array[0][0].attribute?.name as Any)
                              //var arr = array.flatMap { $0.keys.first }

                              //print(arr)
                //              print(a["finish"] as Any)
                              //a.values.forEach {print($0)}
                             // print("\(String(describing: a["finish"]![0].value))") print particular key and value
                             
                          
                        
                                  //dictionary[key] = "value"
//                              for i in a.keys{
//                                //  print(i as Any)
//                                  self.groupedAttSlug.append(i as Any as! String )
//                                  for j in 0..<a[i]!.count {
//                                   //   print(a[i]?[j].attribute?.name as Any)
//                                      if i == a[i]?[j].attribute?.slug
//                                      {
//                                          self.rad.append( a[i]?[j].value as Any)
//                                      }
//                                     // print(a[i]?[j].value as Any)
//                                  }
//                           }
//                              for title in 0..<groupedAttSlug.count {
//                                 // print(groupedAttSlug[title])
//
//
//                              }
//                           //   print(groupedAttName)
//                          //    print(rad)
//                              for (key, value) in a.enumerated() {
//                                // print("(\(key),\(value))")
//                              }
//                              //print(a)
                //              for i in 0..<variations.count{
                //              a.values.forEach { v in
                //
                //                      print(v[i].value as Any)
                //                  }
                //              }
                        
                              //print(Array(a[0]))
//                              for (index, entry) in (a) {
//                               //   print(index as Any)   // 0       1        2
//                                  //print(entry.)   // (d, 45) (c, 123) (a, 456)
//                              }
//                              
//                //              for i in a{
//                //                  print(i)
//                //
//                //              }
//                              for i in  0..<variations.count {
//                                //  self.attName.append((variations[i].attribute?.slug ?? "Nil"))
//                                  
//                              }
//                              //sort
                              
                                  //remove duplicates
                            //  self.attName = self.attName.removingDuplicates()
                             // print(attName)
                              
                //              for i in 0..<variations.count{
                //                  print(self.variations[i].value)
                //
                //              }
                //              for i in 0..<variations.count{
                //                  print(self.variations[i].attribute?.name)
                //              }
                           
                              //qadeer logic but question here
                //              for i in 0..<attName.count{
                //
                //                  if attName[0] == self.variations[i].attribute?.name
                //                  {
                //                      self.radioOpt.append(self.variations[i].value)
                //                  }
                //              }
                //              print(radioOpt)
                //              for i in  0..<attName.count {
                //                  for v in 0..<variations.count{
                //                      if (self.attName[i] == self.variations[v].attribute?.name){
                //                          self.radioOpt.append((self.variations[v].value ?? "") as String)
                //
                //                      }
                //                      else
                //                      {
                //                          self.radioOpt2.append((self.variations[v].value ?? "") as String)
                //                        //  print(self.variations[v].value ?? "")
                //                      }
                //
                //
                //                  }}
                             // print(self.radioOpt)
                            //  print(self.radioOpt2)
                                }
                                else
                                {
                                    
                                    self.variationsOp = []
                                    self.variations = []
                                }
          //  }
            


               
        } catch {
            print(error)
            //self.docs = []
        }
    }
    
}
//func products2(shop_id: String)
//{
//    //0 6318a59c6937e0d2e791d94a //ok
//    //1 63170c0bbaf027ab6bd01b9f // ok
//    //2 63170251baf027ab6bd01434 // ok
//    //3 631701eabaf027ab6bd013f0 //ok
//        //https://api.teamxmv.com/api/products?shop=63170c0bbaf027ab6bd01b9f
//// let u = "https://api.teamxmv.com/api/products?shop=631701eabaf027ab6bd013f0"
//   let k = "https://api.teamxmv.com/api/products?shop="+shop_id;
//    let loginreq = Request();
//    loginreq.get(urlString: k)   {
//
//        (string) in
//
//
//        do {
//            let data = string.data(using: .utf8)!
//
//            do {
//
//                if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any] {
////                        for dict in json["docs"] as! Array<NSDictionary> {
////                            print(dict["name"] as! String)
////                            print(dict["slug"] as! String)
////                            print(dict["description"] as! String)
////                            print(dict["price"] as Any)
////                        }
//                    //let statusCode = json["statusCode"] as? Int ;
//                    //let error = json["error"] as? String;
//
//
//                        let myServiceResponse = try? JSONDecoder().decode(ProductsByShopsID.self, from: data)
//
//
//                       DispatchQueue.main.async {
//                         //  self.products = myServiceResponse?.docs ?? []
//
//                           self.docs = myServiceResponse?.docs ?? []
//                           //print(self.docs)
//                          }
//
//
//                    }}
//             catch let error {[
//                  print(error)
//
//
//
//
//
//                               ] }
//
//                            }
//
//                        }
//}
