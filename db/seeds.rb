# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database
# with its default values. The data can then be loaded with the rake db:seed (or
# created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require_relative '../summa-parser/load'

include TitleParser

printf("Loading summa data from file\n")
summa = load
db_summa = SummaTheologica.create
db_parts = []
summa.parts.each do |part|
  printf("Processing part: %s\n", part.title)
  article_number_in_part = 1
  db_part = Part.create(title: format_title(part.title), prologue: part.prologue,
                        summa_theologica: db_summa)
  db_treatises = []
  part.treatises.each do |treatise|
    printf("Processing treatise: %s\n", treatise.title)
    article_number_in_treatise = 1
    db_treatise = Treatise.create(title: format_title(treatise.title),
                                  prologue: treatise.prologue,
                                  part: db_part)
    db_questions = []
    treatise.questions.each do |question|
      article_number_in_question = 1
      db_question = Question.create(title: format_title(question.title),
                                    content: question.content,
                                    treatise: db_treatise)
      db_articles = []
      question.articles.each do |article|
        objection_statements = []
        objection_replies = []
        article.objections.each do |objection|
          objection_statements.push(objection.statement)
          objection_replies.push(objection.reply)
        end

        db_article = Article.create(title: article.title,
                                    contrary: article.contrary,
                                    answer: article.answer,
                                    question: db_question,
                                    objection_statements: objection_statements,
                                    objection_replies: objection_replies)

        context = Context.create(part: db_part,
                                 treatise: db_treatise,
                                 question: db_question,
                                 number_in_part: article_number_in_part,
                                 number_in_treatise: article_number_in_treatise,
                                 number_in_question: article_number_in_question)
        db_article.context = context
        article_number_in_part += 1
        article_number_in_treatise += 1
        article_number_in_question += 1

        db_articles.push(db_article)
      end
      db_question.articles = db_articles
      db_question.number_of_articles = article_number_in_question - 1
      db_question.save
      db_questions.push(db_question)
    end
    db_treatise.questions = db_questions
    db_treatise.number_of_articles = article_number_in_treatise - 1
    db_treatise.save
    db_treatises.push(db_treatise)
  end
  db_part.treatises = db_treatises
  db_part.number_of_articles = article_number_in_part - 1
  db_part.save
  db_parts.push(db_part)
end
db_summa.parts = db_parts
