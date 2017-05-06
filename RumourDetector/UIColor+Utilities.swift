import UIKit
extension UIColor {

    convenience init(hex: Int, alpha: CGFloat = 1.0) {
        let red: CGFloat = CGFloat((hex >> 16) & 0xff) / 255.0
        let green: CGFloat = CGFloat((hex >> 8) & 0xff) / 255.0
        let blue: CGFloat = CGFloat(hex & 0xff) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }

    static func imageBackgroundColor() -> UIColor {
            return UIColor(red:216/255.0,
                           green:216/255.0 ,
                           blue:216 / 255.0,
                           alpha:1.0)
    }

    static func imageViewTextColor() -> UIColor {
        return UIColor(red:51/255.0,
                       green:51/255.0 ,
                       blue:51 / 255.0,
                       alpha:1.0)
    }

    static func cellTitleTextColor() -> UIColor {
        return UIColor(red:154/255.0,
            green:165/255.0 ,
            blue:186.0 / 255.0,
            alpha:1.0)
    }

    static func appThemeGreyColor() -> UIColor {
        return UIColor(red:237/255.0,
                       green:237/255.0 ,
                       blue:237 / 255.0,
                       alpha:1.0)
    }

    static func appThemeLightGreyColor() -> UIColor {
        return UIColor(red:245/255.0,
                       green:245/255.0 ,
                       blue:245 / 255.0,
                       alpha:1.0)
    }

    static func setButtonColor() -> UIColor {
        return UIColor(red:0/255.0,
                       green:122/255.0 ,
                       blue:255 / 255.0,
                       alpha:1.0)
    }

    static func resetButtonColor() -> UIColor {
        return UIColor(red:164/255.0,
                       green:164/255.0 ,
                       blue:164 / 255.0,
                       alpha:1.0)
    }

    static func seperatorColor() -> UIColor {
        return UIColor(red:223/255.0,
                       green:223/255.0 ,
                       blue:223 / 255.0,
                       alpha:1.0)
    }

    static func dateColor() -> UIColor {
        return UIColor(red:67/255.0,
                       green:133/255.0 ,
                       blue:255 / 255.0,
                       alpha:1.0)
    }

    static func btnBorderColor() -> UIColor {
        return UIColor(red:235/255.0,
                       green:234/255.0 ,
                       blue:234 / 255.0,
                       alpha:1.0)
    }

    static func placeholderTextColor() -> UIColor {
        return UIColor(red:185/255.0,
                       green:185/255.0 ,
                       blue:185/255.0,
                       alpha:1.0)
    }

    static func textHighLightColor() -> UIColor {
        return UIColor(red:51/255.0,
                       green:51/255.0 ,
                       blue:51/255.0,
                       alpha:1.0)
    }

    static func themeTextColor() -> UIColor {
        return UIColor(red:102/255.0,
                       green:102/255.0 ,
                       blue:102/255.0,
                       alpha:1.0)
    }

    static func searchResultPrimaryTextColor() -> UIColor {
        return UIColor(red:51/255.0,
                       green:51/255.0 ,
                       blue:51/255.0,
                       alpha:1.0)
    }

    static func searchResultSecondaryTextColor() -> UIColor {
        return UIColor(red:131/255.0,
                       green:131/255.0 ,
                       blue:131/255.0,
                       alpha:1.0)
    }

    static func greyTextColor() -> UIColor {
        return UIColor(red:131/255.0,
                       green:131/255.0 ,
                       blue:131/255.0,
                       alpha:1.0)
    }

    static func darkGreyTextColor() -> UIColor {
        return UIColor(red:137/255.0,
                       green:137/255.0 ,
                       blue:137/255.0,
                       alpha:1.0)
    }

    static func normalTextColor() -> UIColor {
        return UIColor(red:74/255.0,
                       green:74/255.0 ,
                       blue:74/255.0,
                       alpha:1.0)
    }

    static func sectionHeaderTitleColor() -> UIColor {
        return UIColor(red:154/255.0,
                       green:165/255.0 ,
                       blue:186/255.0,
                       alpha:1.0)
    }

    static func cellSeparatorColor() -> UIColor {
        return UIColor(red:223/255.0,
                       green:223/255.0 ,
                       blue:223/255.0,
                       alpha:1.0)
    }
    static func loaderColor() -> UIColor {
        return UIColor(red:212/255.0,
                       green:175/255.0,
                       blue:55,
                       alpha:1.0)
    }
//    private var color1 = UIColor(red:0.98, green:0.43, blue:0.06, alpha:1.0)
//    private var color2 = UIColor(red:0.97, green:0.67, blue:0.13, alpha:1.0)
//    private var color3 = UIColor(red:0.85, green:0.11, blue:0.00, alpha:1.0)

    static func cellSeparatorDarkColor() -> UIColor {
        return UIColor(red:221/255.0,
                       green:221/255.0 ,
                       blue:221/255.0,
                       alpha:1.0)
    }

    static func segementSelectorColor() -> UIColor {
        return UIColor(red:67/255.0,
                       green:133/255.0 ,
                       blue:255/255.0,
                       alpha:1.0)
    }

    static func viewBackgroundColor() -> UIColor {
        return UIColor(red:250/255.0,
                       green:250/255.0 ,
                       blue:250/255.0,
                       alpha:1.0)
    }

    static func titleColor() -> UIColor {
        return UIColor(red:51/255.0,
                       green:51/255.0 ,
                       blue:51/255.0,
                       alpha:1.0)
    }

    static func infoTextColor() -> UIColor {
        return UIColor(red:131/255.0,
                       green:131/255.0 ,
                       blue:131/255.0,
                       alpha:1.0)
    }

    static func separatorColor() -> UIColor {
        return UIColor(red:221/255.0,
                       green:221/255.0 ,
                       blue:221/255.0,
                       alpha:1.0)
    }

    static func buttonTitleColor() -> UIColor {
        return UIColor(red:67/255.0,
                       green:133/255.0 ,
                       blue:255/255.0,
                       alpha:1.0)
    }

    static func viewBackgroundSemiTransparentColor() -> UIColor {
        return UIColor(red:58/255.0,
                       green:58/255.0 ,
                       blue:58/255.0,
                       alpha:0.5)
    }

    static func graphBackgroundColor() -> UIColor {
        return UIColor(red:230/255.0,
                       green:229/255.0 ,
                       blue:229/255.0,
                       alpha:1.0)
    }

    static func graphProgressgroundColor() -> UIColor {
        return UIColor(red:71/255.0,
                       green:136/255.0 ,
                       blue:251/255.0,
                       alpha:1.0)
    }

    static func topBannerBackgroundColor() -> UIColor {
        return UIColor(red:71/255.0,
                       green:89/255.0 ,
                       blue:125/255.0,
                       alpha:1.0)
    }

    static func mapPolygonBorderColor() -> UIColor {
        return UIColor(red:138/255.0,
                       green:200/255.0 ,
                       blue:236/255.0,
                       alpha:1.0)
    }

    static func mapPolygonDraggedBorderColor() -> UIColor {
        return UIColor(red:102/255.0,
                       green:204/255.0 ,
                       blue:0/255.0,
                       alpha:1.0)
    }

    static func sliderSelectedColor() -> UIColor {
        return UIColor(red:0/255.0,
                       green:136/255.0 ,
                       blue:255/255.0,
                       alpha:1.0)
    }

    static func stealthModeArrowColor() -> UIColor {
        return UIColor(red:255/255.0,
                       green:255/255.0 ,
                       blue:255/255.0,
                       alpha:1.0)
    }

    static func anchorAnnotationBorderColor() -> UIColor {
        return UIColor(red:131/255.0,
                       green:131/255.0 ,
                       blue:131/255.0,
                       alpha:1.0)
    }

    static func anchorAnnotationFillColor() -> UIColor {
        return UIColor(red:255/255.0,
                       green:255/255.0 ,
                       blue:255/255.0,
                       alpha:1.0)
    }

    static func graphFillColor() -> UIColor {
        return UIColor(red:255/255.0,
                       green:133/255.0 ,
                       blue:57/255.0,
                       alpha:1.0)
    }

    static func graphProspectColor() -> UIColor {
        return UIColor(red:66/255.0,
                       green:131/255.0 ,
                       blue:252/255.0,
                       alpha:1.0)
    }

    static func graphLeadsColor() -> UIColor {
        return UIColor(red:135/255.0,
                       green:231/255.0 ,
                       blue:78/255.0,
                       alpha:1.0)
    }

    static func houseIconColor() -> UIColor {
        return UIColor(red:125/255.0,
                       green:190/255.0 ,
                       blue:254/255.0,
                       alpha:1.0)
    }

    static func qvmValuationsBackgroundColor() -> UIColor {
        return UIColor(red:241/255.0,
                       green:238/255.0 ,
                       blue:232/255.0,
                       alpha:1.0)
    }

    static func graphGreyColor() -> UIColor {
        return UIColor(red:220/255.0,
                       green:220/255.0 ,
                       blue:220/255.0,
                       alpha:1.0)
    }

    static func annotationSelectionBackgroundColor() -> UIColor {
        return UIColor(red:66/255.0,
                       green:133/255.0 ,
                       blue:255/255.0,
                       alpha:0.4)
    }

    static func farmAnnotationForegroundColor() -> UIColor {
        return UIColor(red:67/255.0,
                       green:185/255.0 ,
                       blue:255/255.0,
                       alpha:1.0)
    }

    static func farmAnnotationForegroundUnlockedColor() -> UIColor {
        return UIColor(red:87.0/255.0,
                       green:111.0/255.0 ,
                       blue:133.0/255.0,
                       alpha:1.0)
    }

    static func farmAnnotationTranslucentBackgroundColor() -> UIColor {
        return UIColor(red:66/255.0,
                       green:185/255.0 ,
                       blue:255/255.0,
                       alpha:0.3)
    }

    static func farmAnnotationCountColor() -> UIColor {
        return UIColor(red:255/255.0,
                       green:255/255.0 ,
                       blue:255/255.0,
                       alpha:1.0)
    }

    static func farmAnnotationIconColor() -> UIColor {
        return UIColor(red:255/255.0,
                       green:255/255.0 ,
                       blue:255/255.0,
                       alpha:1.0)
    }

    static func selectedFarmPolygonBorderColor() -> UIColor {
        return UIColor(red:138/255.0,
                       green:200/255.0 ,
                       blue:236/255.0,
                       alpha:1.0)
    }

    static func selectedFarmPolygonLightFillColor() -> UIColor {
        return UIColor(red:138/255.0,
                       green:200/255.0 ,
                       blue:236/255.0,
                       alpha:0.1)
    }

    static func selectedFarmPolygonFillColor() -> UIColor {
        return UIColor(red:138/255.0,
                       green:200/255.0 ,
                       blue:236/255.0,
                       alpha:0.2)
    }

    static func unselectedFarmPolygonBorderColor() -> UIColor {
        return UIColor(red:138/255.0,
                       green:200/255.0 ,
                       blue:236/255.0,
                       alpha:0.8)
    }

    static func subTitleColor() -> UIColor {
        return UIColor(red:140/255.0,
                       green:140/255.0 ,
                       blue:140/255.0,
                       alpha:1.0)
    }

    static func walkingModeAnnotationSelectionColor() -> UIColor {
        return UIColor(red:66/255.0,
                       green:133/255.0 ,
                       blue:255/255.0,
                       alpha:0.4)
    }

    static func mapOverlayColor() -> UIColor {
        return UIColor(red:5/255.0,
                       green:29/255.0 ,
                       blue:65/255.0,
                       alpha:0.7)
    }

    static func coachMarkContentBackgroundColor() -> UIColor {
        return UIColor(red:0/255.0,
                       green:136/255.0 ,
                       blue:255/255.0,
                       alpha:1)
    }

    static func foregroundFeatureCardBackgroundColor() -> UIColor {
        return UIColor(red:239/255.0,
                       green:240/255.0 ,
                       blue:243/255.0,
                       alpha:1)
    }

    static func farmListSeparatorColor() -> UIColor {
        return UIColor(red:228/255.0,
                       green:228/255.0 ,
                       blue:228/255.0,
                       alpha:1)
    }

    static func propertiesClusterCoreColor() -> UIColor {
        return UIColor(red:149/255.0,
                       green:162/255.0 ,
                       blue:186/255.0,
                       alpha:1)
    }

    static func propertiesClusterSelectedCoreColor() -> UIColor {
        return UIColor(red:113/255.0,
                       green:123/255.0 ,
                       blue:141/255.0,
                       alpha:1)
    }

    static func propertiesClusterBackgroundColor() -> UIColor {
        return UIColor(red:255/255.0,
                       green:255/255.0 ,
                       blue:255/255.0,
                       alpha:1)
    }

    static func propertiesClusterBorderColor() -> UIColor {
        return UIColor(red:206/255.0,
                       green:206/255.0 ,
                       blue:206/255.0,
                       alpha:1)
    }

    static func propertiesClusterPropertiesCountColor() -> UIColor {
        return UIColor(red:255/255.0,
                       green:255/255.0 ,
                       blue:255/255.0,
                       alpha:1)
    }

    static func currentLocationTextColor() -> UIColor {
        return UIColor(red:67/255.0,
                       green:133/255.0 ,
                       blue:255/255.0,
                       alpha:1.0)
    }

    static func otherLocationTextColor() -> UIColor {
        return UIColor(red:0,
                       green:0 ,
                       blue:0,
                       alpha:1.0)
    }
}

extension String{
    var length: Int {
        return self.characters.count
    }

    var words: [String]{
        return self.components(separatedBy: " ")
    }
    
}
