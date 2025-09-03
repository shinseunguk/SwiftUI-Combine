//
//  SwiftDataView.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 9/2/25.
//

import SwiftUI
import SwiftData

@Model
class Todo {
    var title: String
    var isCompleted: Bool

    init(title: String, isCompleted: Bool = false) {
        self.title = title
        self.isCompleted = isCompleted
    }
}

struct SwiftDataView: View {
    @Environment(\.modelContext) private var context   // SwiftData 컨텍스트
    @Query var todos: [Todo]

    var body: some View {
        VStack {
            List(todos) { todo in
                HStack {
                    Text(todo.title)
                    Spacer()
                    if todo.isCompleted {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundStyle(.green)
                    }
                }
            }

            Button("샘플 데이터 추가") {
                let newTodo = Todo(title: "새로운 할 일")
                context.insert(newTodo)   // 삽입
                // 저장은 자동으로 처리되지만, 수동 저장도 가능
                // try? context.save()
            }
            .padding()
        }
    }
}


#Preview {
    SwiftDataView()
        .modelContainer(for: Todo.self, inMemory: true) // 메모리 DB
}
