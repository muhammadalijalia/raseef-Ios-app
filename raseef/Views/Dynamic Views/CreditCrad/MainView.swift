
import SwiftUI

struct MainView: View {
    
    @State private var degrees: Double = 0
    @State private var flipped: Bool = false
    
    @State private var name: String = ""
    @State private var expires: String = ""
    @State private var cvv: String = ""
    
    @State var Exp_mm :String = ""
    @State var Exp_yy :String = ""
    var body: some View {
        VStack {
           CreditCardView {
                
                VStack {
                    Group {
                        if flipped {
                            CreditCardBack(cvv: cvv)
                        } else {
                            CreditCardFront(name: name, expires: expires,cardNo: "1234")
                        }
                    }
                }.rotation3DEffect(
                    .degrees(degrees),
                    axis: (x: 0.0, y: 1.0, z: 0.0)
                )
                
            }
            .onTapGesture {
                withAnimation {
                    degrees += 180
                    flipped.toggle()
                }
            }
            
            TextField("Name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding([.top,.leading,.trailing])
            
            TextField("Expiration", text: $expires)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding([.leading,.trailing])
            
            TextField("CVV", text: $cvv) { (editingChanged) in
                withAnimation {
                    degrees += 180
                    flipped.toggle()
                }
            } onCommit: {}
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding([.leading,.trailing])
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
       MainView()
    }
}
