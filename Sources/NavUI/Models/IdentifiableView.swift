//
//  ViewItem.swift
//  iBills
//
//  Created by Gustavo de Melos Alencar  on 25/03/26.
//
import SwiftUI

public protocol IdentifiableView: Hashable, Identifiable {
    associatedtype Destination: View
    @ViewBuilder var destination: Self.Destination { get }
}

public extension IdentifiableView {
    var id: String {
        String(describing: type(of: self))+String(describing: self)
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
