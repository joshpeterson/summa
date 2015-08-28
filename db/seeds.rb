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
  articleNumberInPart = 1
  dbPart = Part.create(title: part.title, prologue: part.prologue,
                       summa_theologica: dbSumma)
  dbTreatises = Array.new
  for treatise in part.treatises
    printf("Processing treatise: %s\n", treatise.title)
    articleNumberInTreatise = 1
    dbTreatise = Treatise.create(title: treatise.title,
                                 prologue: treatise.prologue,
                                 part: dbPart)
    dbQuestions = Array.new
    for question in treatise.questions
      articleNumberInQuestion = 1
      dbQuestion = Question.create(title: question.title,
                                   content: question.content,
                                   treatise: dbTreatise)
      dbArticles = Array.new
      for article in question.articles
        dbArticle = Article.create(title: article.title,
                                   contrary: article.contrary,
                                   answer: article.answer,
                                   question: dbQuestion)

        context = Context.create(part: dbPart,
                                 treatise: dbTreatise,
                                 question: dbQuestion,
                                 number_in_part: articleNumberInPart,
                                 number_in_treatise: articleNumberInTreatise,
                                 number_in_question: articleNumberInQuestion)
        dbArticle.context = context
        articleNumberInPart += 1
        articleNumberInTreatise += 1
        articleNumberInQuestion += 1

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
      dbQuestion.number_of_articles = articleNumberInQuestion
      dbQuestion.save
      dbQuestions.push(dbQuestion)
    end
    dbTreatise.questions = dbQuestions
    dbTreatise.number_of_articles = articleNumberInTreatise
    dbTreatise.save
    dbTreatises.push(dbTreatise)
  end
  dbPart.treatises = dbTreatises
  dbPart.number_of_articles = articleNumberInPart
  dbPart.save
  dbParts.push(dbPart)
end
dbSumma.parts = dbParts
