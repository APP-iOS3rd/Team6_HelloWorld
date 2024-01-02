//
//  ContentView.swift
//  MapDemo
//
//  Created by Taejun Ha on 1/2/24.
//

import SwiftUI
import MapKit
import CoreLocation

struct ContentView: View {
    
    @State private var position: MapCameraPosition = .automatic
    
    let locationManager = LocationManager()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            
            if let currentLocation = locationManager.currentLocation {
                Text("\(currentLocation.coordinate.latitude), \(currentLocation.coordinate.longitude)")
            }
            
            Text("Hello, world!")
            
            //            Map(initialPosition: .region(MKCoordinateRegion.init(center: CLLocationCoordinate2D(latitude: 37.57861, longitude: 126.97722), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))))
            
            
            //            Map(initialPosition: .item(MKMapItem(placemark: .init(coordinate: .gyeongbokgung))))
            
            Map(position: $position) {
                Marker("첫 번째 관광위치", systemImage: "square.and.arrow.up.circle",coordinate: .gyeongbokgung)
                    .tint(.blue)
                
                Annotation("두 번째 관광위치", coordinate: .gwanghwamun, anchor: .bottom) {
                    ZStack {
                        Circle()
                            .foregroundStyle(.indigo.opacity(0.5))
                            .frame(width: 100, height: 100)
                        
                        Image(systemName: "eraser")
                            .symbolEffect(.variableColor)
                            .padding()
                            .foregroundStyle(.white)
                            .background(.indigo)
                            .clipShape(Circle())
                    }
                }
            }
            //지도 스타일 변경
//            .mapStyle(.imagery(elevation: .realistic))
            .onAppear{
                position = .item(MKMapItem(placemark: .init(coordinate: .gyeongbokgung)))
            }
            .safeAreaInset(edge: .bottom) {
                HStack {
                    Button {
                        withAnimation {
                            position = .item(MKMapItem(placemark: .init(coordinate: .gyeongbokgung)))
                            
                            //                                3D 관점으로 보기
                            //                                position = .camera(MapCamera(centerCoordinate: .gyeongbokgung, distance: 500, heading: 100, pitch: 50))
                        }
                    } label: {
                        Text("경북궁")
                    }
                    .tint(.black)
                    .buttonStyle(.borderedProminent)
                    
                    Button {
                        withAnimation {
                            position = .item(MKMapItem(placemark: .init(coordinate: .gwanghwamun)))
                        }
                    } label: {
                        Text("광화문")
                    }
                    .tint(.black)
                    .buttonStyle(.borderedProminent)
                }
            }
        }
        .padding()
        .onAppear{
            //권한 요청 함수 호출
            locationManager.requestLocationPermission()
        }
    }
}

extension CLLocationCoordinate2D {
    static let gyeongbokgung = CLLocationCoordinate2D(latitude: 37.57861, longitude: 126.97722)
    static let gwanghwamun = CLLocationCoordinate2D(latitude: 37.576026, longitude: 126.9768428)
}

#Preview {
    ContentView()
}
