//
//  CacheNoteByIdentifier.swift
//  TaskFrameworkUsageExample
//
//  Created by dosgiandubh on 07/03/2022.
//

import TaskFramework

final class CacheNoteByIdentifier: Task {
    func start(with identifier: Int, completion: @escaping (TaskResult<Void, Error>) -> Void) {
        print(#"Caching a note with identifier \#(identifier)"#)
        completion(.success(()))
    }
}
