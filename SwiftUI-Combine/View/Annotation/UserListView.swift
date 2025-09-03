//
//  UserListView.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 9/2/25.
//

import SwiftUI
import CoreData

struct UserListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    // Core Data에서 User 엔티티 가져오기
    @FetchRequest(
        entity: User.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \User.name, ascending: true)]
    ) var users: FetchedResults<CDUser>
    
    @State private var newName: String = ""
    
    var body: some View {
        VStack {
            // 입력창 & 추가 버튼
            HStack {
                TextField("이름 입력", text: $newName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("추가") {
                    addUser()
                }
            }
            .padding()
            
            // Core Data에서 가져온 User 리스트 표시
            List {
                ForEach(users) { user in
                    Text(user.name ?? "이름 없음")
                }
                .onDelete(perform: deleteUser)
            }
        }
    }
    
    // Core Data에 User 추가
    private func addUser() {
        let newUser = CDUser(context: viewContext)
        newUser.name = newName
        
        saveContext()
        newName = ""
    }
    
    // Core Data에서 User 삭제
    private func deleteUser(at offsets: IndexSet) {
        offsets.map { users[$0] }.forEach(viewContext.delete)
        saveContext()
    }
    
    // context 저장
    private func saveContext() {
        do {
            try viewContext.save()
        } catch {
            print("저장 실패: \(error)")
        }
    }
}
