//
//  ConnectingPaypalView.swift
//  raseef
//
//  Created by Teamx tec on 26/12/2022.
//

import SwiftUI

struct ConnectingPaypalView: UIViewControllerRepresentable {
    typealias UIViewControllerType = ViewController

    func makeUIViewController(context: Context) -> ViewController {
      
       
           let vc = ViewController()
           // Do some configurations here if needed.
        
           return vc
       }
    
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
        // Updates the state of the specified view controller with new information from SwiftUI.
    }
}


struct ConnectingPaypalView_Previews: PreviewProvider {
    static var previews: some View {
        ConnectingPaypalView()
    }
}
