//
//  ViewController.swift
//  TaskFrameworkUsageExample
//
//  Created by dosgiandubh on 07/03/2022.
//

import UIKit
import TaskFramework

final class ViewController: UIViewController {

    // MARK: - Private properties

    private lazy var chain = ConfirmAddingNote(presentedIn: ViewHolder(with: self))
        ==> AddNote()
        ==> CacheNoteByIdentifier()

    // MARK: - Outlets

    @IBOutlet private weak var noteField: UITextField!
    @IBOutlet private weak var addNoteButton: UIButton!

    // MARK: - Actions

    @IBAction private func didTapAddNote() {
        guard let note = noteField.text, !note.isEmpty else { return }

        view.endEditing(true)
        addNoteButton.isEnabled = false

        chain.start(with: note) { [weak self] result in
            guard let self = self else { return }
            self.addNoteButton.isEnabled = true
            self.showResultOfAddingNote(result)
        }
    }

    // MARK: - Private methods

    private func showResultOfAddingNote(_ result: TaskResult<Void, Error>) {
        let title: String
        let message: String

        switch result {
        case .success:
            title = "Note Added"
            message = "Your note is added successfully"
        case let .failure(error):
            title = "Failed To Add Note"
            message = "Could not add the note due to \(error)"
        case .cancelled:
            title = "Adding Cancelled"
            message = "You cancelled the process"
        }

        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

        present(alertController, animated: true, completion: nil)
    }
}

