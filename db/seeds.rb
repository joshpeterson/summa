# This file should contain all the record creation needed to seed the database
# with its default values. The data can then be loaded with the rake db:seed (or
# created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require_relative '../summa-parser/load.rb'

print "Loading summa data from file\n"
summa = load()
dbSumma = SummaTheologica.create
dbParts = Array.new
for part in summa.parts
  printf("Processing part: %s\n", part.title)
  dbPart = Part.create(title: part.title, prologue: part.prologue,
                       summa_theologica: dbSumma)
  dbTreatises = Array.new
  for treatise in part.treatises
    printf("Processing treatise: %s\n", treatise.title)
    dbTreatise = Treatise.create(title: treatise.title,
                                 prologue: treatise.prologue,
                                 part: dbPart)
    dbQuestions = Array.new
    for question in treatise.questions
      dbQuestion = Question.create(title: question.title,
                                   content: question.content,
                                   treatise: dbTreatise)
      dbArticles = Array.new
      for article in question.articles
        dbArticle = Article.create(title: article.title,
                                   contrary: article.contrary,
                                   answer: article.answer,
                                   question: dbQuestion)
        context = Context.create(part: dbPart, treatise: dbTreatise,
                                 question: dbQuestion)
        dbArticle.context = context
        dbObjections = Array.new
        for objection in article.objections
          dbObjection = Objection.create(statement: objection.statement,
                                         reply: objection.reply,
                                         article: dbArticle)
          dbObjections.push(dbObjection)
        end
        dbArticle.objections = dbObjections
        dbArticles.push(dbArticle)
      end
      dbQuestion.articles = dbArticles
      dbQuestions.push(dbQuestion)
    end
    dbTreatise.questions = dbQuestions
    dbTreatises.push(dbTreatise)
  end
  dbPart.treatises = dbTreatises
  dbParts.push(dbPart)
end
dbSumma.parts = dbParts
