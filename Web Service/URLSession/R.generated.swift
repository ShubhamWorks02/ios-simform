//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import RswiftResources
import UIKit

private class BundleFinder {}
let R = _R(bundle: Bundle(for: BundleFinder.self))

struct _R {
  let bundle: Foundation.Bundle

  let reuseIdentifier = reuseIdentifier()

  var color: color { .init(bundle: bundle) }
  var image: image { .init(bundle: bundle) }
  var info: info { .init(bundle: bundle) }
  var nib: nib { .init(bundle: bundle) }
  var storyboard: storyboard { .init(bundle: bundle) }

  func color(bundle: Foundation.Bundle) -> color {
    .init(bundle: bundle)
  }
  func image(bundle: Foundation.Bundle) -> image {
    .init(bundle: bundle)
  }
  func info(bundle: Foundation.Bundle) -> info {
    .init(bundle: bundle)
  }
  func nib(bundle: Foundation.Bundle) -> nib {
    .init(bundle: bundle)
  }
  func storyboard(bundle: Foundation.Bundle) -> storyboard {
    .init(bundle: bundle)
  }
  func validate() throws {
    try self.nib.validate()
    try self.storyboard.validate()
  }

  struct project {
    let developmentRegion = "en"
  }

  /// This `_R.color` struct is generated, and contains static references to 4 colors.
  struct color {
    let bundle: Foundation.Bundle

    /// Color `AccentColor`.
    var accentColor: RswiftResources.ColorResource { .init(name: "AccentColor", path: [], bundle: bundle) }

    /// Color `formFontColor`.
    var formFontColor: RswiftResources.ColorResource { .init(name: "formFontColor", path: [], bundle: bundle) }

    /// Color `tableTheme`.
    var tableTheme: RswiftResources.ColorResource { .init(name: "tableTheme", path: [], bundle: bundle) }

    /// Color `themeColor`.
    var themeColor: RswiftResources.ColorResource { .init(name: "themeColor", path: [], bundle: bundle) }
  }

  /// This `_R.image` struct is generated, and contains static references to 12 images.
  struct image {
    let bundle: Foundation.Bundle

    /// Image `EditProfile`.
    var editProfile: RswiftResources.ImageResource { .init(name: "EditProfile", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `camera`.
    var camera: RswiftResources.ImageResource { .init(name: "camera", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `homeImg`.
    var homeImg: RswiftResources.ImageResource { .init(name: "homeImg", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `imgBack`.
    var imgBack: RswiftResources.ImageResource { .init(name: "imgBack", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `imgTick`.
    var imgTick: RswiftResources.ImageResource { .init(name: "imgTick", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `imgback2`.
    var imgback2: RswiftResources.ImageResource { .init(name: "imgback2", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `offToggle`.
    var offToggle: RswiftResources.ImageResource { .init(name: "offToggle", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `onToggle`.
    var onToggle: RswiftResources.ImageResource { .init(name: "onToggle", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `profile`.
    var profile: RswiftResources.ImageResource { .init(name: "profile", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `profileImg`.
    var profileImg: RswiftResources.ImageResource { .init(name: "profileImg", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `sampleImg`.
    var sampleImg: RswiftResources.ImageResource { .init(name: "sampleImg", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `starShot`.
    var starShot: RswiftResources.ImageResource { .init(name: "starShot", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }
  }

  /// This `_R.info` struct is generated, and contains static references to 1 properties.
  struct info {
    let bundle: Foundation.Bundle
    var uiApplicationSceneManifest: uiApplicationSceneManifest { .init(bundle: bundle) }

    func uiApplicationSceneManifest(bundle: Foundation.Bundle) -> uiApplicationSceneManifest {
      .init(bundle: bundle)
    }

    struct uiApplicationSceneManifest {
      let bundle: Foundation.Bundle

      let uiApplicationSupportsMultipleScenes: Bool = false

      var _key: String { bundle.infoDictionaryString(path: ["UIApplicationSceneManifest"], key: "_key") ?? "UIApplicationSceneManifest" }
      var uiSceneConfigurations: uiSceneConfigurations { .init(bundle: bundle) }

      func uiSceneConfigurations(bundle: Foundation.Bundle) -> uiSceneConfigurations {
        .init(bundle: bundle)
      }

      struct uiSceneConfigurations {
        let bundle: Foundation.Bundle
        var _key: String { bundle.infoDictionaryString(path: ["UIApplicationSceneManifest", "UISceneConfigurations"], key: "_key") ?? "UISceneConfigurations" }
        var uiWindowSceneSessionRoleApplication: uiWindowSceneSessionRoleApplication { .init(bundle: bundle) }

        func uiWindowSceneSessionRoleApplication(bundle: Foundation.Bundle) -> uiWindowSceneSessionRoleApplication {
          .init(bundle: bundle)
        }

        struct uiWindowSceneSessionRoleApplication {
          let bundle: Foundation.Bundle
          var defaultConfiguration: defaultConfiguration { .init(bundle: bundle) }

          func defaultConfiguration(bundle: Foundation.Bundle) -> defaultConfiguration {
            .init(bundle: bundle)
          }

          struct defaultConfiguration {
            let bundle: Foundation.Bundle
            var uiSceneConfigurationName: String { bundle.infoDictionaryString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication"], key: "UISceneConfigurationName") ?? "Default Configuration" }
            var uiSceneDelegateClassName: String { bundle.infoDictionaryString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication"], key: "UISceneDelegateClassName") ?? "$(PRODUCT_MODULE_NAME).SceneDelegate" }
            var uiSceneStoryboardFile: String { bundle.infoDictionaryString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication"], key: "UISceneStoryboardFile") ?? "Kt" }
          }
        }
      }
    }
  }

  /// This `_R.nib` struct is generated, and contains static references to 3 nibs.
  struct nib {
    let bundle: Foundation.Bundle

    /// Nib `DeleteTableViewCell`.
    var deleteTableViewCell: RswiftResources.NibReference<DeleteTableViewCell> { .init(name: "DeleteTableViewCell", bundle: bundle) }

    /// Nib `ExpandableTableViewCell`.
    var expandableTableViewCell: RswiftResources.NibReferenceReuseIdentifier<ExpandableTableViewCell, ExpandableTableViewCell> { .init(name: "ExpandableTableViewCell", bundle: bundle, identifier: "ExpandableTableViewCell") }

    /// Nib `UserTableViewCell`.
    var userTableViewCell: RswiftResources.NibReferenceReuseIdentifier<UserTableViewCell, UserTableViewCell> { .init(name: "UserTableViewCell", bundle: bundle, identifier: "UserTableViewCell") }

    func validate() throws {
      if UIKit.UIImage(named: "homeImg", in: bundle, compatibleWith: nil) == nil { throw RswiftResources.ValidationError("[R.swift] Image named 'homeImg' is used in nib 'DeleteTableViewCell', but couldn't be loaded.") }
      if UIKit.UIImage(named: "sampleImg", in: bundle, compatibleWith: nil) == nil { throw RswiftResources.ValidationError("[R.swift] Image named 'sampleImg' is used in nib 'UserTableViewCell', but couldn't be loaded.") }
      if UIKit.UIColor(named: "formFontColor", in: bundle, compatibleWith: nil) == nil { throw RswiftResources.ValidationError("[R.swift] Color named 'formFontColor' is used in nib 'UserTableViewCell', but couldn't be loaded.") }
      if UIKit.UIColor(named: "tableTheme", in: bundle, compatibleWith: nil) == nil { throw RswiftResources.ValidationError("[R.swift] Color named 'tableTheme' is used in nib 'UserTableViewCell', but couldn't be loaded.") }
    }
  }

  /// This `_R.reuseIdentifier` struct is generated, and contains static references to 2 reuse identifiers.
  struct reuseIdentifier {

    /// Reuse identifier `ExpandableTableViewCell`.
    let expandableTableViewCell: RswiftResources.ReuseIdentifier<ExpandableTableViewCell> = .init(identifier: "ExpandableTableViewCell")

    /// Reuse identifier `UserTableViewCell`.
    let userTableViewCell: RswiftResources.ReuseIdentifier<UserTableViewCell> = .init(identifier: "UserTableViewCell")
  }

  /// This `_R.storyboard` struct is generated, and contains static references to 5 storyboards.
  struct storyboard {
    let bundle: Foundation.Bundle
    var exchange: exchange { .init(bundle: bundle) }
    var kt: kt { .init(bundle: bundle) }
    var launchScreen: launchScreen { .init(bundle: bundle) }
    var main: main { .init(bundle: bundle) }
    var news: news { .init(bundle: bundle) }

    func exchange(bundle: Foundation.Bundle) -> exchange {
      .init(bundle: bundle)
    }
    func kt(bundle: Foundation.Bundle) -> kt {
      .init(bundle: bundle)
    }
    func launchScreen(bundle: Foundation.Bundle) -> launchScreen {
      .init(bundle: bundle)
    }
    func main(bundle: Foundation.Bundle) -> main {
      .init(bundle: bundle)
    }
    func news(bundle: Foundation.Bundle) -> news {
      .init(bundle: bundle)
    }
    func validate() throws {
      try self.exchange.validate()
      try self.kt.validate()
      try self.launchScreen.validate()
      try self.main.validate()
      try self.news.validate()
    }


    /// Storyboard `Exchange`.
    struct exchange: RswiftResources.StoryboardReference {
      let bundle: Foundation.Bundle

      let name = "Exchange"

      var downloadVc: RswiftResources.StoryboardViewControllerIdentifier<DownloadVc> { .init(identifier: "DownloadVc", storyboard: name, bundle: bundle) }
      var imageUploadVc: RswiftResources.StoryboardViewControllerIdentifier<ImageUploadVc> { .init(identifier: "ImageUploadVc", storyboard: name, bundle: bundle) }

      func validate() throws {
        if downloadVc() == nil { throw RswiftResources.ValidationError("[R.swift] ViewController with identifier 'downloadVc' could not be loaded from storyboard 'Exchange' as 'DownloadVc'.") }
        if imageUploadVc() == nil { throw RswiftResources.ValidationError("[R.swift] ViewController with identifier 'imageUploadVc' could not be loaded from storyboard 'Exchange' as 'ImageUploadVc'.") }
      }
    }

    /// Storyboard `Kt`.
    struct kt: RswiftResources.StoryboardReference, RswiftResources.InitialControllerContainer {
      typealias InitialController = UIKit.UINavigationController

      let bundle: Foundation.Bundle

      let name = "Kt"

      var editProfileVc: RswiftResources.StoryboardViewControllerIdentifier<EditProfileVc> { .init(identifier: "EditProfileVc", storyboard: name, bundle: bundle) }
      var profileVc: RswiftResources.StoryboardViewControllerIdentifier<ProfileVc> { .init(identifier: "ProfileVc", storyboard: name, bundle: bundle) }

      func validate() throws {
        if UIKit.UIImage(named: "EditProfile", in: bundle, compatibleWith: nil) == nil { throw RswiftResources.ValidationError("[R.swift] Image named 'EditProfile' is used in storyboard 'Kt', but couldn't be loaded.") }
        if UIKit.UIImage(named: "offToggle", in: bundle, compatibleWith: nil) == nil { throw RswiftResources.ValidationError("[R.swift] Image named 'offToggle' is used in storyboard 'Kt', but couldn't be loaded.") }
        if UIKit.UIImage(named: "onToggle", in: bundle, compatibleWith: nil) == nil { throw RswiftResources.ValidationError("[R.swift] Image named 'onToggle' is used in storyboard 'Kt', but couldn't be loaded.") }
        if UIKit.UIImage(named: "profile", in: bundle, compatibleWith: nil) == nil { throw RswiftResources.ValidationError("[R.swift] Image named 'profile' is used in storyboard 'Kt', but couldn't be loaded.") }
        if UIKit.UIColor(named: "formFontColor", in: bundle, compatibleWith: nil) == nil { throw RswiftResources.ValidationError("[R.swift] Color named 'formFontColor' is used in storyboard 'Kt', but couldn't be loaded.") }
        if UIKit.UIColor(named: "tableTheme", in: bundle, compatibleWith: nil) == nil { throw RswiftResources.ValidationError("[R.swift] Color named 'tableTheme' is used in storyboard 'Kt', but couldn't be loaded.") }
        if UIKit.UIColor(named: "themeColor", in: bundle, compatibleWith: nil) == nil { throw RswiftResources.ValidationError("[R.swift] Color named 'themeColor' is used in storyboard 'Kt', but couldn't be loaded.") }
        if editProfileVc() == nil { throw RswiftResources.ValidationError("[R.swift] ViewController with identifier 'editProfileVc' could not be loaded from storyboard 'Kt' as 'EditProfileVc'.") }
        if profileVc() == nil { throw RswiftResources.ValidationError("[R.swift] ViewController with identifier 'profileVc' could not be loaded from storyboard 'Kt' as 'ProfileVc'.") }
      }
    }

    /// Storyboard `LaunchScreen`.
    struct launchScreen: RswiftResources.StoryboardReference, RswiftResources.InitialControllerContainer {
      typealias InitialController = UIKit.UIViewController

      let bundle: Foundation.Bundle

      let name = "LaunchScreen"
      func validate() throws {

      }
    }

    /// Storyboard `Main`.
    struct main: RswiftResources.StoryboardReference {
      let bundle: Foundation.Bundle

      let name = "Main"

      var viewController: RswiftResources.StoryboardViewControllerIdentifier<ViewController> { .init(identifier: "ViewController", storyboard: name, bundle: bundle) }

      func validate() throws {
        if viewController() == nil { throw RswiftResources.ValidationError("[R.swift] ViewController with identifier 'viewController' could not be loaded from storyboard 'Main' as 'ViewController'.") }
      }
    }

    /// Storyboard `News`.
    struct news: RswiftResources.StoryboardReference, RswiftResources.InitialControllerContainer {
      typealias InitialController = ExpandableViewController

      let bundle: Foundation.Bundle

      let name = "News"

      var expandableViewController: RswiftResources.StoryboardViewControllerIdentifier<ExpandableViewController> { .init(identifier: "ExpandableViewController", storyboard: name, bundle: bundle) }

      func validate() throws {
        if expandableViewController() == nil { throw RswiftResources.ValidationError("[R.swift] ViewController with identifier 'expandableViewController' could not be loaded from storyboard 'News' as 'ExpandableViewController'.") }
      }
    }
  }
}