import SwiftUI

protocol NavUIViewModelProtocol: ObservableObject, AnyObject {
  var path: NavigationPath { get set }
  var _stack: [StackedView] { get }
  var presenting: StackedView? { get set }
  var root: StackedView { get }
  
  func push(view: StackedView)
  func present(view: StackedView)
  func pop() -> StackedView
  func pop(to stackedView: StackedView)
  func pop(to viewType: any View.Type)
  func popToRoot()
}
