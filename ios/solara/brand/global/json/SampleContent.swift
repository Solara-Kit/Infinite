// Generated by Solara
import Foundation
import UIKit


class MySampleContent: Codable {
  let example: String
  let asJson: String = "{\"example\":\"Example\"}"
  init(example: String) {
    self.example = example
  }

  static let shared = MySampleContent(
    example: "Example"
  )

  private enum CodingKeys: String, CodingKey {
      case example
  }

  func toJson() -> String? {
    let encoder = JSONEncoder()
    if let jsonData = try? encoder.encode(self) {
      return String(data: jsonData, encoding: .utf8)
    }
    return nil
  }

  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.example = try container.decode(String.self, forKey: .example)
  }

  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(example, forKey: .example)
  }

  static func fromJson(_ json: String) -> MySampleContent? {
    let decoder = JSONDecoder()
    if let jsonData = json.data(using: .utf8),
       let result = try? decoder.decode(MySampleContent.self, from: jsonData) {
      return result
    }
    return nil
  }
}

private extension UIColor {
    convenience init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }

    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0

        getRed(&r, green: &g, blue: &b, alpha: &a)

        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0

        return String(format: "#%06x", rgb)
    }
}

