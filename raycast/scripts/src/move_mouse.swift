#!/usr/bin/env swift
import Cocoa
import CoreGraphics

// Get all available screens.
let screens = NSScreen.screens
guard screens.count > 0 else {
    print("No screens found.")
    exit(1)
}

// Compute the center of a given screen.
func centerOfScreen(_ screen: NSScreen) -> CGPoint {
    let frame = screen.frame
    let center = CGPoint(
        x: frame.origin.x + frame.size.width / 2,
        y: frame.origin.y + frame.size.height / 2
    )
    return center
}

// Moves the mouse pointer to the given point.
func moveMouse(to point: CGPoint) {
    CGWarpMouseCursorPosition(point)
    // Re-associate the hardware cursor with the new position.
    CGAssociateMouseAndMouseCursorPosition(1)
}

// Parse command line arguments.
let args = CommandLine.arguments

if args.contains("-m") {
    // Look for the "-m" flag and its argument.
    if let index = args.firstIndex(of: "-m"), index + 1 < args.count {
        let monitorArg = args[index + 1]
        if let monitorNumber = Int(monitorArg), monitorNumber > 0, monitorNumber <= screens.count {
            let targetScreen = screens[monitorNumber - 1]
            let center = centerOfScreen(targetScreen)
            moveMouse(to: center)
        } else {
            print("Invalid monitor number. Please choose between 1 and \(screens.count).")
            exit(1)
        }
    } else {
        print("No monitor number provided after -m flag.")
        exit(1)
    }
} else {
    // Toggle mode: find which screen the current mouse is on and move to the next one.
    let currentLocation = NSEvent.mouseLocation
    var currentScreenIndex: Int? = nil

    for (index, screen) in screens.enumerated() {
        if screen.frame.contains(currentLocation) {
            currentScreenIndex = index
            break
        }
    }

    // If the current mouse location wasn't within any screen, default to first screen.
    let currentIndex = currentScreenIndex ?? 0
    let nextIndex = (currentIndex + 1) % screens.count
    let targetScreen = screens[nextIndex]
    let center = centerOfScreen(targetScreen)
    moveMouse(to: center)
}
