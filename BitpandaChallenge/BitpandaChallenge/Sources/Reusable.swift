//
//  Reusable.swift
//  BitpandaChallenge
//
//  Created by Silvia Kuzmova on 16.12.21.
//

import UIKit

public protocol Reuseable: AnyObject {
    static var reuseIdentifier: String { get }
}

extension Reuseable {
    public static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: Reuseable {}
extension UITableViewHeaderFooterView: Reuseable {}
extension UICollectionReusableView: Reuseable {}

extension UITableView {
    public func register<T: Reuseable>(_ cell: T.Type) {
        register(cell, forCellReuseIdentifier: cell.reuseIdentifier)
    }

    public func register<T: Reuseable>(headerFooter view: T.Type) {
        register(view, forHeaderFooterViewReuseIdentifier: view.reuseIdentifier)
    }

    public func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as! T
    }

    public func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(for _: Int) -> T {
        dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as! T
    }
}

extension UICollectionView {
    public func register<T: Reuseable>(_ cell: T.Type) {
        register(cell, forCellWithReuseIdentifier: cell.reuseIdentifier)
    }

    public func register<T: Reuseable>(header view: T.Type) {
        register(view, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: view.reuseIdentifier)
    }

    public func register<T: Reuseable>(footer view: T.Type) {
        register(view, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: view.reuseIdentifier)
    }

    public func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as! T
    }
}
