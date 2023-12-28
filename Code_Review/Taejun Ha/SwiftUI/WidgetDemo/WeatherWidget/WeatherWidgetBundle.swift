//
//  WeatherWidgetBundle.swift
//  WeatherWidget
//
//  Created by Taejun Ha on 12/28/23.
//

import WidgetKit
import SwiftUI

@main
struct WeatherWidgetBundle: WidgetBundle {
    var body: some Widget {
        WeatherWidget()
        WeatherWidgetLiveActivity()
    }
}
