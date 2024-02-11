//
//  CreateNoteViewSnapshotTest.swift
//  NotasTests
//
//  Created by Home on 19/1/24.
//

import XCTest
import SnapshotTesting
@testable import Notas

final class CreateNoteViewSnapshotTest: XCTestCase {
    
    func testCreateNoteView() throws {
        let createNoteView = CreateNoteView(viewModel: .init())
        assertSnapshot(of: createNoteView, as: .image)
    }
    
    func testCreateNoteViewWithData() {
        let createNoteView = CreateNoteView(viewModel: .init(),
                                            title: "Suscríbete a SwiftBeta!",
                                            text: "Apoya al canal 🎉")
        assertSnapshot(of: createNoteView, as: .image)
    }
}
