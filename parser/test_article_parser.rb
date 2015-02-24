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

	def test_VerifyArticleTitleWithFootnote
		local_parser = ArticleParser.new $article_with_footnote_in_title
		expected_title = "Whether understanding is a part of prudence?"
		assert_equal expected_title, local_parser.article.title
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

	def test_VerifyNumberOfObjectionsForArticleWithNoObjectionReplies
		local_parser = ArticleParser.new $article_without_objection_replies
		assert_equal 2, local_parser.article.objections.size
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
	Whether, besides philosophy, any further doctrine is
    required?

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

$article_without_objection_replies = %{
	Whether sacred doctrine is a practical science?

   Objection 1: It seems that sacred doctrine is a practical science; for
   a practical science is that which ends in action according to the
   Philosopher (Metaph. ii). But sacred doctrine is ordained to action:
   "Be ye doers of the word, and not hearers only" (James 1:22). Therefore
   sacred doctrine is a practical science.

   Objection 2: Further, sacred doctrine is divided into the Old and the
   New Law. But law implies a moral science which is a practical science.
   Therefore sacred doctrine is a practical science.

   On the contrary, Every practical science is concerned with human
   operations; as moral science is concerned with human acts, and
   architecture with buildings. But sacred doctrine is chiefly concerned
   with God, whose handiwork is especially man. Therefore it is not a
   practical but a speculative science.

   I answer that, Sacred doctrine, being one, extends to things which
   belong to different philosophical sciences because it considers in each
   the same formal aspect, namely, so far as they can be known through
   divine revelation. Hence, although among the philosophical sciences one
   is speculative and another practical, nevertheless sacred doctrine
   includes both; as God, by one and the same science, knows both Himself
   and His works. Still, it is speculative rather than practical because
   it is more concerned with divine things than with human acts; though it
   does treat even of these latter, inasmuch as man is ordained by them to
   the perfect knowledge of God in which consists eternal bliss. This is a
   sufficient answer to the Objections.
}

$article_with_footnote_in_title = %{    
	Whether understanding* is a part of prudence? [*Otherwise intuition;
    Aristotle's word is {nous}]

   Objection 1: It would seem that understanding is not a part of
   prudence. When two things are members of a division, one is not part of
   the other. But intellectual virtue is divided into understanding and
   prudence, according to Ethic. vi, 3. Therefore understanding should not
   be reckoned a part of prudence.

   Objection 2: Further, understanding is numbered among the gifts of the
   Holy Ghost, and corresponds to faith, as stated above (Q[8], AA[1],8).
   But prudence is a virtue other than faith, as is clear from what has
   been said above (Q[4], A[8]; [2771]FS, Q[62], A[2]). Therefore
   understanding does not pertain to prudence.

   Objection 3: Further, prudence is about singular matters of action
   (Ethic. vi, 7): whereas understanding takes cognizance of universal and
   immaterial objects (De Anima iii, 4). Therefore understanding is not a
   part of prudence.

   On the contrary, Tully [*De Invent. Rhet. ii, 53] accounts
   "intelligence" a part of prudence, and Macrobius [*In Somn. Scip. i, 8]
   mentions "understanding," which comes to the same.

   I answer that, Understanding denotes here, not the intellectual power,
   but the right estimate about some final principle, which is taken as
   self-evident: thus we are said to understand the first principles of
   demonstrations. Now every deduction of reason proceeds from certain
   statements which are taken as primary: wherefore every process of
   reasoning must needs proceed from some understanding. Therefore since
   prudence is right reason applied to action, the whole process of
   prudence must needs have its source in understanding. Hence it is that
   understanding is reckoned a part of prudence.

   Reply to Objection 1: The reasoning of prudence terminates, as in a
   conclusion, in the particular matter of action, to which, as stated
   above ([2772]Q[47], AA[3],6), it applies the knowledge of some
   universal principle. Now a singular conclusion is argued from a
   universal and a singular proposition. Wherefore the reasoning of
   prudence must proceed from a twofold understanding. The one is
   cognizant of universals, and this belongs to the understanding which is
   an intellectual virtue, whereby we know naturally not only speculative
   principles, but also practical universal principles, such as "One
   should do evil to no man," as shown above ([2773]Q[47], A[6]). The
   other understanding, as stated in Ethic. vi, 11, is cognizant of an
   extreme, i.e. of some primary singular and contingent practical matter,
   viz. the minor premiss, which must needs be singular in the syllogism
   of prudence, as stated above ([2774]Q[47], AA[3],6). Now this primary
   singular is some singular end, as stated in the same place. Wherefore
   the understanding which is a part of prudence is a right estimate of
   some particular end.

   Reply to Objection 2: The understanding which is a gift of the Holy
   Ghost, is a quick insight into divine things, as shown above
   ([2775]Q[8], AA[1],2). It is in another sense that it is accounted a
   part of prudence, as stated above.

   Reply to Objection 3: The right estimate about a particular end is
   called both "understanding," in so far as its object is a principle,
   and "sense," in so far as its object is a particular. This is what the
   Philosopher means when he says (Ethic. v, 11): "Of such things we need
   to have the sense, and this is understanding." But this is to be
   understood as referring, not to the particular sense whereby we know
   proper sensibles, but to the interior sense, whereby we judge of a
   particular.
}