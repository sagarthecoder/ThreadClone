//
//  UserContentListView.swift
//  ThreadClone
//
//  Created by Sagar Chandra Das on 14/4/25.
//

import SwiftUI

struct UserContentListView: View {
    
    @Binding var selectedFilter: ProfileThreadFilter
    @Namespace var animation
    var profileFilterWidth : CGFloat  {
        let count = CGFloat(max(1, ProfileThreadFilter.allCases.count))
        return UIScreen.main.bounds.width / count - 16
    }
    
    var body: some View {
        HStack {
            
            ForEach(ProfileThreadFilter.allCases) { filter in
                VStack {
                    Text(filter.title)
                        .font(.subheadline)
                        .fontWeight(filter == selectedFilter ? .semibold : .regular)
                    if filter == selectedFilter {
                        Capsule()
                            .frame(width : profileFilterWidth, height : 1.5)
                            .foregroundStyle(.black)
                            .matchedGeometryEffect(id: "underline", in: animation)
                    } else {
                        Color.clear
                            .frame(width : profileFilterWidth, height : 1.5)
                    }
                    
                }
                .onTapGesture {
                    withAnimation(.spring()) {
                        selectedFilter = filter
                    }
                }
            }
            
        }
        .padding(.top, 8)
    }
}
