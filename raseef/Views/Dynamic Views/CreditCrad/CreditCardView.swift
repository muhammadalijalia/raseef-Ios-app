import SwiftUI

struct CreditCardView<Content>: View where Content: View {
    
    var content: () -> Content
    
    var body: some View {
        content()
    }
}


struct CreditCardFront: View {
    
    let name: String
    let expires: String
    let cardNo: String
    @ObservedObject var payment_vm = PaymentViewModel()
    @State var yearinString = ""
    var body: some View {
        
      
            VStack(alignment: .leading) {
                
                HStack(alignment: .top) {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(Color.white)
                
                    Spacer()
                    
                    Text("visa")
                        .foregroundColor(Color.white)
                        .font(.system(size: 24))
                        .fontWeight(.bold)
                        .textCase(.uppercase)
                
                }
                
                Spacer()
                HStack{
                    Text("**** **** **** "+("1234"))
                }
                    .foregroundColor(Color.white)
                    .font(.system(size: 32))
                
                Spacer()
                
                HStack {
                    
                    VStack(alignment: .leading) {
                        Text("CARD HOLDER")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(Color.gray)
                        
                        Text("Osama")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                        
                    }
                    
                    Spacer()
                    
                    VStack {
                        Text("EXPIRES")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(Color.gray)
                            .onAppear{
                                
                
                            }
                        HStack{
                            Text("12/34")
                        }
                   
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                    }
                    
                }
                
                
                
            }.frame(width: 300, height: 200)
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.5481430292, green: 0, blue: 0.4720868468, alpha: 1)), Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(10)
        
      
    }
}


struct CreditCardBack: View {
    
    let cvv:String
    
    var body: some View {
        VStack {
           
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 20)
                .padding([.top])
            
            Spacer()
            
            HStack {
                
                Text(cvv).foregroundColor(Color.black)
                    .rotation3DEffect(
                        .degrees(180),
                        axis: (x: 0.0, y: 1.0, z: 0.0))
                    .padding(5)
                    .frame(width: 100, height: 20)
                    .background(Color.white)
                
                
                Spacer()
            }.padding()
            
        }.frame(width: 300, height: 200)
        .background(LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.blue]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
        .cornerRadius(10)
    }
}


struct CreditCardView_Previews1: PreviewProvider {
    static var previews: some View {
        CreditCardView<CreditCardFront>(content: { CreditCardFront(name: "Mohammad Azam", expires: "02/06",cardNo: "1234") })
    }
}
