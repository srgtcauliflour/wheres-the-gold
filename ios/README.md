# My Last 20 Bucks — iPhone edition

This is a native SwiftUI iPhone shell embedding a **locally packaged** copy of the existing game in WKWebView. It does not connect to the live GitHub Pages website during play.

## Build locally
1. Install Xcode and XcodeGen (`brew install xcodegen`).
2. From the repository root run `bash ios/scripts/prepare-web.sh`.
3. Run `cd ios && xcodegen generate && open Last20GoldRush.xcodeproj`.
4. Select your Apple development team in Signing & Capabilities and build to an iPhone.

The GitHub Actions workflow can compile an **unsigned simulator build** without Apple credentials. Device/TestFlight/App Store builds require Apple signing and App Store Connect setup.

## Release readiness
- Create an original AppIcon asset set and screenshots.
- Test all game flows, local assets, audio and haptics on physical iPhones.
- Configure bundle ID, signing, provisioning and App Store Connect.
- Provide privacy details, support URL, content rating and simulated-gambling disclosures.
- Consider native functionality beyond the web shell for App Review guideline 4.2.
- No real-money wagering, deposits or cash redemption.
