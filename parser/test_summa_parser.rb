require "minitest/autorun"
require_relative "summa_parser"

class TestSummaParser < Minitest::Test
	def setup
		@parser = SummaParser.new $summa
	end

	def test_VerifyCorcectNumberOfArticlesFound
		assert_equal 2, @parser.summa.articles.size
	end

	def test_VerifyFirstArticleTitle
		expected_title = "Whether God can be known in this life by natural reason?"
		assert_equal expected_title, @parser.summa.articles[0].title
	end

	def test_VerifySecondArticleTitle
		expected_title = "Whether by grace a higher knowledge of God can be obtained than by natural reason?"
		assert_equal expected_title, @parser.summa.articles[1].title
	end
end

$summa = %{
    __________________________________________________________________

    Whether God can be known in this life by natural reason?

   Objection 1: It seems that by natural reason we cannot know God in this
   life. For Boethius says (De Consol. v) that "reason does not grasp
   simple form." But God is a supremely simple form, as was shown above
   ([60]Q[3], A[7] ). Therefore natural reason cannot attain to know Him.

   Objection 2: Further, the soul understands nothing by natural reason
   without the use of the imagination. But we cannot have an imagination
   of God, Who is incorporeal. Therefore we cannot know God by natural
   knowledge.

   Objection 3: Further, the knowledge of natural reason belongs to both
   good and evil, inasmuch as they have a common nature. But the knowledge
   of God belongs only to the good; for Augustine says (De Trin. i): "The
   weak eye of the human mind is not fixed on that excellent light unless
   purified by the justice of faith." Therefore God cannot be known by
   natural reason.

   On the contrary, It is written (Rom. 1:19), "That which is known of
   God," namely, what can be known of God by natural reason, "is manifest
   in them."

   I answer that, Our natural knowledge begins from sense. Hence our
   natural knowledge can go as far as it can be led by sensible things.
   But our mind cannot be led by sense so far as to see the essence of
   God; because the sensible effects of God do not equal the power of God
   as their cause. Hence from the knowledge of sensible things the whole
   power of God cannot be known; nor therefore can His essence be seen.
   But because they are His effects and depend on their cause, we can be
   led from them so far as to know of God "whether He exists," and to know
   of Him what must necessarily belong to Him, as the first cause of all
   things, exceeding all things caused by Him.

   Hence we know that His relationship with creatures so far as to be the
   cause of them all; also that creatures differ from Him, inasmuch as He
   is not in any way part of what is caused by Him; and that creatures are
   not removed from Him by reason of any defect on His part, but because
   He superexceeds them all.

   Reply to Objection 1: Reason cannot reach up to simple form, so as to
   know "what it is"; but it can know "whether it is."

   Reply to Objection 2: God is known by natural knowledge through the
   images of His effects.

   Reply to Objection 3: As the knowledge of God's essence is by grace, it
   belongs only to the good; but the knowledge of Him by natural reason
   can belong to both good and bad; and hence Augustine says (Retract. i),
   retracting what he had said before: "I do not approve what I said in
   prayer, 'God who willest that only the pure should know truth.' For it
   can be answered that many who are not pure can know many truths," i.e.
   by natural reason.
     __________________________________________________________________

    Whether by grace a higher knowledge of God can be obtained than by natural
    reason?

   Objection 1: It seems that by grace a higher knowledge of God is not
   obtained than by natural reason. For Dionysius says (De Mystica Theol.
   i) that whoever is the more united to God in this life, is united to
   Him as to one entirely unknown. He says the same of Moses, who
   nevertheless obtained a certain excellence by the knowledge conferred
   by grace. But to be united to God while ignoring of Him "what He is,"
   comes about also by natural reason. Therefore God is not more known to
   us by grace than by natural reason.

   Objection 2: Further, we can acquire the knowledge of divine things by
   natural reason only through the imagination; and the same applies to
   the knowledge given by grace. For Dionysius says (Coel. Hier. i) that
   "it is impossible for the divine ray to shine upon us except as
   screened round about by the many colored sacred veils." Therefore we
   cannot know God more fully by grace than by natural reason.

   Objection 3: Further, our intellect adheres to God by grace of faith.
   But faith does not seem to be knowledge; for Gregory says (Hom. xxvi in
   Ev.) that "things not seen are the objects of faith, and not of
   knowledge." Therefore there is not given to us a more excellent
   knowledge of God by grace.

   On the contrary, The Apostle says that "God hath revealed to us His
   spirit," what "none of the princes of this world knew" (1 Cor. 2:10),
   namely, the philosophers, as the gloss expounds.

   I answer that, We have a more perfect knowledge of God by grace than by
   natural reason. Which is proved thus. The knowledge which we have by
   natural reason contains two things: images derived from the sensible
   objects; and the natural intelligible light, enabling us to abstract
   from them intelligible conceptions.

   Now in both of these, human knowledge is assisted by the revelation of
   grace. For the intellect's natural light is strengthened by the
   infusion of gratuitous light; and sometimes also the images in the
   human imagination are divinely formed, so as to express divine things
   better than those do which we receive from sensible objects, as appears
   in prophetic visions; while sometimes sensible things, or even voices,
   are divinely formed to express some divine meaning; as in the Baptism,
   the Holy Ghost was seen in the shape of a dove, and the voice of the
   Father was heard, "This is My beloved Son" (Mat. 3:17).

   Reply to Objection 1: Although by the revelation of grace in this life
   we cannot know of God "what He is," and thus are united to Him as to
   one unknown; still we know Him more fully according as many and more
   excellent of His effects are demonstrated to us, and according as we
   attribute to Him some things known by divine revelation, to which
   natural reason cannot reach, as, for instance, that God is Three and
   One.

   Reply to Objection 2: From the images either received from sense in the
   natural order, or divinely formed in the imagination, we have so much
   the more excellent intellectual knowledge, the stronger the
   intelligible light is in man; and thus through the revelation given by
   the images a fuller knowledge is received by the infusion of the divine
   light.

   Reply to Objection 3: Faith is a kind of knowledge, inasmuch as the
   intellect is determined by faith to some knowable object. But this
   determination to one object does not proceed from the vision of the
   believer, but from the vision of Him who is believed. Thus as far as
   faith falls short of vision, it falls short of the knowledge which
   belongs to science, for science determines the intellect to one object
   by the vision and understanding of first principles.
     __________________________________________________________________
}