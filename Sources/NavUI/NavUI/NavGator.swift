import SwiftUI

public protocol NavGator: ObservableObject {
    associatedtype Item: IdentifiableView
    var path: NavigationPath { get set }
    var stack: [any IdentifiableView] { get set }
    var presenting: (any IdentifiableView)? { get set }
    
    func push(view: any IdentifiableView)
    func present(view: any IdentifiableView)
    func pop()
    func pop(to viewType: any IdentifiableView.Type)
    func popToRoot()
}

public extension NavGator {
    func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
        stack.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
        stack = []
    }
    
    func pop(to viewType: any IdentifiableView.Type) {
        guard let index = stack.firstIndex(where: { type(of: $0) == viewType }) else { return }
        path.removeLast(path.count - (index + 1))
        stack.removeLast(stack.count - (index + 1))
    }
    
    func push(view: any IdentifiableView) {
        path.append(view)
        stack.append(view)
    }
    
    func present(view: any IdentifiableView) {
        presenting = view
    }
}
