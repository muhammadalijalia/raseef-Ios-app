//import SwiftUI
//import MapKit
//
////struct MapView: UIViewRepresentable {
//
//    @Binding var centerCoordinate: CLLocationCoordinate2D
//    @Binding var selectedPlace: MKPointAnnotation?
//    @Binding var showingPlaceDetails: Bool
//    @Binding var currentLocation : CLLocationCoordinate2D
//
//    var annotations: [MKPointAnnotation]
//
//    func makeUIView(context: Context) -> MKMapView {
//        let mapView = MKMapView()
//        mapView.delegate = context.coordinator
//        return mapView
//    }
//
//    func updateUIView(_ view: MKMapView, context: Context) {
//
//        if annotations.count != view.annotations.count {
//            view.removeAnnotations(view.annotations)
//            view.addAnnotations(annotations)
//        }
//
//        view.setCenter(currentLocation, animated: true)
//
//    }
//
//    func makeCoordinator() -> Coordinator {
//        Coordinator(self)
//    }
//
// class Coordinator: NSObject, MKMapViewDelegate{
//
//    var parent: MapView
//    init(_ parent: MapView) {
//        self.parent = parent
//    }
//
//    func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
//         parent.centerCoordinate = mapView.centerCoordinate
//     }
//
//     func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//         let identifier = "PlaceMark"
//         var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
//         if annotationView == nil {
//             annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
//             annotationView?.canShowCallout = true
//             annotationView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
//
//         } else {
//             annotationView?.annotation = annotation
//         }
//
//         return annotationView
//     }
//
//     func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
//         guard let placemark = view.annotation as? MKPointAnnotation else {return}
//         parent.selectedPlace = placemark
//         parent.showingPlaceDetails = true
//
//     }
//
//    }
//    
//    func getCurrentLocation() {
//
//        let lat = locationManager.lastLocation?.coordinate.latitude ?? 0
//        let log = locationManager.lastLocation?.coordinate.longitude ?? 0
//
//        self.currentLocation.latitude = lat
//        self.currentLocation.longitude = log
//
//    }
//    
//    var body: some View {
//        
//        ZStack{
//
//                  MapView(centerCoordinate: $centerCoordinate, selectedPlace: $selectedPlace, showingPlaceDetails: $showingPlaceDetails, currentLocation: $currentLocation ,  annotations: locations)
//                 // MapView(centerCoordinate: $centerCoordinate, selectedPlace: $selectedPlace, showingPlaceDetails: $showingPlaceDetails, annotations: locations)
//                      .edgesIgnoringSafeArea(.all)
//                  VStack{
//                      Spacer()
//                      HStack{
//                          Spacer()
//                          Button(action: {
//                              self.getCurrentLocation()
//                          }){
//                              ButtonIcon(icon: "location.fill")
//                          }
//                      }
//                      .padding()
//                  }
//              }
//              .onAppear(perform: getCurrentLocation)
//    }
//    
//}
