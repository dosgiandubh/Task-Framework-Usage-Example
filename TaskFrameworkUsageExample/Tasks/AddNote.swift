//
//  AddNote.swift
//  TaskFrameworkUsageExample
//
//  Created by dosgiandubh on 07/03/2022.
//

import TaskFramework

final class AddNote: Task {
    func start(with note: String, completion: @escaping (TaskResult<Int, Error>) -> Void) {
        print(#"Adding a note "\#(note)""#)
        print("Generating the note's identifier")
        let identifier = note.hash
        completion(.success(identifier))
    }
}
