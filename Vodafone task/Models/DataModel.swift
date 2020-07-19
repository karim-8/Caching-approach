import Foundation
import RealmSwift

class DataModel: Object,Codable {
   @objc dynamic var name: String
   @objc dynamic var email:String
}
