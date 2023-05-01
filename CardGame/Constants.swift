//
//  Constants.swift
//  CardGame
//
//  Created by Baris Ciftci on 23/04/2023.
//

import Foundation
import SwiftUI
import AVFAudio

let playerNameUser = "Human"
let playerNameCpu = "ChatGPT"
let player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "sound", ofType: "mp3")!))

let strokeLine = 8

let logoFirstName = "CARD"
let logoSecondName = "GAME"

let buttonText = "DEAL"

