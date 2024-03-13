import Foundation

struct ImagesResponse: Decodable {
    let backdrops: [Image]
    let id: Int
    let logos, posters: [Image]
}

// MARK: - Backdrop
struct Image: Decodable {
    let aspectRatio: Double
    let height: Int
    let iso639_1: String?
    let filePath: String?
    let voteAverage: Double
    let voteCount, width: Int

    enum CodingKeys: String, CodingKey {
        case aspectRatio = "aspect_ratio"
        case height
        case iso639_1 = "iso_639_1"
        case filePath = "file_path"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case width
    }
}

//struct ImagesResponse : Decodable{
//   // let backdrops: [Image]
//   // let id: Int
//    let /*logos,*/ posters: [Image]
//}
//
//// MARK: - Backdrop
//struct Image : Decodable{
////    let aspectRatio: Double
////    let height: Int
////    let iso639_1: String?
//    let filePath: String
////    let voteAverage: Double
////    let voteCount, width: Int
//}
