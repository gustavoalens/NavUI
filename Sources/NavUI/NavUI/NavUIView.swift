import SwiftUI

public struct NavUIView<Item: IdentifiableView, Nav: NavGator>: View {
    let root: Item
    @StateObject var navGator: Nav
    
    public init(navGator: Nav, root: Item) {
        self.root = root
        _navGator = StateObject(wrappedValue: navGator)
    }
    
    public var body: some View {
        NavigationStack(path: $navGator.path) {
            root.destination
                .navigationDestination(for: Item.self) { item in
                    item.destination
                }
                .sheet(item: Binding<Item?>(
                    get: { navGator.presenting as? Item },
                    set: { newValue in navGator.presenting = newValue }
                )) { item in
                    item.destination
                }
        }
    }
}
