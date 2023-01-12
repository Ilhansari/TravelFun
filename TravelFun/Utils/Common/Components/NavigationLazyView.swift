//
//  NavigationLazyView.swift
//  TravelFun
//
//  Created by Ilhan Sari on 12/01/2023.
//

import SwiftUI

struct NavigationLazyView<Content: View>: View {

    let build: () -> Content

    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
  
    var body: Content {
        build()
    }
}

struct NavigationLazyView_Previews: PreviewProvider {
    static var previews: some View {
      NavigationLazyView(EmptyView())
    }
}
