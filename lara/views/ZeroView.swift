//
//  ZeroView.swift
//  lara
//
//  Created by ruter on 28.03.26.
//

import SwiftUI
import PartyUI

struct ZeroTweak: Identifiable, Equatable {
    var id: String { name }
    var icon: String
    var name: String
    var isOn: Bool = false
    var minSupportedVersion: Double = 0.0
    var maxSupportedVersion: Double = 99.9
    var paths: [String]
}

struct ZeroSection: Identifiable, Equatable {
    var id: String { label }
    var label: String
    var icon: String
    var zeroTweaks: [ZeroTweak]
}

struct ZeroView: View {
    @ObservedObject var mgr: laramgr
    // yes yes i know it's up here, lemin does this too so be quiet.
    @State private var zeroTweakArray: [ZeroSection] = [
        ZeroSection(label: "Home Screen", icon: "house", zeroTweaks: [
            ZeroTweak(icon: "dock.rectangle", name: "Hide Dock Background", minSupportedVersion: 16.0, maxSupportedVersion: 18.9, paths: ["/System/Library/PrivateFrameworks/CoreMaterial.framework/dockDark.materialrecipe", "/System/Library/PrivateFrameworks/CoreMaterial.framework/dockLight.materialrecipe"]),
            ZeroTweak(icon: "folder", name: "Clear Folder Backgrounds", minSupportedVersion: 16.0, maxSupportedVersion: 18.9, paths: ["/System/Library/PrivateFrameworks/SpringBoardHome.framework/folderDark.materialrecipe", "/System/Library/PrivateFrameworks/SpringBoardHome.framework/folderLight.materialrecipe"]),
            ZeroTweak(icon: "square.text.square", name: "Clear Widget Config BG", minSupportedVersion: 16.0, maxSupportedVersion: 18.9, paths: ["/System/Library/PrivateFrameworks/SpringBoardHome.framework/stackConfigurationBackground.materialrecipe", "/System/Library/PrivateFrameworks/SpringBoardHome.framework/stackConfigurationForeground.materialrecipe"]),
            ZeroTweak(icon: "square.dashed", name: "Clear App Library BG", minSupportedVersion: 18.0, maxSupportedVersion: 18.9, paths: ["/System/Library/PrivateFrameworks/SpringBoardHome.framework/coplanarLeadingTrailingBackgroundBlur.materialrecipe"]),
            ZeroTweak(icon: "magnifyingglass", name: "Clear Library Search BG", minSupportedVersion: 18.0, maxSupportedVersion: 18.9, paths: ["/System/Library/PrivateFrameworks/SpringBoardHome.framework/homeScreenOverlay.materialrecipe"]),
            ZeroTweak(icon: "rectangle.and.text.magnifyingglass", name: "Clear Spotlight Background", minSupportedVersion: 16.0, maxSupportedVersion: 18.9, paths: ["/System/Library/PrivateFrameworks/SpringBoardHome.framework/knowledgeBackgroundDarkZoomed.descendantrecipe", "/System/Library/PrivateFrameworks/SpringBoardHome.framework/knowledgeBackgroundZoomed.descendantrecipe"]),
            ZeroTweak(icon: "xmark", name: "Hide Delete Icon", minSupportedVersion: 16.0, maxSupportedVersion: 18.9, paths: ["/System/Library/PrivateFrameworks/SpringBoardHome.framework/Assets.car"])
        ]),
        ZeroSection(label: "Lock Screen", icon: "lock", zeroTweaks: [
            ZeroTweak(icon: "ellipsis.rectangle", name: "Clear Passcode Background", minSupportedVersion: 16.0, maxSupportedVersion: 18.9, paths: ["/System/Library/PrivateFrameworks/CoverSheet.framework/dashBoardPasscodeBackground.materialrecipe"]),
            ZeroTweak(icon: "lock", name: "Hide Lock Icon", minSupportedVersion: 16.0, maxSupportedVersion: 18.9, paths: ["/System/Library/PrivateFrameworks/SpringBoardUIServices.framework/lock@2x-812h.ca/main.caml", "/System/Library/PrivateFrameworks/SpringBoardUIServices.framework/lock@2x-896h.ca/main.caml", "/System/Library/PrivateFrameworks/SpringBoardUIServices.framework/lock@3x-812h.ca/main.caml", "/System/Library/PrivateFrameworks/SpringBoardUIServices.framework/lock@3x-896h.ca/main.caml", "/System/Library/PrivateFrameworks/SpringBoardUIServices.framework/lock@3x-d73.ca/main.caml"]),
            ZeroTweak(icon: "flashlight.off.fill", name: "Hide Quick Action Icons", minSupportedVersion: 16.0, maxSupportedVersion: 17.9, paths: ["/System/Library/PrivateFrameworks/CoverSheet.framework/Assets.car"]),
            ZeroTweak(icon: "bolt", name: "Hide Large Battery Icon", minSupportedVersion: 18.0, maxSupportedVersion: 18.9, paths: ["/System/Library/PrivateFrameworks/CoverSheet.framework/Assets.car"])
        ]),
        ZeroSection(label: "Alerts & Overlays", icon: "platter.filled.top.iphone", zeroTweaks: [
            ZeroTweak(icon: "platter.filled.top.iphone", name: "Clear Notification & Widget BGs", minSupportedVersion: 16.0, maxSupportedVersion: 18.9, paths: ["/System/Library/PrivateFrameworks/CoreMaterial.framework/platterStrokeLight.visualstyleset", "/System/Library/PrivateFrameworks/CoreMaterial.framework/platterStrokeDark.visualstyleset", "/System/Library/PrivateFrameworks/CoreMaterial.framework/plattersDark.materialrecipe", "/System/Library/PrivateFrameworks/CoreMaterial.framework/platters.materialrecipe", "/System/Library/PrivateFrameworks/UserNotificationsUIKit.framework/stackDimmingLight.visualstyleset", "/System/Library/PrivateFrameworks/UserNotificationsUIKit.framework/stackDimmingDark.visualstyleset"]),
            ZeroTweak(icon: "paintpalette", name: "Blue Notifcation Shadows", minSupportedVersion: 16.0, maxSupportedVersion: 18.9, paths: [
                "/System/Library/PrivateFrameworks/PlatterKit.framework/platterVibrantShadowLight.visualstyleset", "/System/Library/PrivateFrameworks/PlatterKit.framework/platterVibrantShadowDark.visualstyleset"]),
            ZeroTweak(icon: "list.bullet.rectangle", name: "Clear Touch & Alert Backgrounds", minSupportedVersion: 16.0, maxSupportedVersion: 18.9, paths: ["/System/Library/PrivateFrameworks/CoreMaterial.framework/platformContentDark.materialrecipe", "/System/Library/PrivateFrameworks/CoreMaterial.framework/platformContentLight.materialrecipe"]),
            ZeroTweak(icon: "line.3.horizontal", name: "Hide Home Bar", minSupportedVersion: 16.0, maxSupportedVersion: 18.9, paths: ["/System/Library/PrivateFrameworks/MaterialKit.framework/Assets.car"]),
            ZeroTweak(icon: "text.rectangle.page", name: "Remove Glassy Overlays", minSupportedVersion: 16.0, maxSupportedVersion: 18.9, paths: ["/System/Library/PrivateFrameworks/CoreMaterial.framework/platformChromeDark.materialrecipe", "/System/Library/PrivateFrameworks/CoreMaterial.framework/platformChromeLight.materialrecipe"]),
            ZeroTweak(icon: "switch.programmable", name: "Clear App Switcher", minSupportedVersion: 16.0, maxSupportedVersion: 18.9, paths: ["/System/Library/PrivateFrameworks/SpringBoard.framework/homeScreenBackdrop-application.materialrecipe", "/System/Library/PrivateFrameworks/SpringBoard.framework/homeScreenBackdrop-switcher.materialrecipe"])
        ]),
        ZeroSection(label: "Fonts & Icons", icon: "paintbrush", zeroTweaks: [
            ZeroTweak(icon: "character.cursor.ibeam", name: "Enable Helvetica Font", minSupportedVersion: 17.0, maxSupportedVersion: 18.9, paths: ["/System/Library/Fonts/Core/SFUI.ttf"]),
            ZeroTweak(icon: "character.cursor.ibeam", name: "Enable Helvetica Font ", minSupportedVersion: 16.0, maxSupportedVersion: 16.9, paths: ["/System/Library/Fonts/CoreUI/SFUI.ttf"]),
            ZeroTweak(icon: "circle.slash", name: "Disable Emojis", minSupportedVersion: 16.0, maxSupportedVersion: 18.9, paths: ["/System/Library/Fonts/CoreAddition/AppleColorEmoji-160px.ttc"]),
            ZeroTweak(icon: "bell.slash", name: "Hide Ringer Icon", minSupportedVersion: 16.0, maxSupportedVersion: 18.9, paths: ["/System/Library/PrivateFrameworks/SpringBoard.framework/Ringer-Leading-D73.ca/main.caml"]),
            ZeroTweak(icon: "link", name: "Hide Tethering Icon", minSupportedVersion: 16.0, maxSupportedVersion: 18.9, paths: ["/System/Library/PrivateFrameworks/SpringBoard.framework/Tethering-D73.ca/main.caml"])
        ]),
        ZeroSection(label: "Control Center", icon: "square.grid.2x2", zeroTweaks: [
            ZeroTweak(icon: "circle.grid.2x2", name: "Clear CC Modules", minSupportedVersion: 18.0, maxSupportedVersion: 18.9, paths: ["/System/Library/PrivateFrameworks/CoreMaterial.framework/modulesSheer.descendantrecipe", "/System/Library/ControlCenter/Bundles/FocusUIModule.bundle/Info.plist"]),
            ZeroTweak(icon: "sun.max", name: "Disable Slider Icons ", minSupportedVersion: 16.0, maxSupportedVersion: 17.9, paths: ["/System/Library/ControlCenter/Bundles/DisplayModule.bundle/Brightness.ca/index.xml", "/System/Library/PrivateFrameworks/MediaControls.framework/Volume.ca/index.xml"]),
            ZeroTweak(icon: "sun.max", name: "Disable Slider Icons", minSupportedVersion: 18.0, maxSupportedVersion: 18.9, paths: ["/System/Library/ControlCenter/Bundles/DisplayModule.bundle/Brightness.ca/index.xml", "/System/Library/PrivateFrameworks/MediaControls.framework/VolumeSemibold.ca/index.xml"]),
            ZeroTweak(icon: "play", name: "Hide Player Buttons", minSupportedVersion: 17.0, maxSupportedVersion: 18.9, paths: ["/System/Library/PrivateFrameworks/MediaControls.framework/PlayPauseStop.ca/index.xml", "/System/Library/PrivateFrameworks/MediaControls.framework/ForwardBackward.ca/index.xml"]),
            ZeroTweak(icon: "moon", name: "Hide DND Icon", minSupportedVersion: 16.0, maxSupportedVersion: 18.9, paths: ["/System/Library/PrivateFrameworks/FocusUI.framework/dnd_cg_02.ca/main.caml"]),
            ZeroTweak(icon: "wifi", name: "Hide WiFi & Bluetooth Icons", minSupportedVersion: 16.0, maxSupportedVersion: 17.9, paths: ["/System/Library/ControlCenter/Bundles/ConnectivityModule.bundle/Bluetooth.ca/index.xml", "/System/Library/ControlCenter/Bundles/ConnectivityModule.bundle/WiFi.ca/index.xml"]),
            ZeroTweak(icon: "rectangle.on.rectangle", name: "Disable Screen Mirroring Module", minSupportedVersion: 16.0, maxSupportedVersion: 17.9, paths: ["/System/Library/ControlCenter/Bundles/AirPlayMirroringModule.bundle/Info.plist"]),
            ZeroTweak(icon: "lock.rotation", name: "Disable Orientation Lock Module", minSupportedVersion: 16.0, maxSupportedVersion: 17.9, paths: ["/System/Library/ControlCenter/Bundles/OrientationLockModule.bundle/Info.plist"]),
            ZeroTweak(icon: "moon", name: "Disable Focus Module", minSupportedVersion: 16.0, maxSupportedVersion: 17.9, paths: ["/System/Library/ControlCenter/Bundles/FocusUIModule.bundle/Info.plist"])
        ]),
        ZeroSection(label: "Sound Effects", icon: "speaker.wave.2", zeroTweaks: [
            ZeroTweak(icon: "dot.radiowaves.left.and.right", name: "Disable AirDrop Ping", minSupportedVersion: 16.0, maxSupportedVersion: 18.9, paths: ["/System/Library/Audio/UISounds/Modern/airdrop_invite.cat"]),
            ZeroTweak(icon: "bolt", name: "Disable Charge Sound", minSupportedVersion: 16.0, maxSupportedVersion: 18.9, paths: ["/System/Library/Audio/UISounds/connect_power.caf"]),
            ZeroTweak(icon: "battery.25", name: "Disable Low Battery Sound", minSupportedVersion: 16.0, maxSupportedVersion: 18.9, paths: ["/System/Library/Audio/UISounds/low_power.caf"]),
            ZeroTweak(icon: "creditcard", name: "Disable Payment Sounds", minSupportedVersion: 16.0, maxSupportedVersion: 18.9, paths: ["/System/Library/Audio/UISounds/payment_success.caf", "/System/Library/Audio/UISounds/payment_failure.caf"]),
            ZeroTweak(icon: "phone", name: "Disable Dialing Sounds", minSupportedVersion: 16.0, maxSupportedVersion: 18.9, paths: ["/System/Library/Audio/UISounds/nano/dtmf-0.caf", "/System/Library/Audio/UISounds/nano/dtmf-1.caf", "/System/Library/Audio/UISounds/nano/dtmf-2.caf", "/System/Library/Audio/UISounds/nano/dtmf-3.caf", "/System/Library/Audio/UISounds/nano/dtmf-4.caf", "/System/Library/Audio/UISounds/nano/dtmf-5.caf", "/System/Library/Audio/UISounds/nano/dtmf-6.caf", "/System/Library/Audio/UISounds/nano/dtmf-7.caf", "/System/Library/Audio/UISounds/nano/dtmf-8.caf", "/System/Library/Audio/UISounds/nano/dtmf-9.caf", "/System/Library/Audio/UISounds/nano/dtmf-pound.caf", "/System/Library/Audio/UISounds/nano/dtmf-star.caf"])
        ]),
        ZeroSection(label: "Risky Tweaks", icon: "exclamationmark.triangle.fill", zeroTweaks: [
            ZeroTweak(icon: "square.dashed", name: "Remove CC Background", minSupportedVersion: 16.0, maxSupportedVersion: 18.9, paths: ["/System/Library/PrivateFrameworks/CoreMaterial.framework/modulesBackground.materialrecipe"]),
            ZeroTweak(icon: "exclamationmark.triangle", name: "Disable ALL Banners", minSupportedVersion: 16.0, maxSupportedVersion: 18.9, paths: ["/System/Library/PrivateFrameworks/SpringBoard.framework/BannersAuthorizedBundleIDs.plist"]),
            ZeroTweak(icon: "paintpalette", name: "Disable ALL Accent Colors", minSupportedVersion: 16.0, maxSupportedVersion: 18.9, paths: ["/System/Library/PrivateFrameworks/CoreUI.framework/DesignLibrary-iOS.bundle/iOSRepositories/DarkStandard.car"]),
            ZeroTweak(icon: "text.badge.xmark", name: "Break System Font", minSupportedVersion: 16.0, maxSupportedVersion: 18.9, paths: ["/System/Library/Fonts/Core/SFUI.ttf", "/System/Library/Fonts/Core/Helvetica.ttc"]),
            ZeroTweak(icon: "clock", name: "Break Clock Font", minSupportedVersion: 16.0, maxSupportedVersion: 18.9, paths: ["/System/Library/Fonts/Core/ADTNumeric.ttc"]),
            ZeroTweak(icon: "house", name: "Break SpringBoard Labels", minSupportedVersion: 16.0, maxSupportedVersion: 18.9, paths: ["/System/Library/PrivateFrameworks/SpringBoardUIServices.framework/SpringBoardUIServices.loctable", "/System/Library/PrivateFrameworks/SpringBoardHome.framework/SpringBoardHome.loctable", "/System/Library/CoreServices/SpringBoard.app/SpringBoard.loctable"]),
        ])
    ]
    @State private var appliedPaths: [String] = []
    @State private var customPath: String = ""
    @State private var showRiskyTweaks: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                Section(header: HeaderLabel(text: "Settings", icon: "gearshape")) {
                    PrimaryTextFieldButton(titleKey: "Custom Path", text: $customPath, button: {
                        Button(action: {
                            Haptic.shared.play(.soft)
                            mgr.vfszeropage(at: customPath)
                            Alertinator.shared.alert(title: "Successfully attempted to zero path!", body: "\(customPath)")
                        }) {
                            Image(systemName: "checkmark")
                        }
                    })
                    .listRowInsets(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                    PlainToggle(label: "Show Risky Tweaks", infoType: .warning, infoMessage: "These tweaks will likely break usability of your device in some shape or form. To revert, simply force-restart your device.", isOn: $showRiskyTweaks)
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                    Text("Made by lunginspector for lara. This section includes almost all of [dirtyZero's](https://github.com/jailbreakdotparty/dirtyZero) tweaks, but with DarkSword support!\n\nNOTICE: If you are on iOS 26, most tweaks listed here do not work! This may or may not change in the future.")
                        .font(.footnote)
                        .opacity(0.7)
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                }
                ForEach($zeroTweakArray) { $section in
                    if section.label != "Risky Tweaks" || section.label == "Risky Tweaks" && showRiskyTweaks {
                        Section(header: HeaderLabel(text: section.label, icon: section.icon)) {
                            ForEach($section.zeroTweaks) { $tweak in
                                PlatterToggle(icon: tweak.icon, label: tweak.name, color: section.label == "Risky Tweaks" ? .red : .dirtyZero, isOn: $tweak.isOn)
                                    .listRowSeparator(.hidden)
                                    .listRowInsets(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                            }
                        }
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("dirtyZero")
            .safeAreaInset(edge: .bottom) {
                VStack {
                    Button(action: {
                        Haptic.shared.play(.soft)
                        applyTweaks()
                    }) {
                        ButtonLabel(text: "Apply Tweaks", icon: "checkmark")
                    }
                    .buttonStyle(TranslucentButtonStyle(color: .green))
                }
                .modifier(OverlayBackground(stickBottomPadding: true))
            }
            .tint(.dirtyZero)
        }
        .onChange(of: zeroTweakArray) { newValue in
            Haptic.shared.play(.soft)
        }
    }
    
    func applyTweaks() {
        let enabledPaths = zeroTweakArray.flatMap { $0.zeroTweaks }.filter { $0.isOn }.flatMap { $0.paths }
        
        for path in enabledPaths {
            mgr.vfszeropage(at: path)
        }
        
        Alertinator.shared.alert(title: "Tweaks applied successfully!", body: "Respring your device to see any changes.")
    }
}

// i hate you so much
extension Color {
    static let dirtyZero = Color(red: 0.384, green: 0.769, blue: 0.486)
}

/*
struct tweak: Identifiable {
    let id: String
    let name: String
    let path: [String]

    init(name: String, path: [String]) {
        self.name = name
        self.path = path
        self.id = name + "|" + path.joined(separator: "|")
    }
}

struct ZeroView: View {
    @ObservedObject var mgr: laramgr
    @AppStorage("selecteddata") private var selecteddata: Data = Data()
    @State private var selected: Set<String> = []

    let tweaks: [tweak] = [
        tweak(name: "Hide Dock Background", path: ["/System/Library/PrivateFrameworks/CoreMaterial.framework/dockDark.materialrecipe", "/System/Library/PrivateFrameworks/CoreMaterial.framework/dockLight.materialrecipe"]),
        tweak(name: "Clear Folder Backgrounds", path: ["/System/Library/PrivateFrameworks/SpringBoardHome.framework/folderDark.materialrecipe", "/System/Library/PrivateFrameworks/SpringBoardHome.framework/folderLight.materialrecipe"]),
        tweak(name: "Clear Widget Config BG", path: ["/System/Library/PrivateFrameworks/SpringBoardHome.framework/stackConfigurationBackground.materialrecipe", "/System/Library/PrivateFrameworks/SpringBoardHome.framework/stackConfigurationForeground.materialrecipe"]),
        tweak(name: "Clear App Library BG", path: ["/System/Library/PrivateFrameworks/SpringBoardHome.framework/coplanarLeadingTrailingBackgroundBlur.materialrecipe"]),
        tweak(name: "Clear Library Search BG", path: ["/System/Library/PrivateFrameworks/SpringBoardHome.framework/homeScreenOverlay.materialrecipe"]),
        tweak(name: "Clear Spotlight Background", path: ["/System/Library/PrivateFrameworks/SpringBoardHome.framework/knowledgeBackgroundDarkZoomed.descendantrecipe", "/System/Library/PrivateFrameworks/SpringBoardHome.framework/knowledgeBackgroundZoomed.descendantrecipe"]),
        tweak(name: "Hide Delete Icon", path: ["/System/Library/PrivateFrameworks/SpringBoardHome.framework/Assets.car"]),
        tweak(name: "Clear Passcode Background", path: ["/System/Library/PrivateFrameworks/CoverSheet.framework/dashBoardPasscodeBackground.materialrecipe"]),
        tweak(name: "Hide Lock Icon", path: ["/System/Library/PrivateFrameworks/SpringBoardUIServices.framework/lock@2x-812h.ca/main.caml", "/System/Library/PrivateFrameworks/SpringBoardUIServices.framework/lock@2x-896h.ca/main.caml", "/System/Library/PrivateFrameworks/SpringBoardUIServices.framework/lock@3x-812h.ca/main.caml", "/System/Library/PrivateFrameworks/SpringBoardUIServices.framework/lock@3x-896h.ca/main.caml", "/System/Library/PrivateFrameworks/SpringBoardUIServices.framework/lock@3x-d73.ca/main.caml"]),
        tweak(name: "Hide Quick Action Icons", path: ["/System/Library/PrivateFrameworks/CoverSheet.framework/Assets.car"]),
        tweak(name: "Hide Large Battery Icon", path: ["/System/Library/PrivateFrameworks/CoverSheet.framework/Assets.car"]),
        tweak(name: "Clear Notification & Widget BGs", path: ["/System/Library/PrivateFrameworks/CoreMaterial.framework/platterStrokeLight.visualstyleset", "/System/Library/PrivateFrameworks/CoreMaterial.framework/platterStrokeDark.visualstyleset", "/System/Library/PrivateFrameworks/CoreMaterial.framework/plattersDark.materialrecipe", "/System/Library/PrivateFrameworks/CoreMaterial.framework/platters.materialrecipe", "/System/Library/PrivateFrameworks/UserNotificationsUIKit.framework/stackDimmingLight.visualstyleset", "/System/Library/PrivateFrameworks/UserNotificationsUIKit.framework/stackDimmingDark.visualstyleset"]),
        tweak(name: "Blue Notifcation Shadows", path: ["/System/Library/PrivateFrameworks/PlatterKit.framework/platterVibrantShadowLight.visualstyleset", "/System/Library/PrivateFrameworks/PlatterKit.framework/platterVibrantShadowDark.visualstyleset"]),
        tweak(name: "Clear Touch & Alert Backgrounds", path: ["/System/Library/PrivateFrameworks/CoreMaterial.framework/platformContentDark.materialrecipe", "/System/Library/PrivateFrameworks/CoreMaterial.framework/platformContentLight.materialrecipe"]),
        tweak(name: "Hide Home Bar", path: ["/System/Library/PrivateFrameworks/MaterialKit.framework/Assets.car"]),
        tweak(name: "Remove Glassy Overlays", path: ["/System/Library/PrivateFrameworks/CoreMaterial.framework/platformChromeDark.materialrecipe", "/System/Library/PrivateFrameworks/CoreMaterial.framework/platformChromeLight.materialrecipe"]),
        tweak(name: "Clear App Switcher", path: ["/System/Library/PrivateFrameworks/SpringBoard.framework/homeScreenBackdrop-application.materialrecipe", "/System/Library/PrivateFrameworks/SpringBoard.framework/homeScreenBackdrop-switcher.materialrecipe"]),
        tweak(name: "Enable Helvetica Font", path: ["/System/Library/Fonts/Core/SFUI.ttf"]),
        tweak(name: "Enable Helvetica Font ", path: ["/System/Library/Fonts/CoreUI/SFUI.ttf"]),
        tweak(name: "Disable Emojis", path: ["/System/Library/Fonts/CoreAddition/AppleColorEmoji-160px.ttc"]),
        tweak(name: "Hide Ringer Icon", path: ["/System/Library/PrivateFrameworks/SpringBoard.framework/Ringer-Leading-D73.ca/main.caml"]),
        tweak(name: "Hide Tethering Icon", path: ["/System/Library/PrivateFrameworks/SpringBoard.framework/Tethering-D73.ca/main.caml"]),
        tweak(name: "Clear CC Modules", path: ["/System/Library/PrivateFrameworks/CoreMaterial.framework/modulesSheer.descendantrecipe", "/System/Library/ControlCenter/Bundles/FocusUIModule.bundle/Info.plist"]),
        tweak(name: "Disable Slider Icons ", path: ["/System/Library/ControlCenter/Bundles/DisplayModule.bundle/Brightness.ca/index.xml", "/System/Library/PrivateFrameworks/MediaControls.framework/Volume.ca/index.xml"]),
        tweak(name: "Disable Slider Icons", path: ["/System/Library/ControlCenter/Bundles/DisplayModule.bundle/Brightness.ca/index.xml", "/System/Library/PrivateFrameworks/MediaControls.framework/VolumeSemibold.ca/index.xml"]),
        tweak(name: "Hide Player Buttons", path: ["/System/Library/PrivateFrameworks/MediaControls.framework/PlayPauseStop.ca/index.xml", "/System/Library/PrivateFrameworks/MediaControls.framework/ForwardBackward.ca/index.xml"]),
        tweak(name: "Hide DND Icon", path: ["/System/Library/PrivateFrameworks/FocusUI.framework/dnd_cg_02.ca/main.caml"]),
        tweak(name: "Hide WiFi & Bluetooth Icons", path: ["/System/Library/ControlCenter/Bundles/ConnectivityModule.bundle/Bluetooth.ca/index.xml", "/System/Library/ControlCenter/Bundles/ConnectivityModule.bundle/WiFi.ca/index.xml"]),
        tweak(name: "Disable Screen Mirroring Module", path: ["/System/Library/ControlCenter/Bundles/AirPlayMirroringModule.bundle/Info.plist"]),
        tweak(name: "Disable Orientation Lock Module", path: ["/System/Library/ControlCenter/Bundles/OrientationLockModule.bundle/Info.plist"]),
        tweak(name: "Disable Focus Module", path: ["/System/Library/ControlCenter/Bundles/FocusUIModule.bundle/Info.plist"]),
        tweak(name: "Disable AirDrop Ping", path: ["/System/Library/Audio/UISounds/Modern/airdrop_invite.cat"]),
        tweak(name: "Disable Charge Sound", path: ["/System/Library/Audio/UISounds/connect_power.caf"]),
        tweak(name: "Disable Low Battery Sound", path: ["/System/Library/Audio/UISounds/low_power.caf"]),
        tweak(name: "Disable Payment Sounds", path: ["/System/Library/Audio/UISounds/payment_success.caf", "/System/Library/Audio/UISounds/payment_failure.caf"]),
        tweak(name: "Disable Dialing Sounds", path: ["/System/Library/Audio/UISounds/nano/dtmf-0.caf", "/System/Library/Audio/UISounds/nano/dtmf-1.caf", "/System/Library/Audio/UISounds/nano/dtmf-2.caf", "/System/Library/Audio/UISounds/nano/dtmf-3.caf", "/System/Library/Audio/UISounds/nano/dtmf-4.caf", "/System/Library/Audio/UISounds/nano/dtmf-5.caf", "/System/Library/Audio/UISounds/nano/dtmf-6.caf", "/System/Library/Audio/UISounds/nano/dtmf-7.caf", "/System/Library/Audio/UISounds/nano/dtmf-8.caf", "/System/Library/Audio/UISounds/nano/dtmf-9.caf", "/System/Library/Audio/UISounds/nano/dtmf-pound.caf", "/System/Library/Audio/UISounds/nano/dtmf-star.caf"]),
        tweak(name: "Remove CC Background", path: ["/System/Library/PrivateFrameworks/CoreMaterial.framework/modulesBackground.materialrecipe"]),
        tweak(name: "Disable ALL Banners", path: ["/System/Library/PrivateFrameworks/SpringBoard.framework/BannersAuthorizedBundleIDs.plist"]),
        tweak(name: "Disable ALL Accent Colors", path: ["/System/Library/PrivateFrameworks/CoreUI.framework/DesignLibrary-iOS.bundle/iOSRepositories/DarkStandard.car"]),
        tweak(name: "Break System Font", path: ["/System/Library/Fonts/Core/SFUI.ttf", "/System/Library/Fonts/Core/Helvetica.ttc"]),
        tweak(name: "Break Clock Font", path: ["/System/Library/Fonts/Core/ADTNumeric.ttc"]),
        tweak(name: "Break SpringBoard Labels", path: ["/System/Library/PrivateFrameworks/SpringBoardUIServices.framework/SpringBoardUIServices.loctable", "/System/Library/PrivateFrameworks/SpringBoardHome.framework/SpringBoardHome.loctable", "/System/Library/CoreServices/SpringBoard.app/SpringBoard.loctable"]),
        tweak(name: "Break Settings Labels", path: ["/System/Library/PrivateFrameworks/Settings/SoundsAndHapticsSettings.framework/Sounds.loctable", "/System/Library/PrivateFrameworks/Settings/DisplayAndBrightnessSettings.framework/ColorSchedule.loctable", "/System/Library/PrivateFrameworks/Settings/DisplayAndBrightnessSettings.framework/ColorTemperature.loctable", "/System/Library/PrivateFrameworks/Settings/DisplayAndBrightnessSettings.framework/DeviceAppearanceSchedule.loctable", "/System/Library/PrivateFrameworks/Settings/DisplayAndBrightnessSettings.framework/Display.loctable", "/System/Library/PrivateFrameworks/Settings/DisplayAndBrightnessSettings.framework/ExternalDisplays.loctable", "/System/Library/PrivateFrameworks/Settings/DisplayAndBrightnessSettings.framework/FineTune.loctable", "/System/Library/PrivateFrameworks/Settings/DisplayAndBrightnessSettings.framework/LargeFontsSettings.loctable", "/System/Library/PrivateFrameworks/Settings/DisplayAndBrightnessSettings.framework/Magnify.loctable", "/System/Library/PrivateFrameworks/Settings/GeneralSettingsUI.framework/About.loctable", "/System/Library/PrivateFrameworks/Settings/GeneralSettingsUI.framework/AutomaticContentDownload.loctable", "/System/Library/PrivateFrameworks/Settings/GeneralSettingsUI.framework/BackupAlert.loctable", "/System/Library/PrivateFrameworks/Settings/GeneralSettingsUI.framework/BackupInfo.loctable", "/System/Library/PrivateFrameworks/Settings/GeneralSettingsUI.framework/Date & Time.loctable", "/System/Library/PrivateFrameworks/Settings/GeneralSettingsUI.framework/General.loctable", "/System/Library/PrivateFrameworks/Settings/GeneralSettingsUI.framework/HomeButton-sshb.loctable", "/System/Library/PrivateFrameworks/Settings/GeneralSettingsUI.framework/Localizable.loctable", "/System/Library/PrivateFrameworks/Settings/GeneralSettingsUI.framework/LOTX.loctable", "/System/Library/PrivateFrameworks/Settings/GeneralSettingsUI.framework/Matter.loctable", "/System/Library/PrivateFrameworks/Settings/GeneralSettingsUI.framework/ModelNames.loctable", "/System/Library/PrivateFrameworks/Settings/GeneralSettingsUI.framework/Nfc.loctable", "/System/Library/PrivateFrameworks/Settings/GeneralSettingsUI.framework/Nfc.loctable", "/System/Library/PrivateFrameworks/Settings/GeneralSettingsUI.framework/Pointers.loctable", "/System/Library/PrivateFrameworks/Settings/GeneralSettingsUI.framework/Reset-Simulator.loctable", "/System/Library/PrivateFrameworks/Settings/GeneralSettingsUI.framework/Reset.loctable", "/System/Library/PrivateFrameworks/Settings/PrivacySettingsUI.framework/Privacy.loctable", "/System/Library/PrivateFrameworks/Settings/PrivacySettingsUI.framework/Almanac-ALMANAC.loctable", "/System/Library/PrivateFrameworks/Settings/PrivacySettingsUI.framework/AppleAdvertising.loctable", "/System/Library/PrivateFrameworks/Settings/PrivacySettingsUI.framework/AppReport.loctable", "/System/Library/PrivateFrameworks/Settings/PrivacySettingsUI.framework/Dim-Sum.loctable", "/System/Library/PrivateFrameworks/Settings/PrivacySettingsUI.framework/Localizable.loctable", "/System/Library/PrivateFrameworks/Settings/PrivacySettingsUI.framework/Location Services.loctable", "/System/Library/PrivateFrameworks/Settings/PrivacySettingsUI.framework/LocationServicesPrivacy.loctable", "/System/Library/PrivateFrameworks/Settings/PrivacySettingsUI.framework/LockdownMode.loctable", "/System/Library/PrivateFrameworks/Settings/PrivacySettingsUI.framework/Privacy.loctable", "/System/Library/PrivateFrameworks/Settings/PrivacySettingsUI.framework/Restrictions.loctable", "/System/Library/PrivateFrameworks/Settings/PrivacySettingsUI.framework/Safety.loctable", "/System/Library/PrivateFrameworks/Settings/PrivacySettingsUI.framework/Trackers.loctable", "System/Library/PrivateFrameworks/SettingsFoundation.framework/CountryOfOriginAssembledIn.loctable"])
    ]

    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(tweaks) { tweak in
                        HStack {
                            Text(tweak.name)
                            Spacer()
                            Image(systemName: selected.contains(tweak.id) ? "circle.fill" : "circle")
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            select(tweak: tweak)
                        }
                    }
                } footer: {
                    Text("Big thanks [jailbreak.party](https://github.com/jailbreakdotparty/dirtyZero)!\nNOTE: A lot of Tweaks currently dont work. This will probably be fixed in a future update.")
                }
            }
            .navigationTitle("DirtyZero")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Apply") {
                        apply()
                    }
                }
            }
            .onAppear {
                if let decoded = try? JSONDecoder().decode([String].self, from: selecteddata) {
                    selected = Set(decoded)
                }
            }
        }
    }
    
    func select(tweak: tweak) {
        if selected.contains(tweak.id) {
            selected.remove(tweak.id)
        } else {
            selected.insert(tweak.id)
        }
        
        selecteddata = (try? JSONEncoder().encode(Array(selected))) ?? Data()
    }

    func apply() {
        for tweak in tweaks where selected.contains(tweak.id) {
            for path in tweak.path {
                mgr.vfszeropage(at: path)
            }
        }
    }
}
*/
