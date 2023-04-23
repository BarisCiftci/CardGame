//
//  Constants.swift
//  CardGame
//
//  Created by Baris Ciftci on 23/04/2023.
//

import Foundation
import SwiftUI
import AVFAudio

// Background gradient colors
let lightGreenBackground: Color = Color(
    red: 12/255,
    green: 119/255,
    blue: 0/255)

let darkGreenBackground: Color = Color(
    red: 8/255,
    green: 68/255,
    blue: 0/255)

let playerNameUser = "Human"
let playerNameCpu = "ChatGPT"
let player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "sound", ofType: "mp3")!))
