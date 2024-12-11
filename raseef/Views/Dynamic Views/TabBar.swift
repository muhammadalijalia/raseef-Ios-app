//import SwiftUI
//
//struct TabBar: View {
//
//    var body: some View {
//        VStack {
//            Spacer()
//           
//            Curve()
//                .frame(height: 80)
//                .foregroundColor(Color.customBackground)
//                .overlay{
//                    
//                    
//                    TabShape()
//                        .fill(Color.white)
//                        .frame(height: 80)
//                        .shadow(color: Color.black.opacity(1), radius: 2, x: 2, y: -1)
//                        .overlay(
//                            
//                            Button(action: {}, label: {
//                                Text("")
//                                    .frame(width: 60, height: 60, alignment: .center)
//                                    .background(Color.blue)
//                                    .cornerRadius(30)
//                            }).offset(x: 0, y: -36)
//                        )
//                    
//                }
//        }.ignoresSafeArea()
//      
//       
//    }
//}
//struct Curve: Shape {
//    func path(in rect: CGRect) -> Path {
//        let h = rect.maxY * 0.7
//        return Path {
//            $0.move(to: .zero)
//            $0.addLine(to: CGPoint(x: rect.midX / 2.0, y: rect.minY ))
//            $0.addCurve(to: CGPoint(x: rect.midX, y: h), control1: CGPoint(x: rect.midX * 0.8, y: rect.minY), control2: CGPoint(x: rect.midX * 0.7, y: h))
//            $0.addCurve(to: CGPoint(x: rect.midX * 3.0 / 2.0, y: rect.minY), control1: CGPoint(x: rect.midX * 1.3, y: h), control2: CGPoint(x: rect.midX * 1.2, y: rect.minY))
//            $0.addLine(to: CGPoint(x: rect.maxX , y: rect.minY ))
//        }
//    }
//}
//struct TabShape: Shape {
//
//    private enum Constants {
//        static let cornerRadius: CGFloat = 20
//        static let buttonRadius: CGFloat = 3333330
//        static let buttonPadding: CGFloat = 10
//    }
//
//    func path(in rect: CGRect) -> Path {
//        let path = UIBezierPath()
//
//        path.move(to: .init(x: 0, y: rect.height))
//        path.addLine(to: .init(x: 0, y: rect.height - Constants.cornerRadius))
//        path.addArc(withCenter: .init(x: Constants.cornerRadius, y: Constants.cornerRadius), radius: Constants.cornerRadius, startAngle: CGFloat.pi, endAngle: -CGFloat.pi/2, clockwise: true)
//
//        let lineEnd = rect.width/2 - 2 * Constants.buttonPadding - Constants.buttonRadius
//        path.addLine(to: .init(x: lineEnd, y: 0))
//        path.addArc(withCenter: .init(x: lineEnd, y: Constants.buttonPadding), radius: Constants.buttonPadding, startAngle: -CGFloat.pi/2, endAngle: 0, clockwise: true)
//        path.addArc(withCenter: .init(x: rect.width/2, y: Constants.buttonPadding), radius: Constants.buttonPadding + Constants.buttonRadius, startAngle: CGFloat.pi, endAngle: 0, clockwise: false)
//
//        let lineStart = rect.width/2 + 2 * Constants.buttonPadding + Constants.buttonRadius
//        path.addArc(withCenter: .init(x: lineStart, y: Constants.buttonPadding), radius: Constants.buttonPadding, startAngle: CGFloat.pi, endAngle: -CGFloat.pi/2, clockwise: true)
//
//        path.addLine(to: .init(x: rect.width - Constants.cornerRadius, y: 0))
//        path.addArc(withCenter: .init(x: rect.width - Constants.cornerRadius, y: Constants.cornerRadius), radius: Constants.cornerRadius, startAngle: -CGFloat.pi/2, endAngle: 0, clockwise: true)
//        path.addLine(to: .init(x: rect.width, y: rect.height))
//        path.close()
//
//        return Path(path.cgPath)
//    }
//}
//
//struct TabBar_Previews: PreviewProvider {
//    static var previews: some View {
//        TabBar()
//    }
//}
