//
//  ViewHolder.swift
//  TaskFrameworkUsageExample
//
//  Created by dosgiandubh on 07/03/2022.
//

import UIKit

final class ViewHolder {
    weak var viewController: UIViewController?

    init(with viewController: UIViewController) {
        self.viewController = viewController
    }
}
