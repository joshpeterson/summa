require "minitest/autorun"
require_relative "article_parser"

class TestArticleParser < Minitest::Test
	def setup
		@parser = ArticleParser.new $article
	end

	def test_VerifyArticleTitle
		expected_title = "Whether, besides philosophy, any further doctrine is required?"
		assert_equal expected_title, @parser.article.title
	end

	def test_VerifyArticleContrary
		expected_contrary = %{On the contrary, It is written (2 Tim. 3:16): "All Scripture, inspired of God is profitable to teach, to reprove, to correct, to instruct in justice." Now Scripture, inspired of God, is no part of philosophical science, which has been built up by human reason. Therefore it is useful that besides philosophical science, there should be other knowledge, i.e. inspired of God.}
		assert_equal expected_contrary, @parser.article.contrary
	end

	def test_VerifyArticleAnswer
		expected_answer = %{I answer that, It was necessary for man's salvation that there should be a knowledge revealed by God besides philosophical science built up by human reason. Firstly, indeed, because man is directed to God, as to an end that surpasses the grasp of his reason: "The eye hath not seen, O God, besides Thee, what things Thou hast prepared for them that wait for Thee" (Is. 66:4). But the end must first be known by men who are to direct their thoughts and actions to the end. Hence it was necessary for the salvation of man that certain truths which exceed human reason should be made known to him by divine revelation. Even as regards those truths about God which human reason could have discovered, it was necessary that man should be taught by a divine revelation; because the truth about God such as reason could discover, would only be known by a few, and that after a long time, and with the admixture of many errors. Whereas man's whole salvation, which is in God, depends upon the knowledge of this truth. Therefore, in order that the salvation of men might be brought about more fitly and more surely, it was necessary that they should be taught divine truths by divine revelation. It was therefore necessary that besides philosophical science built up by reason, there should be a sacred science learned through revelation.}
		assert_equal expected_answer, @parser.article.answer
	end

	def test_VerifyNumberOfObjections
		assert_equal 2, @parser.article.objections.size
	end

	def test_VerifyFirstObjectionStatement
		expected_statement = %{Objection 1: It seems that, besides philosophical science, we have no need of any further knowledge. For man should not seek to know what is above reason: "Seek not the things that are too high for thee" (Ecclus. 3:22). But whatever is not above reason is fully treated of in philosophical science. Therefore any other knowledge besides philosophical science is superfluous.}
		assert_equal expected_statement, @parser.article.objections[0].statement
	end

	def test_VerifyFirstObjectionReply
		expected_reply = %{Reply to Objection 1: Although those things which are beyond man's knowledge may not be sought for by man through his reason, nevertheless, once they are revealed by God, they must be accepted by faith. Hence the sacred text continues, "For many things are shown to thee above the understanding of man" (Ecclus. 3:25). And in this, the sacred science consists.}
		assert_equal expected_reply, @parser.article.objections[0].reply
	end

	def test_VerifySecondObjectionStatement
		expected_statement = %{Objection 2: Further, knowledge can be concerned only with being, for nothing can be known, save what is true; and all that is, is true. But everything that is, is treated of in philosophical science---even God Himself; so that there is a part of philosophy called theology, or the divine science, as Aristotle has proved (Metaph. vi). Therefore, besides philosophical science, there is no need of any further knowledge.}
		assert_equal expected_statement, @parser.article.objections[1].statement
	end

	def test_VerifySecondObjectionReply
		expected_reply = %{Reply to Objection 2: Sciences are differentiated according to the various means through which knowledge is obtained. For the astronomer and the physicist both may prove the same conclusion: that the earth, for instance, is round: the astronomer by means of mathematics (i.e. abstracting from matter), but the physicist by means of matter itself. Hence there is no reason why those things which may be learned from philosophical science, so far as they can be known by natural reason, may not also be taught us by another science so far as they fall within revelation. Hence theology included in sacred doctrine differs in kind from that theology which is part of philosophy.}
		assert_equal expected_reply, @parser.article.objections[1].reply
	end
end

$article = %{
	Whether, besides philosophy, any further doctrine is required?

   Objection 1: It seems that, besides philosophical science, we have no
   need of any further knowledge. For man should not seek to know what is
   above reason: "Seek not the things that are too high for thee" (Ecclus.
   3:22). But whatever is not above reason is fully treated of in
   philosophical science. Therefore any other knowledge besides
   philosophical science is superfluous.

   Objection 2: Further, knowledge can be concerned only with being, for
   nothing can be known, save what is true; and all that is, is true. But
   everything that is, is treated of in philosophical science---even God
   Himself; so that there is a part of philosophy called theology, or the
   divine science, as Aristotle has proved (Metaph. vi). Therefore,
   besides philosophical science, there is no need of any further
   knowledge.

   On the contrary, It is written (2 Tim. 3:16): "All Scripture, inspired
   of God is profitable to teach, to reprove, to correct, to instruct in
   justice." Now Scripture, inspired of God, is no part of philosophical
   science, which has been built up by human reason. Therefore it is
   useful that besides philosophical science, there should be other
   knowledge, i.e. inspired of God.

   I answer that, It was necessary for man's salvation that there should
   be a knowledge revealed by God besides philosophical science built up
   by human reason. Firstly, indeed, because man is directed to God, as to
   an end that surpasses the grasp of his reason: "The eye hath not seen,
   O God, besides Thee, what things Thou hast prepared for them that wait
   for Thee" (Is. 66:4). But the end must first be known by men who are to
   direct their thoughts and actions to the end. Hence it was necessary
   for the salvation of man that certain truths which exceed human reason
   should be made known to him by divine revelation. Even as regards those
   truths about God which human reason could have discovered, it was
   necessary that man should be taught by a divine revelation; because the
   truth about God such as reason could discover, would only be known by a
   few, and that after a long time, and with the admixture of many errors.
   Whereas man's whole salvation, which is in God, depends upon the
   knowledge of this truth. Therefore, in order that the salvation of men
   might be brought about more fitly and more surely, it was necessary
   that they should be taught divine truths by divine revelation. It was
   therefore necessary that besides philosophical science built up by
   reason, there should be a sacred science learned through revelation.

   Reply to Objection 1: Although those things which are beyond man's
   knowledge may not be sought for by man through his reason,
   nevertheless, once they are revealed by God, they must be accepted by
   faith. Hence the sacred text continues, "For many things are shown to
   thee above the understanding of man" (Ecclus. 3:25). And in this, the
   sacred science consists.

   Reply to Objection 2: Sciences are differentiated according to the
   various means through which knowledge is obtained. For the astronomer
   and the physicist both may prove the same conclusion: that the earth,
   for instance, is round: the astronomer by means of mathematics (i.e.
   abstracting from matter), but the physicist by means of matter itself.
   Hence there is no reason why those things which may be learned from
   philosophical science, so far as they can be known by natural reason,
   may not also be taught us by another science so far as they fall within
   revelation. Hence theology included in sacred doctrine differs in kind
   from that theology which is part of philosophy.
}