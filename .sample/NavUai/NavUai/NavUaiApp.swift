//
//  NavUaiApp.swift
//  NavUai
//
//  Created by Gustavo Alencar Silva on 27/06/24.
//

import SwiftUI

@main
struct NavUaiApp: App {
    var body: some Scene {
        WindowGroup {
          MainCoordinator().start().background(Color.white)
        }
    }
}
