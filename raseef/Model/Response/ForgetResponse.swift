import Foundation

// MARK: - Welcome
struct ForgetResponse: Codable {
    let token, email: String
    let success: Bool
    let message: String
}
