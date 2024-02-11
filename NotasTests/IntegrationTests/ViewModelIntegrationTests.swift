//
//  ViewModelIntegrationTests.swift
//  NotasTests
//
//  Created by Home on 22/11/23.
//

import XCTest
@testable import Notas

@MainActor
final class ViewModelIntegrationTests: XCTestCase {
    var sut: ViewModel!

    override func setUpWithError() throws {
        let database = NotesDatabase.shared
        database.container = NotesDatabase.setupContainer(inMemory: true)
        
        let createNoteUseCase = CreateNoteUseCase(notesDatabase: database)
        let fetchAllNotesUseCase = FetchAllNotesUseCase(notesDatabase: database)
        
        sut = ViewModel(createNoteUseCase: createNoteUseCase,
                        fetchAllNotesUseCase: fetchAllNotesUseCase)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCreateNote() {
        // Given
        sut.createNoteWith(title: "Hello 1", text: "text 1")
        
        // When
        let note = sut.notes.first
        
        // Then
        XCTAssertNotNil(note)
        XCTAssertEqual(note?.title, "Hello 1")
        XCTAssertEqual(note?.text, "text 1")
        XCTAssertEqual(sut.notes.count, 1, "Debería haber una nota en la base de datos")
    }
    
    func testCreateTwoNotes() {
        // Given
        sut.createNoteWith(title: "Hello 1", text: "text 1")
        sut.createNoteWith(title: "Hello 2", text: "text 2")
        
        // When
        let firstNote = sut.notes.first
        let lastNote = sut.notes.last
        
        // Then
        XCTAssertNotNil(firstNote)
        XCTAssertEqual(firstNote?.title, "Hello 1")
        XCTAssertEqual(firstNote?.text, "text 1")
        XCTAssertNotNil(lastNote)
        XCTAssertEqual(lastNote?.title, "Hello 2")
        XCTAssertEqual(lastNote?.text, "text 2")
        
        XCTAssertEqual(sut.notes.count, 2, "Debería haber 2 notas en la base de datos")
    }
    
    func testFetchAllNotes() {
        // Given
        sut.createNoteWith(title: "Hello 1", text: "text 1")
        sut.createNoteWith(title: "Hello 2", text: "text 2")
        
        // When
        let firstNote = sut.notes[0]
        let secondNote = sut.notes[1]
        
        // Then
        XCTAssertEqual(sut.notes.count, 2, "There should be two notes in the database")
        XCTAssertEqual(firstNote.title, "Hello 1", "First note's title should be 'Note 1'")
        XCTAssertEqual(firstNote.text, "text 1", "First note's text should be 'text 1'")
        XCTAssertEqual(secondNote.title, "Hello 2", "First note's title should be 'Note 2'")
        XCTAssertEqual(secondNote.text, "text 2", "First note's text should be 'text 2'")
    }
    
    func testUpdateNote() {
        sut.createNoteWith(title: "Note 1", text: "text 1")
        
        guard let note = sut.notes.first else {
            XCTFail()
            return
        }
        
        sut.updateNoteWith(identifier: note.identifier, newTitle: "SwiftBeta", newText: "New Text")
        sut.fetchAllNotes()
        
        XCTAssertEqual(sut.notes.count, 1, "Debería haber 1 nota en la base de datos")
        XCTAssertEqual(sut.notes[0].title, "SwiftBeta")
        XCTAssertEqual(sut.notes[0].text, "New Text")
    }
    
    func testRemoveNote() {
        sut.createNoteWith(title: "Note 1", text: "text 1")
        sut.createNoteWith(title: "Note 2", text: "text 2")
        sut.createNoteWith(title: "Note 3", text: "text 3")
        
        guard let note = sut.notes.last else {
            XCTFail()
            return
        }
        
        sut.removeNoteWith(identifier: note.identifier)
        XCTAssertEqual(sut.notes.count, 2, "Debería haber 2 notas en la base de datos")
    }
    
    func testRemoveNoteInDatabaseShouldThrowError() {
        sut.removeNoteWith(identifier: UUID())
        
        XCTAssertEqual(sut.notes.count, 0)
        XCTAssertNotNil(sut.databaseError)
        XCTAssertEqual(sut.databaseError, DatabaseError.errorRemove)
    }
}
