//
//  ArtistResponse.swift
//  SoundsBinder
//
//  Created by Patrick Wiley on 28.12.21.
//

import Foundation

// MARK: - ArtistsResponse
struct ArtistsResponse: Codable {
    let data: [Datum]?
    let total: Int?
    let next: String?
}

// MARK: - Datum
struct Datum: Codable {
    let id: String?
    let readable: Bool?
    let title, titleShort: String?
    let titleVersion: TitleVersion?
    let link: String?
    let duration, rank: String?
    let explicitLyrics: Bool?
    let explicitContentLyrics, explicitContentCover: Int?
    let preview: String?
    let md5Image: String?
    let artist: Artist?
    let album: Album?
    let type: DatumType?

    enum CodingKeys: String, CodingKey {
        case id, readable, title
        case titleShort = "title_short"
        case titleVersion = "title_version"
        case link, duration, rank
        case explicitLyrics = "explicit_lyrics"
        case explicitContentLyrics = "explicit_content_lyrics"
        case explicitContentCover = "explicit_content_cover"
        case preview
        case md5Image = "md5_image"
        case artist, album, type
    }
}

// MARK: - Album
struct Album: Codable {
    let id, title: String?
    let cover: String?
    let coverSmall, coverMedium, coverBig, coverXl: String?
    let md5Image: String?
    let tracklist: String?
    let type: AlbumType?

    enum CodingKeys: String, CodingKey {
        case id, title, cover
        case coverSmall = "cover_small"
        case coverMedium = "cover_medium"
        case coverBig = "cover_big"
        case coverXl = "cover_xl"
        case md5Image = "md5_image"
        case tracklist, type
    }
}

enum AlbumType: String, Codable {
    case album = "album"
}

// MARK: - Artist
struct Artist: Codable {
    let id: String?
    let name: Name?
    let link, picture: String?
    let pictureSmall, pictureMedium, pictureBig, pictureXl: String?
    let tracklist: String?
    let type: ArtistType?

    enum CodingKeys: String, CodingKey {
        case id, name, link, picture
        case pictureSmall = "picture_small"
        case pictureMedium = "picture_medium"
        case pictureBig = "picture_big"
        case pictureXl = "picture_xl"
        case tracklist, type
    }
}

enum Name: String, Codable {
    case eminem = "Eminem"
    case juiceWrld = "Juice Wrld"
}

enum ArtistType: String, Codable {
    case artist = "artist"
}

enum TitleVersion: String, Codable {
    case empty = ""
    case from8MileSoundtrack = "(From \"8 Mile\" Soundtrack)"
    case musicFromTheMotionPicture = "(Music From The Motion Picture)"
    case soundtrackVersion = "(Soundtrack Version)"
}

enum DatumType: String, Codable {
    case track = "track"
}
