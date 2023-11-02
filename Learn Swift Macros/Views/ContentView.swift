//
//  ContentView.swift
//  Learn Swift Macros
//
//  Created by Zakarai Lachkar on 2/11/2023.
//

import SwiftUI

struct ContentView: View {
    let currentFileName = #file // Obtient le nom du fichier source actuel.
    let currentFileID = #fileID // Obtient l'identifiant unique associé au fichier source actuel.
    let currentFilePath = #filePath // Obtient le chemin complet du fichier source actuel.
    let currentFunctionName = #function // Obtient le nom de la fonction actuellement exécutée.
    let currentLineNumber = #line // Obtient le numéro de ligne du fichier source actuel.
    let currentColumnNumber = #column // Obtient le numéro de colonne du fichier source actuel.
    var body: some View {
        VStack {
            Text("File Name: \(currentFileName)")
            Text("File ID: \(currentFileID)")
            Text("File Path: \(currentFilePath)")
            Text("Function Name: \(currentFunctionName)")
            Text("Line Number: \(currentLineNumber)")
            Text("Column Number: \(currentColumnNumber)")
        }
        .padding()
        .onAppear{
            FreestandingMacro(isError: false)
        }
    }
}

#Preview {
    ContentView()
}
