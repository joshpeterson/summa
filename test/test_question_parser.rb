gem "minitest"
require "minitest/autorun"
require_relative '../parser/question_parser'

class TestQuestionParser < MiniTest::Test
  def setup
    @parser = QuestionParser.new $question
  end

  def test_VerifyTitle
    expected_title = "THE LIFE OF GOD (FOUR ARTICLES)"
    assert_equal expected_title, @parser.question.title
  end

  def test_VerifyTitleWithMultipleLines
    expected_title = "OF THE PERFECTION OF THE ANGELS IN THE ORDER OF GRACE AND OF GLORY (NINE ARTICLES)"
    parser = QuestionParser.new $question_with_multiline_title
    assert_equal expected_title, parser.question.title
  end

  def test_VerifyContent
    expected_context = %{Since to understand belongs to living beings, after considering the divine knowledge and intellect, we must consider the divine life. About this, four points of inquiry arise:
(1) To whom does it belong to live?
(2) What is life?
(3) Whether life is properly attributed to God?
(4) Whether all things in God are life?}
      assert_equal expected_context, @parser.question.content
  end

  def test_VerifyCorrectNumberOfArticlesFound
    assert_equal 4, @parser.question.articles.size
  end

  def test_VerifyFirstArticleTitle
    expected_title = "Whether to live belongs to all natural things?"
    assert_equal expected_title, @parser.question.articles[0].title
  end

  def test_VerifySecondArticleTitle
    expected_title = "Whether life is an operation?"
    assert_equal expected_title, @parser.question.articles[1].title
  end

  def test_VerifyThirdArticleTitle
    expected_title = "Whether life is properly attributed to God?"
    assert_equal expected_title, @parser.question.articles[2].title
  end

  def test_VerifyFourthArticleTitle
    expected_title = "Whether all things are life in God?"
    assert_equal expected_title, @parser.question.articles[3].title
  end

    def test_VerifyEmptyQuestionTextCausesAnException
        assert_raises ArgumentError do
            QuestionParser.new ""
        end
    end
end

$question = %{  
  THE LIFE OF GOD (FOUR ARTICLES)

   Since to understand belongs to living beings, after considering the
   divine knowledge and intellect, we must consider the divine life. About
   this, four points of inquiry arise:

   (1) To whom does it belong to live?

   (2) What is life?

   (3) Whether life is properly attributed to God?

   (4) Whether all things in God are life?
     __________________________________________________________________

    Whether to live belongs to all natural things?

   Objection 1: It seems that to live belongs to all natural things. For
   the Philosopher says (Phys. viii, 1) that "Movement is like a kind of
   life possessed by all things existing in nature." But all natural
   things participate in movement. Therefore all natural things partake of
   life.

   Objection 2: Further, plants are said to live, inasmuch as they in
   themselves a principle of movement of growth and decay. But local
   movement is naturally more perfect than, and prior to, movement of
   growth and decay, as the Philosopher shows (Phys. viii, 56,57). Since
   then, all natural bodies have in themselves some principle of local
   movement, it seems that all natural bodies live.

   Objection 3: Further, amongst natural bodies the elements are the less
   perfect. Yet life is attributed to them, for we speak of "living
   waters." Much more, therefore, have other natural bodies life.

   On the contrary, Dionysius says (Div. Nom. vi, 1) that "The last echo
   of life is heard in the plants," whereby it is inferred that their life
   is life in its lowest degree. But inanimate bodies are inferior to
   plants. Therefore they have not life.

   I answer that, We can gather to what things life belongs, and to what
   it does not, from such things as manifestly possess life. Now life
   manifestly belongs to animals, for it said in De Vegetab. i [*De
   Plantis i, 1] that in animals life is manifest. We must, therefore,
   distinguish living from lifeless things, by comparing them to that by
   reason of which animals are said to live: and this it is in which life
   is manifested first and remains last. We say then that an animal begins
   to live when it begins to move of itself: and as long as such movement
   appears in it, so long as it is considered to be alive. When it no
   longer has any movement of itself, but is only moved by another power,
   then its life is said to fail, and the animal to be dead. Whereby it is
   clear that those things are properly called living that move themselves
   by some kind of movement, whether it be movement properly so called, as
   the act of an imperfect being, i.e. of a thing in potentiality, is
   called movement; or movement in a more general sense, as when said of
   the act of a perfect thing, as understanding and feeling are called
   movement. Accordingly all things are said to be alive that determine
   themselves to movement or operation of any kind: whereas those things
   that cannot by their nature do so, cannot be called living, unless by a
   similitude.

   Reply to Objection 1: These words of the Philosopher may be understood
   either of the first movement, namely, that of the celestial bodies, or
   of the movement in its general sense. In either way is movement called
   the life, as it were, of natural bodies, speaking by a similitude, and
   not attributing it to them as their property. The movement of the
   heavens is in the universe of corporeal natures as the movement of the
   heart, whereby life is preserved, is in animals. Similarly also every
   natural movement in respect to natural things has a certain similitude
   to the operations of life. Hence, if the whole corporeal universe were
   one animal, so that its movement came from an "intrinsic moving force,"
   as some in fact have held, in that case movement would really be the
   life of all natural bodies.

   Reply to Objection 2: To bodies, whether heavy or light, movement does
   not belong, except in so far as they are displaced from their natural
   conditions, and are out of their proper place; for when they are in the
   place that is proper and natural to them, then they are at rest. Plants
   and other living things move with vital movement, in accordance with
   the disposition of their nature, but not by approaching thereto, or by
   receding from it, for in so far as they recede from such movement, so
   far do they recede from their natural disposition. Heavy and light
   bodies are moved by an extrinsic force, either generating them and
   giving them form, or removing obstacles from their way. They do not
   therefore move themselves, as do living bodies.

   Reply to Objection 3: Waters are called living that have a continuous
   current: for standing waters, that are not connected with a continually
   flowing source, are called dead, as in cisterns and ponds. This is
   merely a similitude, inasmuch as the movement they are seen to possess
   makes them look as if they were alive. Yet this is not life in them in
   its real sense, since this movement of theirs is not from themselves
   but from the cause that generates them. The same is the case with the
   movement of other heavy and light bodies.
     __________________________________________________________________

    Whether life is an operation?

   Objection 1: It seems that life is an operation. For nothing is divided
   except into parts of the same genus. But life is divided by certain
   operations, as is clear from the Philosopher (De Anima ii, 13), who
   distinguishes four kinds of life, namely, nourishment, sensation, local
   movement and understanding. Therefore life is an operation.

   Objection 2: Further, the active life is said to be different from the
   contemplative. But the contemplative is only distinguished from the
   active by certain operations. Therefore life is an operation.

   Objection 3: Further, to know God is an operation. But this is life, as
   is clear from the words of Jn. 18:3, "Now this is eternal life, that
   they may know Thee, the only true God." Therefore life is an operation.

   On the contrary, The Philosopher says (De Anima ii, 37), "In living
   things, to live is to be."

   I answer that, As is clear from what has been said ([123]Q[17], A[3]),
   our intellect, which takes cognizance of the essence of a thing as its
   proper object, gains knowledge from sense, of which the proper objects
   are external accidents. Hence from external appearances we come to the
   knowledge of the essence of things. And because we name a thing in
   accordance with our knowledge of it, as is clear from what has already
   been said ([124]Q[13], A[1]), so from external properties names are
   often imposed to signify essences. Hence such names are sometimes taken
   strictly to denote the essence itself, the signification of which is
   their principal object; but sometimes, and less strictly, to denote the
   properties by reason of which they are imposed. And so we see that the
   word "body" is used to denote a genus of substances from the fact of
   their possessing three dimensions: and is sometimes taken to denote the
   dimensions themselves; in which sense body is said to be a species of
   quantity. The same must be said of life. The name is given from a
   certain external appearance, namely, self-movement, yet not precisely
   to signify this, but rather a substance to which self-movement and the
   application of itself to any kind of operation, belong naturally. To
   live, accordingly, is nothing else than to exist in this or that
   nature; and life signifies this, though in the abstract, just as the
   word "running" denotes "to run" in the abstract.

   Hence "living" is not an accidental but an essential predicate.
   Sometimes, however, life is used less properly for the operations from
   which its name is taken, and thus the Philosopher says (Ethic. ix, 9)
   that to live is principally to sense or to understand.

   Reply to Objection 1: The Philosopher here takes "to live" to mean an
   operation of life. Or it would be better to say that sensation and
   intelligence and the like, are sometimes taken for the operations,
   sometimes for the existence itself of the operator. For he says (Ethic.
   ix, 9) that to live is to sense or to understand---in other words, to
   have a nature capable of sensation or understanding. Thus, then, he
   distinguishes life by the four operations mentioned. For in this lower
   world there are four kinds of living things. It is the nature of some
   to be capable of nothing more than taking nourishment, and, as a
   consequence, of growing and generating. Others are able, in addition,
   to sense, as we see in the case of shellfish and other animals without
   movement. Others have the further power of moving from place to place,
   as perfect animals, such as quadrupeds, and birds, and so on. Others,
   as man, have the still higher faculty of understanding.

   Reply to Objection 2: By vital operations are meant those whose
   principles are within the operator, and in virtue of which the operator
   produces such operations of itself. It happens that there exist in men
   not merely such natural principles of certain operations as are their
   natural powers, but something over and above these, such as habits
   inclining them like a second nature to particular kinds of operations,
   so that the operations become sources of pleasure. Thus, as by a
   similitude, any kind of work in which a man takes delight, so that his
   bent is towards it, his time spent in it, and his whole life ordered
   with a view to it, is said to be the life of that man. Hence some are
   said to lead to life of self-indulgence, others a life of virtue. In
   this way the contemplative life is distinguished from the active, and
   thus to know God is said to be life eternal.

   Wherefore the Reply to the Third Objection is clear.
     __________________________________________________________________

    Whether life is properly attributed to God?

   Objection 1: It seems that life is not properly attributed to God. For
   things are said to live inasmuch as they move themselves, as previously
   stated [125](A[2]). But movement does not belong to God. Neither
   therefore does life.

   Objection 2: Further, in all living things we must needs suppose some
   principle of life. Hence it is said by the Philosopher (De Anima ii, 4)
   that "the soul is the cause and principle of the living body." But God
   has no principle. Therefore life cannot be attributed to Him.

   Objection 3: Further, the principle of life in the living things that
   exist among us is the vegetative soul. But this exists only in
   corporeal things. Therefore life cannot be attributed to incorporeal
   things.

   On the contrary, It is said (Ps. 83:3): "My heart and my flesh have
   rejoiced in the living God."

   I answer that, Life is in the highest degree properly in God. In proof
   of which it must be considered that since a thing is said to live in so
   far as it operates of itself and not as moved by another, the more
   perfectly this power is found in anything, the more perfect is the life
   of that thing. In things that move and are moved, a threefold order is
   found. In the first place, the end moves the agent: and the principal
   agent is that which acts through its form, and sometimes it does so
   through some instrument that acts by virtue not of its own form, but of
   the principal agent, and does no more than execute the action.
   Accordingly there are things that move themselves, not in respect of
   any form or end naturally inherent in them, but only in respect of the
   executing of the movement; the form by which they act, and the end of
   the action being alike determined for them by their nature. Of this
   kind are plants, which move themselves according to their inherent
   nature, with regard only to executing the movements of growth and
   decay.

   Other things have self-movement in a higher degree, that is, not only
   with regard to executing the movement, but even as regards to the form,
   the principle of movement, which form they acquire of themselves. Of
   this kind are animals, in which the principle of movement is not a
   naturally implanted form; but one received through sense. Hence the
   more perfect is their sense, the more perfect is their power of
   self-movement. Such as have only the sense of touch, as shellfish, move
   only with the motion of expansion and contraction; and thus their
   movement hardly exceeds that of plants. Whereas such as have the
   sensitive power in perfection, so as to recognize not only connection
   and touch, but also objects apart from themselves, can move themselves
   to a distance by progressive movement. Yet although animals of the
   latter kind receive through sense the form that is the principle of
   their movement, nevertheless they cannot of themselves propose to
   themselves the end of their operation, or movement; for this has been
   implanted in them by nature; and by natural instinct they are moved to
   any action through the form apprehended by sense. Hence such animals as
   move themselves in respect to an end they themselves propose are
   superior to these. This can only be done by reason and intellect; whose
   province it is to know the proportion between the end and the means to
   that end, and duly coordinate them. Hence a more perfect degree of life
   is that of intelligible beings; for their power of self-movement is
   more perfect. This is shown by the fact that in one and the same man
   the intellectual faculty moves the sensitive powers; and these by their
   command move the organs of movement. Thus in the arts we see that the
   art of using a ship, i.e. the art of navigation, rules the art of
   ship-designing; and this in its turn rules the art that is only
   concerned with preparing the material for the ship.

   But although our intellect moves itself to some things, yet others are
   supplied by nature, as are first principles, which it cannot doubt; and
   the last end, which it cannot but will. Hence, although with respect to
   some things it moves itself, yet with regard to other things it must be
   moved by another. Wherefore that being whose act of understanding is
   its very nature, and which, in what it naturally possesses, is not
   determined by another, must have life in the most perfect degree. Such
   is God; and hence in Him principally is life. From this the Philosopher
   concludes (Metaph. xii, 51), after showing God to be intelligent, that
   God has life most perfect and eternal, since His intellect is most
   perfect and always in act.

   Reply to Objection 1: As stated in Metaph. ix, 16, action is twofold.
   Actions of one kind pass out to external matter, as to heat or to cut;
   whilst actions of the other kind remain in the agent, as to understand,
   to sense and to will. The difference between them is this, that the
   former action is the perfection not of the agent that moves, but of the
   thing moved; whereas the latter action is the perfection of the agent.
   Hence, because movement is an act of the thing in movement, the latter
   action, in so far as it is the act of the operator, is called its
   movement, by this similitude, that as movement is an act of the thing
   moved, so an act of this kind is the act of the agent, although
   movement is an act of the imperfect, that is, of what is in
   potentiality; while this kind of act is an act of the perfect, that is
   to say, of what is in act as stated in De Anima iii, 28. In the sense,
   therefore, in which understanding is movement, that which understands
   itself is said to move itself. It is in this sense that Plato also
   taught that God moves Himself; not in the sense in which movement is an
   act of the imperfect.

   Reply to Objection 2: As God is His own very existence and
   understanding, so is He His own life; and therefore He so lives that He
   has not principle of life.

   Reply to Objection 3: Life in this lower world is bestowed on a
   corruptible nature, that needs generation to preserve the species, and
   nourishment to preserve the individual. For this reason life is not
   found here below apart from a vegetative soul: but this does not hold
   good with incorruptible natures.
     __________________________________________________________________

    Whether all things are life in God?

   Objection 1: It seems that not all things are life in God. For it is
   said (Acts 17:28), "In Him we live, and move, and be." But not all
   things in God are movement. Therefore not all things are life in Him.

   Objection 2: Further, all things are in God as their first model. But
   things modelled ought to conform to the model. Since, then, not all
   things have life in themselves, it seems that not all things are life
   in God.

   Objection 3: Further, as Augustine says (De Vera Relig. 29), a living
   substance is better than a substance that does not live. If, therefore,
   things which in themselves have not life, are life in God, it seems
   that things exist more truly in God than themselves. But this appears
   to be false; since in themselves they exist actually, but in God
   potentially.

   Objection 4: Further, just as good things and things made in time are
   known by God, so are bad things, and things that God can make, but
   never will be made. If, therefore, all things are life in God, inasmuch
   as known by Him, it seems that even bad things and things that will
   never be made are life in God, as known by Him, and this appears
   inadmissible.

   On the contrary, (Jn. 1:3,4), it is said, "What was made, in Him was
   life." But all things were made, except God. Therefore all things are
   life in God.

   I answer that, In God to live is to understand, as before stated
   [126](A[3]). In God intellect, the thing understood, and the act of
   understanding, are one and the same. Hence whatever is in God as
   understood is the very living or life of God. Now, wherefore, since all
   things that have been made by God are in Him as things understood, it
   follows that all things in Him are the divine life itself.

   Reply to Objection 1: Creatures are said to be in God in a twofold
   sense. In one way, so far are they are held together and preserved by
   the divine power; even as we say that things that are in our power are
   in us. And creatures are thus said to be in God, even as they exist in
   their own natures. In this sense we must understand the words of the
   Apostle when he says, "In Him we live, move, and be"; since our being,
   living, and moving are themselves caused by God. In another sense
   things are said to be in God, as in Him who knows them, in which sense
   they are in God through their proper ideas, which in God are not
   distinct from the divine essence. Hence things as they are in God are
   the divine essence. And since the divine essence is life and not
   movement, it follows that things existing in God in this manner are not
   movement, but life.

   Reply to Objection 2: The thing modelled must be like the model
   according to the form, not the mode of being. For sometimes the form
   has being of another kind in the model from that which it has in the
   thing modelled. Thus the form of a house has in the mind of the
   architect immaterial and intelligible being; but in the house that
   exists outside his mind, material and sensible being. Hence the ideas
   of things, though not existing in themselves, are life in the divine
   mind, as having a divine existence in that mind.

   Reply to Objection 3: If form only, and not matter, belonged to natural
   things, then in all respects natural things would exist more truly in
   the divine mind, by the ideas of them, than in themselves. For which
   reason, in fact, Plato held that the "separate" man was the true man;
   and that man as he exists in matter, is man only by participation. But
   since matter enters into the being of natural things, we must say that
   those things have simply being in the divine mind more truly than in
   themselves, because in that mind they have an uncreated being, but in
   themselves a created being: whereas this particular being, a man, or
   horse, for example, has this being more truly in its own nature than in
   the divine mind, because it belongs to human nature to be material,
   which, as existing in the divine mind, it is not. Even so a house has
   nobler being in the architect's mind than in matter; yet a material
   house is called a house more truly than the one which exists in the
   mind; since the former is actual, the latter only potential.

   Reply to Objection 4: Although bad things are in God's knowledge, as
   being comprised under that knowledge, yet they are not in God as
   created by Him, or preserved by Him, or as having their type in Him.
   They are known by God through the types of good things. Hence it cannot
   be said that bad things are life in God. Those things that are not in
   time may be called life in God in so far as life means understanding
   only, and inasmuch as they are understood by God; but not in so far as
   life implies a principle of operation.
     __________________________________________________________________
}

$question_with_multiline_title = %{
  OF THE PERFECTION OF THE ANGELS IN THE ORDER OF GRACE AND OF GLORY (NINE
  ARTICLES)

   In due sequence we have to inquire how the angels were made in the
   order of grace and of glory; under which heading there are nine points
   of inquiry:

   (1) Were the angels created in beatitude?

   (2) Did they need grace in order to turn to God?

   (3) Were they created in grace?

   (4) Did they merit their beatitude?

   (5) Did they at once enter into beatitude after merit?

   (6) Did they receive grace and glory according to their natural
   capacities?

   (7) After entering glory, did their natural love and knowledge remain?

   (8) Could they have sinned afterwards?

   (9) After entering into glory, could they advance farther?
     __________________________________________________________________

    Whether the angels were created in beatitude?

   Objection 1: It would seem that the angels were created in beatitude.
   For it is stated (De Eccl. Dogm. xxix) that "the angels who continue in
   the beatitude wherein they were created, do not of their nature possess
   the excellence they have." Therefore the angels were created in
   beatitude.

   Objection 2: Further, the angelic nature is nobler than the corporeal
   creature. But the corporeal creature straightway from its creation was
   made perfect and complete; nor did its lack of form take precedence in
   time, but only in nature, as Augustine says (Gen. ad lit. i, 15).
   Therefore neither did God create the angelic nature imperfect and
   incomplete. But its formation and perfection are derived from its
   beatitude, whereby it enjoys God. Therefore it was created in
   beatitude.

   Objection 3: Further, according to Augustine (Gen. ad lit. iv, 34; v,
   5), the things which we read of as being made in the works of the six
   days, were made together at one time; and so all the six days must have
   existed instantly from the beginning of creation. But, according to his
   exposition, in those six days, "the morning" was the angelic knowledge,
   according to which they knew the Word and things in the Word. Therefore
   straightway from their creation they knew the Word, and things in the
   Word. But the bliss of the angels comes of seeing the Word.
   Consequently the angels were in beatitude straightway from the very
   beginning of their creation.

   On the contrary, To be established or confirmed in good is of the
   nature of beatitude. But the angels were not confirmed in good as soon
   as they were created; the fall of some of them shows this. Therefore
   the angels were not in beatitude from their creation.

   I answer that, By the name of beatitude is understood the ultimate
   perfection of rational or of intellectual nature; and hence it is that
   it is naturally desired, since everything naturally desires its
   ultimate perfection. Now there is a twofold ultimate perfection of
   rational or of intellectual nature. The first is one which it can
   procure of its own natural power; and this is in a measure called
   beatitude or happiness. Hence Aristotle (Ethic. x) says that man's
   ultimate happiness consists in his most perfect contemplation, whereby
   in this life he can behold the best intelligible object; and that is
   God. Above this happiness there is still another, which we look forward
   to in the future, whereby "we shall see God as He is." This is beyond
   the nature of every created intellect, as was shown above ([541]Q[12],
   A[4]).

   So, then, it remains to be said, that, as regards this first beatitude,
   which the angel could procure by his natural power, he was created
   already blessed. Because the angel does not acquire such beatitude by
   any progressive action, as man does, but, as was observed above
   ([542]Q[58], AA[3] ,4), is straightway in possession thereof, owing to
   his natural dignity. But the angels did not have from the beginning of
   their creation that ultimate beatitude which is beyond the power of
   nature; because such beatitude is no part of their nature, but its end;
   and consequently they ought not to have it immediately from the
   beginning.

   Reply to Objection 1: Beatitude is there taken for that natural
   perfection which the angel had in the state of innocence.

   Reply to Objection 2: The corporeal creature instantly in the beginning
   of its creation could not have the perfection to which it is brought by
   its operation; consequently, according to Augustine (Gen. ad. lit. v,
   4,23; viii, 3), the growing of plants from the earth did not take place
   at once among the first works, in which only the germinating power of
   the plants was bestowed upon the earth. In the same way, the angelic
   creature in the beginning of its existence had the perfection of its
   nature; but it did not have the perfection to which it had to come by
   its operation.

   Reply to Objection 3: The angel has a twofold knowledge of the Word;
   the one which is natural, and the other according to glory. He has a
   natural knowledge whereby he knows the Word through a similitude
   thereof shining in his nature; and he has a knowledge of glory whereby
   he knows the Word through His essence. By both kinds of knowledge the
   angel knows things in the Word; imperfectly by his natural knowledge,
   and perfectly by his knowledge of glory. Therefore the first knowledge
   of things in the Word was present to the angel from the outset of his
   creation; while the second was not, but only when the angels became
   blessed by turning to the good. And this is properly termed their
   morning knowledge.
     __________________________________________________________________
}
