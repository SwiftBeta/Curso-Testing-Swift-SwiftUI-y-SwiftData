//
//  NotasUITests.swift
//  NotasUITests
//
//  Created by Home on 19/1/24.
//

import XCTest

final class NotasUITests: XCTestCase {

    func testCreateNote() throws {
        
        let app = XCUIApplication()
        app.launch()
        app.toolbars["Toolbar"]/*@START_MENU_TOKEN@*/.staticTexts["Crear Nota"]/*[[".otherElements[\"Crear Nota\"]",".buttons[\"Crear Nota\"].staticTexts[\"Crear Nota\"]",".staticTexts[\"Crear Nota\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let collectionViewsQuery = app.collectionViews
        let titleTextView = collectionViewsQuery.textViews.matching(identifier: "createnote_title_identifier").element
        titleTextView.tap()
        titleTextView.typeText("Suscríbete a SwiftBeta!")
        
        let textoTextView = collectionViewsQuery.textViews.matching(identifier: "createnote_text_identifier").element
        textoTextView.tap()
        textoTextView.typeText("Aprende a crear aplicaciones en cualquier entorno Apple, usando Swift, SwiftUI, Xcode, etc")
        
        app.navigationBars["Nueva Nota"]/*@START_MENU_TOKEN@*/.buttons["Crear Nota"]/*[[".otherElements[\"Crear Nota\"].buttons[\"Crear Nota\"]",".buttons[\"Crear Nota\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    }
    
    func testCreateTwoNotes() throws {
        let app = XCUIApplication()
        app.launch()
        app.toolbars["Toolbar"]/*@START_MENU_TOKEN@*/.staticTexts["Crear Nota"]/*[[".otherElements[\"Crear Nota\"]",".buttons[\"Crear Nota\"].staticTexts[\"Crear Nota\"]",".staticTexts[\"Crear Nota\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let collectionViewsQuery = app.collectionViews
        
        // Creamos primera nota
        
        let titleTextView = collectionViewsQuery.textViews.matching(identifier: "createnote_title_identifier").element
        titleTextView.tap()
        titleTextView.typeText("Suscríbete a SwiftBeta!")
        
        let textoTextView = collectionViewsQuery.textViews.matching(identifier: "createnote_text_identifier").element
        textoTextView.tap()
        textoTextView.typeText("Aprende a crear aplicaciones en cualquier entorno Apple, usando Swift, SwiftUI, Xcode, etc")
        
        app.navigationBars["Nueva Nota"]/*@START_MENU_TOKEN@*/.buttons["Crear Nota"]/*[[".otherElements[\"Crear Nota\"].buttons[\"Crear Nota\"]",".buttons[\"Crear Nota\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        // Creamos segunda nota
        
        app.toolbars["Toolbar"]/*@START_MENU_TOKEN@*/.staticTexts["Crear Nota"]/*[[".otherElements[\"Crear Nota\"]",".buttons[\"Crear Nota\"].staticTexts[\"Crear Nota\"]",".staticTexts[\"Crear Nota\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let titleTextView2 = collectionViewsQuery.textViews.matching(identifier: "createnote_title_identifier").element
        titleTextView2.tap()
        titleTextView2.typeText("Suscríbete a SwiftBeta! 22222")
        
        let textoTextView2 = collectionViewsQuery.textViews.matching(identifier: "createnote_text_identifier").element
        textoTextView2.tap()
        textoTextView2.typeText("22222 Aprende a crear aplicaciones en cualquier entorno Apple, usando Swift, SwiftUI, Xcode, etc")
        
        app.navigationBars["Nueva Nota"]/*@START_MENU_TOKEN@*/.buttons["Crear Nota"]/*[[".otherElements[\"Crear Nota\"].buttons[\"Crear Nota\"]",".buttons[\"Crear Nota\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
    }
    
    func testRemoveNote() throws {
        let app = XCUIApplication()
        app.launch()
        app.toolbars["Toolbar"]/*@START_MENU_TOKEN@*/.staticTexts["Crear Nota"]/*[[".otherElements[\"Crear Nota\"]",".buttons[\"Crear Nota\"].staticTexts[\"Crear Nota\"]",".staticTexts[\"Crear Nota\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let collectionViewsQuery = app.collectionViews
        
        // Creamos primera nota
        
        let titleTextView = collectionViewsQuery.textViews.matching(identifier: "createnote_title_identifier").element
        titleTextView.tap()
        titleTextView.typeText("Suscríbete a SwiftBeta!")
        
        let textoTextView = collectionViewsQuery.textViews.matching(identifier: "createnote_text_identifier").element
        textoTextView.tap()
        textoTextView.typeText("Aprende a crear aplicaciones en cualquier entorno Apple, usando Swift, SwiftUI, Xcode, etc")
        
        app.navigationBars["Nueva Nota"].buttons["Crear Nota"].tap()
        
        let firstNote = collectionViewsQuery.cells.element(boundBy: 0)
        firstNote.tap()
        app.buttons["Eliminar Nota"].tap()
    }
}
