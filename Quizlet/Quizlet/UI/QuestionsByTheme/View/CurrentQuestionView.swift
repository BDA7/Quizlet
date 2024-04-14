//
//  CurrentQuestionView.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 14.04.2024.
//

import SwiftUI

struct CurrentQuestionView: View {
    let currentQuestion: QuestionModel
    @Binding var score: Int
    @Binding var currentPage: Int
    
    var body: some View {
        VStack {
            titleQuestionView
            answersView
        }
    }
    
    private var titleQuestionView: some View {
        HStack {
            Spacer()
            Text(currentQuestion.title)
                .foregroundStyle(.black)
                .font(.title)
            Spacer()
        }
    }
    
    private var answersView: some View {
        VStack {
            makeAnswerCell(text: currentQuestion.correctAnswer)
            makeAnswerCell(text: currentQuestion.incorrectAnswer)
            makeAnswerCell(text: currentQuestion.incorrectAnswerTwo)
        }
    }
    
    private func makeAnswerCell(text: String) -> some View {
        return Button(
            action: {
                if text == currentQuestion.correctAnswer {
                    score += 1
                }
                currentPage += 1
            },
            label: {
                HStack {
                    Spacer()
                    Text(text)
                        .foregroundStyle(.black)
                        .font(.headline)
                    Spacer()
                }
            }
        )
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16.0)
                .fill(.white)
        )
        .shadow(radius: 1)
    }
}

#Preview {
    CurrentQuestionView(
        currentQuestion: QuestionModel(
            title: "Какой-то вопрос", correctAnswer: "Верный ответ",
            incorrectAnswer: "неверный ответ", incorrectAnswerTwo: "Неверный ответ 2", themeId: 0
        ), 
        score: .constant(0), currentPage: .constant(0)
    )
}
