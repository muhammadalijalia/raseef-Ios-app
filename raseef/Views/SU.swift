//import SwiftUI
//import Combine
//
//class ViewModel: ObservableObject {
//  // MARK: - Input
//    @Published var searchTerm: String = ""
//  
//  // MARK: - Output
//    @Published private(set) var result: [ShopsRequest.Docs] = []
//    @Published var isSearching = false
//  
//  // MARK: - Private
//    private var cancellables = Set<AnyCancellable>()
//    @Published var debouncedText = ""
//    @Published var searchText = ""
//    private var subscriptions = Set<AnyCancellable>()
//        
////        init() {
////            $searchText
////                .debounce(for: .seconds(1), scheduler: DispatchQueue.main)
////                .sink(receiveValue: { [weak self] t in
////                    self?.debouncedText = t
////                } )
////                .store(in: &subscriptions)
////        }
//
//  
//
//}
//
//struct SU: View {
//   // @ObservedObject var coffeeVM = ViewModel()
//    @ObservedObject var VM = GetShops_List()
//    private var cancellable1: AnyCancellable? = nil
//    private var subscriptions1 = Set<AnyCancellable>()
//    @State var st: String = ""
//    @State var debouncedText = ""
//    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
// 
//    var body: some View {
//        NavigationView {
//            //Text("dasdas")
//             //maybe id change by _id in model
//             List(VM.doc, id: \.id) { shop in
//                HStack {
//                    let u = URL(string: shop.logo)
//                     AsyncImage(url: u
//                               , content: { image in
//                        image.resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(maxWidth: 100)
//                    }, placeholder: {
//                        ProgressView()
//                    })
//                    Text(shop.name)
//                }
//            }
//             .listStyle(.plain)
//             .searchable(text: $st)
//               
//                .onChange(of: st) { value in
//                   Task {
//                        if !value.isEmpty &&  value.count > 2 {
//                            await
//                            
//                            VM.getshops(name:value)
//                        } else {
//                           VM.doc.removeAll()
//                        }
//                    }
//                }
//             
//            
//                .navigationTitle("Shops")
//        }
////        VStack(spacing: 0) {
////            VStack(alignment: .leading) {
////                Text("Coffees")
////                    .font(.largeTitle)
////                    .fontWeight(.bold)
////
////                Text("Browse our selection of the finest coffees")
////            }
////
////            VStack(alignment: .leading) {
////
////                HStack{
////                    Button{
////                      //  VM.getshops()
////                        //coffeeVM.search()
////                      //  print(coffeeVM.searchText)
////                    }label:{
////
////                       Image(systemName: "magnifyingglass")
////                            .resizable()
////                            .frame(width: 20, height: 20)
////                    }
////                    TextField("Search", text: $VM.searchText)
////                        .onChange(of: VM.searchText)
////                    {
////                        t in
////                        VM.getshops()
////                    }
////
////
////                        .font(.body)
////                        .padding()
////                        .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 0.2662717301)))
////                        .cornerRadius(20)
//////                            .onChange(of: VM.searchText) { text in
//////                                VM.getshops()
//////                            }
////                }
////
////            }
////            .padding(.horizontal, 50)
////
////
////        }
//    }
//}
//struct SU_Previews: PreviewProvider {
//    static var previews: some View {
//        SU()
//    }
//}
