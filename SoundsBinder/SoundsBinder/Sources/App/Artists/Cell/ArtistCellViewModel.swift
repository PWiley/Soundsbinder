//
//  ArtistCellViewModel.swift
//  SoundsBinder
//
//  Created by Patrick Wiley on 08.04.22.
//

import Foundation

struct ArtistCellViewModel {
    
   let name: String
   let imageURL: URL

   init(visibleArtist: VisibleArtist) {
      self.name = visibleArtist.name
       self.imageURL = URL(string: visibleArtist.pictureURLString!)! // TODO
   }
  
}
