//
//  Playlist.swift
//  Productive+
//
//  Created by scholar on 8/16/23.
//

import SwiftUI

struct Playlist: View {
    var body: some View {
        Image("playlist")
            .resizable(resizingMode: .stretch)
            .aspectRatio(contentMode: .fit)
    }
}

struct Playlist_Previews: PreviewProvider {
    static var previews: some View {
        Playlist()
    }
}
