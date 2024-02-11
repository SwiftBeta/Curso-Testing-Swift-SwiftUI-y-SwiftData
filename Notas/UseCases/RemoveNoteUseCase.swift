//
//  RemoveNoteUseCase.swift
//  Notas
//
//  Created by Home on 14/1/24.
//

import Foundation

protocol RemoveNoteProtocol {
    func removeNoteWith(identifier: UUID) throws
}

struct RemoveNoteUseCase: RemoveNoteProtocol {
    var notesDatabase: NotesDatabaseProtocol
    
    init(notesDatabase: NotesDatabaseProtocol = NotesDatabase.shared) {
        self.notesDatabase = notesDatabase
    }
    
    func removeNoteWith(identifier: UUID) throws {
        try notesDatabase.remove(identifier: identifier)
    }
}
