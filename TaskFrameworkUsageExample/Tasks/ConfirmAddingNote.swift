//
//  ConfirmAddingNote.swift
//  TaskFrameworkUsageExample
//
//  Created by dosgiandubh on 07/03/2022.
//

import UIKit
import TaskFramework

final class ConfirmAddingNote: Task {
    private let viewHolder: ViewHolder

    init(presentedIn viewHolder: ViewHolder) {
        self.viewHolder = viewHolder
    }

    func start(with: Void, completion: @escaping (TaskResult<Void, Error>) -> Void) {
        guard let viewController = viewHolder.viewController else {
            completion(.cancelled)
            return
        }

        let alertController = UIAlertController(
            title: "Adding Task",
            message: "Are you sure you want to add a new note?",
            preferredStyle: .alert
        )
        let addAction = UIAlertAction(title: "Yes", style: .default) { _ in
            completion(.success(()))
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            completion(.cancelled)
        }
        alertController.addAction(addAction)
        alertController.addAction(cancelAction)

        viewController.present(alertController, animated: true, completion: nil)
    }
}
