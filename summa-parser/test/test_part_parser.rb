gem 'minitest'
require 'minitest/autorun'
require_relative '../parser/part_parser'

class TestPartParser < MiniTest::Test
  def setup
    @parser = PartParser.new($part)
  end

  def test_VerifyTitle
    expected_title = 'FIRST PART (FP: QQ 1-119)'
    assert_equal(expected_title, @parser.part.title)
  end

  def test_VerifyPrologueForPartWithoutPrologue
    assert_equal(nil, @parser.part.prologue)
  end

  def test_VerifyPrologueForPartWithPrologue
    parser = PartParser.new($part_with_prologue)
    assert_equal($expected_prologue, parser.part.prologue)
  end

  def test_VerifyTreatiseCount
    assert_equal(2, @parser.part.treatises.length)
  end

  def test_VerifyFirstTreatiseTitle
    assert_equal('TREATISE ON SACRED DOCTRINE [1](Q[1])',
                 @parser.part.treatises[0].title)
  end
end

$part = %{
                           FIRST PART (FP: QQ 1-119)
     __________________________________________________________________

TREATISE ON SACRED DOCTRINE [1](Q[1])
     __________________________________________________________________

  THE NATURE AND EXTENT OF SACRED DOCTRINE (TEN ARTICLES)

   To place our purpose within proper limits, we first endeavor to
   investigate the nature and extent of this sacred doctrine. Concerning
   this there are ten points of inquiry:

   (1) Whether it is necessary?

   (2) Whether it is a science?

   (3) Whether it is one or many?

   (4) Whether it is speculative or practical?

   (5) How it is compared with other sciences?

   (6) Whether it is the same as wisdom?

   (7) Whether God is its subject-matter?

   (8) Whether it is a matter of argument?

   (9) Whether it rightly employs metaphors and similes?

   (10) Whether the Sacred Scripture of this doctrine may be expounded in
   different senses?
     __________________________________________________________________

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
     __________________________________________________________________

    Whether it can be demonstrated that God exists?

   Objection 1: It seems that the existence of God cannot be demonstrated.
   For it is an article of faith that God exists. But what is of faith
   cannot be demonstrated, because a demonstration produces scientific
   knowledge; whereas faith is of the unseen (Heb. 11:1). Therefore it
   cannot be demonstrated that God exists.

   Objection 2: Further, the essence is the middle term of demonstration.
   But we cannot know in what God's essence consists, but solely in what
   it does not consist; as Damascene says (De Fide Orth. i, 4). Therefore
   we cannot demonstrate that God exists.

   Objection 3: Further, if the existence of God were demonstrated, this
   could only be from His effects. But His effects are not proportionate
   to Him, since He is infinite and His effects are finite; and between
   the finite and infinite there is no proportion. Therefore, since a
   cause cannot be demonstrated by an effect not proportionate to it, it
   seems that the existence of God cannot be demonstrated.

   On the contrary, The Apostle says: "The invisible things of Him are
   clearly seen, being understood by the things that are made" (Rom.
   1:20). But this would not be unless the existence of God could be
   demonstrated through the things that are made; for the first thing we
   must know of anything is whether it exists.

   I answer that, Demonstration can be made in two ways: One is through
   the cause, and is called "a priori," and this is to argue from what is
   prior absolutely. The other is through the effect, and is called a
   demonstration "a posteriori"; this is to argue from what is prior
   relatively only to us. When an effect is better known to us than its
   cause, from the effect we proceed to the knowledge of the cause. And
   from every effect the existence of its proper cause can be
   demonstrated, so long as its effects are better known to us; because
   since every effect depends upon its cause, if the effect exists, the
   cause must pre-exist. Hence the existence of God, in so far as it is
   not self-evident to us, can be demonstrated from those of His effects
   which are known to us.

   Reply to Objection 1: The existence of God and other like truths about
   God, which can be known by natural reason, are not articles of faith,
   but are preambles to the articles; for faith presupposes natural
   knowledge, even as grace presupposes nature, and perfection supposes
   something that can be perfected. Nevertheless, there is nothing to
   prevent a man, who cannot grasp a proof, accepting, as a matter of
   faith, something which in itself is capable of being scientifically
   known and demonstrated.

   Reply to Objection 2: When the existence of a cause is demonstrated
   from an effect, this effect takes the place of the definition of the
   cause in proof of the cause's existence. This is especially the case in
   regard to God, because, in order to prove the existence of anything, it
   is necessary to accept as a middle term the meaning of the word, and
   not its essence, for the question of its essence follows on the
   question of its existence. Now the names given to God are derived from
   His effects; consequently, in demonstrating the existence of God from
   His effects, we may take for the middle term the meaning of the word
   "God".

   Reply to Objection 3: From effects not proportionate to the cause no
   perfect knowledge of that cause can be obtained. Yet from every effect
   the existence of the cause can be clearly demonstrated, and so we can
   demonstrate the existence of God from His effects; though from them we
   cannot perfectly know God as He is in His essence.
     __________________________________________________________________

TREATISE ON THE MOST HOLY TRINITY (QQ[27]-43)
     __________________________________________________________________

  THE PROCESSION OF THE DIVINE PERSONS (FIVE ARTICLES)

   Having considered what belongs to the unity of the divine essence, it
   remains to treat of what belongs to the Trinity of the persons in God.
   And because the divine Persons are distinguished from each other
   according to the relations of origin, the order of the doctrine leads
   us to consider firstly, the question of origin or procession; secondly,
   the relations of origin; thirdly, the persons.

   Concerning procession there are five points of inquiry:

   (1) Whether there is procession in God?

   (2) Whether any procession in God can be called generation?

   (3) Whether there can be any other procession in God besides
   generation.

   (4) Whether that other procession can be called generation?

   (5) Whether there are more than two processions in God?
     __________________________________________________________________

    Whether there is procession in God?

   Objection 1: It would seem that there cannot be any procession in God.
   For procession signifies outward movement. But in God there is nothing
   mobile, nor anything extraneous. Therefore neither is there procession
   in God.

   Objection 2: Further, everything which proceeds differs from that
   whence it proceeds. But in God there is no diversity; but supreme
   simplicity. Therefore in God there is no procession.

   Objection 3: Further, to proceed from another seems to be against the
   nature of the first principle. But God is the first principle, as shown
   above ([224]Q[2], A[3]). Therefore in God there is no procession.

   On the contrary, Our Lord says, "From God I proceeded" (Jn. 8:42).

   I answer that, Divine Scripture uses, in relation to God, names which
   signify procession. This procession has been differently understood.
   Some have understood it in the sense of an effect, proceeding from its
   cause; so Arius took it, saying that the Son proceeds from the Father
   as His primary creature, and that the Holy Ghost proceeds from the
   Father and the Son as the creature of both. In this sense neither the
   Son nor the Holy Ghost would be true God: and this is contrary to what
   is said of the Son, "That . . . we may be in His true Son. This is true
   God" (1 Jn. 5:20). Of the Holy Ghost it is also said, "Know you not
   that your members are the temple of the Holy Ghost?" (1 Cor. 6:19).
   Now, to have a temple is God's prerogative. Others take this procession
   to mean the cause proceeding to the effect, as moving it, or impressing
   its own likeness on it; in which sense it was understood by Sabellius,
   who said that God the Father is called Son in assuming flesh from the
   Virgin, and that the Father also is called Holy Ghost in sanctifying
   the rational creature, and moving it to life. The words of the Lord
   contradict such a meaning, when He speaks of Himself, "The Son cannot
   of Himself do anything" (Jn. 5:19); while many other passages show the
   same, whereby we know that the Father is not the Son. Careful
   examination shows that both of these opinions take procession as
   meaning an outward act; hence neither of them affirms procession as
   existing in God Himself; whereas, since procession always supposes
   action, and as there is an outward procession corresponding to the act
   tending to external matter, so there must be an inward procession
   corresponding to the act remaining within the agent. This applies most
   conspicuously to the intellect, the action of which remains in the
   intelligent agent. For whenever we understand, by the very fact of
   understanding there proceeds something within us, which is a conception
   of the object understood, a conception issuing from our intellectual
   power and proceeding from our knowledge of that object. This conception
   is signified by the spoken word; and it is called the word of the heart
   signified by the word of the voice.

   As God is above all things, we should understand what is said of God,
   not according to the mode of the lowest creatures, namely bodies, but
   from the similitude of the highest creatures, the intellectual
   substances; while even the similitudes derived from these fall short in
   the representation of divine objects. Procession, therefore, is not to
   be understood from what it is in bodies, either according to local
   movement or by way of a cause proceeding forth to its exterior effect,
   as, for instance, like heat from the agent to the thing made hot.
   Rather it is to be understood by way of an intelligible emanation, for
   example, of the intelligible word which proceeds from the speaker, yet
   remains in him. In that sense the Catholic Faith understands procession
   as existing in God.

   Reply to Objection 1: This objection comes from the idea of procession
   in the sense of local motion, or of an action tending to external
   matter, or to an exterior effect; which kind of procession does not
   exist in God, as we have explained.

   Reply to Objection 2: Whatever proceeds by way of outward procession is
   necessarily distinct from the source whence it proceeds, whereas,
   whatever proceeds within by an intelligible procession is not
   necessarily distinct; indeed, the more perfectly it proceeds, the more
   closely it is one with the source whence it proceeds. For it is clear
   that the more a thing is understood, the more closely is the
   intellectual conception joined and united to the intelligent agent;
   since the intellect by the very act of understanding is made one with
   the object understood. Thus, as the divine intelligence is the very
   supreme perfection of God ([225]Q[14], A[2]), the divine Word is of
   necessity perfectly one with the source whence He proceeds, without any
   kind of diversity.

   Reply to Objection 3: To proceed from a principle, so as to be
   something outside and distinct from that principle, is irreconcilable
   with the idea of a first principle; whereas an intimate and uniform
   procession by way of an intelligible act is included in the idea of a
   first principle. For when we call the builder the principle of the
   house, in the idea of such a principle is included that of his art; and
   it would be included in the idea of the first principle were the
   builder the first principle of the house. God, Who is the first
   principle of all things, may be compared to things created as the
   architect is to things designed.
     __________________________________________________________________

  OF THE PERSONS IN RELATION TO THE ESSENCE (EIGHT ARTICLES)

   Those things considered which belong to the divine persons absolutely,
   we next treat of what concerns the person in reference to the essence,
   to the properties, and to the notional acts; and of the comparison of
   these with each other.

   As regards the first of these, there are eight points of inquiry:

   (1) Whether the essence in God is the same as the person?

   (2) Whether we should say that the three persons are of one essence?

   (3) Whether essential names should be predicated of the persons in the
   plural, or in the singular?

   (4) Whether notional adjectives, or verbs, or participles, can be
   predicated of the essential names taken in a concrete sense?

   (5) Whether the same can be predicated of essential names taken in the
   abstract?

   (6) Whether the names of the persons can be predicated of concrete
   essential names?

   (7) Whether essential attributes can be appropriated to the persons?

   (8) Which attributes should be appropriated to each person?
     __________________________________________________________________

    Whether in God the essence is the same as the person?

   Objection 1: It would seem that in God the essence is not the same as
   person. For whenever essence is the same as person or "suppositum,"
   there can be only one "suppositum" of one nature, as is clear in the
   case of all separate substances. For in those things which are really
   one and the same, one cannot be multiplied apart from the other. But in
   God there is one essence and three persons, as is clear from what is
   above expounded ([310]Q[28], A[3]; [311]Q[30], A[2]). Therefore essence
   is not the same as person.

   Objection 2: Further, simultaneous affirmation and negation of the same
   things in the same respect cannot be true. But affirmation and negation
   are true of essence and of person. For person is distinct, whereas
   essence is not. Therefore person and essence are not the same.

   Objection 3: Further, nothing can be subject to itself. But person is
   subject to essence; whence it is called "suppositum" or "hypostasis."
   Therefore person is not the same as essence.

   On the contrary, Augustine says (De Trin. vi, 7): "When we say the
   person of the Father we mean nothing else but the substance of the
   Father."

   I answer that, The truth of this question is quite clear if we consider
   the divine simplicity. For it was shown above ([312]Q[3], A[3]) that
   the divine simplicity requires that in God essence is the same as
   "suppositum," which in intellectual substances is nothing else than
   person. But a difficulty seems to arise from the fact that while the
   divine persons are multiplied, the essence nevertheless retains its
   unity. And because, as Boethius says (De Trin. i), "relation multiplies
   the Trinity of persons," some have thought that in God essence and
   person differ, forasmuch as they held the relations to be "adjacent";
   considering only in the relations the idea of "reference to another,"
   and not the relations as realities. But as it was shown above
   ([313]Q[28], A[2]) in creatures relations are accidental, whereas in
   God they are the divine essence itself. Thence it follows that in God
   essence is not really distinct from person; and yet that the persons
   are really distinguished from each other. For person, as above stated
   ([314]Q[29], A[4]), signifies relation as subsisting in the divine
   nature. But relation as referred to the essence does not differ
   therefrom really, but only in our way of thinking; while as referred to
   an opposite relation, it has a real distinction by virtue of that
   opposition. Thus there are one essence and three persons.

   Reply to Objection 1: There cannot be a distinction of "suppositum" in
   creatures by means of relations, but only by essential principles;
   because in creatures relations are not subsistent. But in God relations
   are subsistent, and so by reason of the opposition between them they
   distinguish the "supposita"; and yet the essence is not distinguished,
   because the relations themselves are not distinguished from each other
   so far as they are identified with the essence.

   Reply to Objection 2: As essence and person in God differ in our way of
   thinking, it follows that something can be denied of the one and
   affirmed of the other; and therefore, when we suppose the one, we need
   not suppose the other.

   Reply to Objection 3: Divine things are named by us after the way of
   created things, as above explained ([315]Q[13], AA[1],3). And since
   created natures are individualized by matter which is the subject of
   the specific nature, it follows that individuals are called "subjects,"
   "supposita," or "hypostases." So the divine persons are named
   "supposita" or "hypostases," but not as if there really existed any
   real "supposition" or "subjection."
     __________________________________________________________________

    Whether it must be said that the three persons are of one essence?

   Objection 1: It would seem not right to say that the three persons are
   of one essence. For Hilary says (De Synod.) that the Father, Son and
   Holy Ghost "are indeed three by substance, but one in harmony." But the
   substance of God is His essence. Therefore the three persons are not of
   one essence.

   Objection 2: Further, nothing is to be affirmed of God except what can
   be confirmed by the authority of Holy Writ, as appears from Dionysius
   (Div. Nom. i). Now Holy Writ never says that the Father, Son and Holy
   Ghost are of one essence. Therefore this should not be asserted.

   Objection 3: Further, the divine nature is the same as the divine
   essence. It suffices therefore to say that the three persons are of one
   nature.

   Objection 4: Further, it is not usual to say that the person is of the
   essence; but rather that the essence is of the person. Therefore it
   does not seem fitting to say that the three persons are of one essence.

   Objection 5: Further, Augustine says (De Trin. vii, 6) that we do not
   say that the three persons are "from one essence [ex una essentia],"
   lest we should seem to indicate a distinction between the essence and
   the persons in God. But prepositions which imply transition, denote the
   oblique case. Therefore it is equally wrong to say that the three
   persons are "of one essence [unius essentiae]."

   Objection 6: Further, nothing should be said of God which can be
   occasion of error. Now, to say that the three persons are of one
   essence or substance, furnishes occasion of error. For, as Hilary says
   (De Synod.): "One substance predicated of the Father and the Son
   signifies either one subsistent, with two denominations; or one
   substance divided into two imperfect substances; or a third prior
   substance taken and assumed by the other two." Therefore it must not be
   said that the three persons are of one substance.

   On the contrary, Augustine says (Contra Maxim. iii) that the word
   {homoousion}, which the Council of Nicaea adopted against the Arians,
   means that the three persons are of one essence.

   I answer that, As above explained ([316]Q[13], AA[1],2), divine things
   are named by our intellect, not as they really are in themselves, for
   in that way it knows them not; but in a way that belongs to things
   created. And as in the objects of the senses, whence the intellect
   derives its knowledge, the nature of the species is made individual by
   the matter, and thus the nature is as the form, and the individual is
   the "suppositum" of the form; so also in God the essence is taken as
   the form of the three persons, according to our mode of signification.
   Now in creatures we say that every form belongs to that whereof it is
   the form; as the health and beauty of a man belongs to the man. But we
   do not say of that which has a form, that it belongs to the form,
   unless some adjective qualifies the form; as when we say: "That woman
   is of a handsome figure," or: "This man is of perfect virtue." In like
   manner, as in God the persons are multiplied, and the essence is not
   multiplied, we speak of one essence of the three persons, and three
   persons of the one essence, provided that these genitives be understood
   as designating the form.

   Reply to Objection 1: Substance is here taken for the "hypostasis," and
   not for the essence.

   Reply to Objection 2: Although we may not find it declared in Holy Writ
   in so many words that the three persons are of one essence,
   nevertheless we find it so stated as regards the meaning; for instance,
   "I and the Father are one (Jn. 10:30)," and "I am in the Father, and
   the Father in Me (Jn. 10:38)"; and there are many other texts of the
   same import.

   Reply to Objection 3: Because "nature" designates the principle of
   action while "essence" comes from being [essendo], things may be said
   to be of one nature which agree in some action, as all things which
   give heat; but only those things can be said to be of "one essence"
   which have one being. So the divine unity is better described by saying
   that the three persons are "of one essence," than by saying they are
   "of one nature."

   Reply to Objection 4: Form, in the absolute sense, is wont to be
   designated as belonging to that of which it is the form, as we say "the
   virtue of Peter." On the other hand, the thing having form is not wont
   to be designated as belonging to the form except when we wish to
   qualify or designate the form. In which case two genitives are
   required, one signifying the form, and the other signifying the
   determination of the form, as, for instance, when we say, "Peter is of
   great virtue [magnae virtutis]," or else one genitive must have the
   force of two, as, for instance, "he is a man of blood"---that is, he is
   a man who sheds much blood [multi sanguinis]. So, because the divine
   essence signifies a form as regards the person, it may properly be said
   that the essence is of the person; but we cannot say the converse,
   unless we add some term to designate the essence; as, for instance, the
   Father is a person of the "divine essence"; or, the three persons are
   "of one essence."

   Reply to Objection 5: The preposition "from" or "out of" does not
   designate the habitude of a formal cause, but rather the habitude of an
   efficient or material cause; which causes are in all cases
   distinguished from those things of which they are the causes. For
   nothing can be its own matter, nor its own active principle. Yet a
   thing may be its own form, as appears in all immaterial things. So,
   when we say, "three persons of one essence," taking essence as having
   the habitude of form, we do not mean that essence is different from
   person, which we should mean if we said, "three persons from the same
   essence."

   Reply to Objection 6: As Hilary says (De Synod.): "It would be
   prejudicial to holy things, if we had to do away with them, just
   because some do not think them holy. So if some misunderstand
   {homoousion}, what is that to me, if I understand it rightly? . . . The
   oneness of nature does not result from division, or from union or from
   community of possession, but from one nature being proper to both
   Father and Son."
     __________________________________________________________________

    Whether essential names should be predicated in the singular of the three
    persons?

   Objection 1: It would seem that essential names, as the name "God,"
   should not be predicated in the singular of the three persons, but in
   the plural. For as "man" signifies "one that has humanity," so God
   signifies "one that has Godhead." But the three persons are three who
   have Godhead. Therefore the three persons are "three Gods."

   Objection 2: Further, Gn. 1:1, where it is said, "In the beginning God
   created heaven and earth," the Hebrew original has "Elohim," which may
   be rendered "Gods" or "Judges": and this word is used on account of the
   plurality of persons. Therefore the three persons are "several Gods,"
   and not "one" God.

   Objection 3: Further, this word "thing" when it is said absolutely,
   seems to belong to substance. But it is predicated of the three persons
   in the plural. For Augustine says (De Doctr. Christ. i, 5): "The things
   that are the objects of our future glory are the Father, Son and Holy
   Ghost." Therefore other essential names can be predicated in the plural
   of the three persons.

   Objection 4: Further, as this word "God" signifies "a being who has
   Deity," so also this word "person" signifies a being subsisting in an
   intellectual nature. But we say there are three persons. So for the
   same reason we can say there are "three Gods."

   On the contrary, It is said (Dt. 6:4): "Hear, O Israel, the Lord thy
   God is one God."

   I answer that, Some essential names signify the essence after the
   manner of substantives; while others signify it after the manner of
   adjectives. Those which signify it as substantives are predicated of
   the three persons in the singular only, and not in the plural. Those
   which signify the essence as adjectives are predicated of the three
   persons in the plural. The reason of this is that substantives signify
   something by way of substance, while adjectives signify something by
   way of accident, which adheres to a subject. Now just as substance has
   existence of itself, so also it has of itself unity or multitude;
   wherefore the singularity or plurality of a substantive name depends
   upon the form signified by the name. But as accidents have their
   existence in a subject, so they have unity or plurality from their
   subject; and therefore the singularity and plurality of adjectives
   depends upon their "supposita." In creatures, one form does not exist
   in several "supposita" except by unity of order, as the form of an
   ordered multitude. So if the names signifying such a form are
   substantives, they are predicated of many in the singular, but
   otherwise if they adjectives. For we say that many men are a college,
   or an army, or a people; but we say that many men are collegians. Now
   in God the divine essence is signified by way of a form, as above
   explained [317](A[2]), which, indeed, is simple and supremely one, as
   shown above ([318]Q[3], A[7]; [319]Q[11], A[4]). So, names which
   signify the divine essence in a substantive manner are predicated of
   the three persons in the singular, and not in the plural. This, then,
   is the reason why we say that Socrates, Plato and Cicero are "three
   men"; whereas we do not say the Father, Son and Holy Ghost are "three
   Gods," but "one God"; forasmuch as in the three "supposita" of human
   nature there are three humanities, whereas in the three divine Persons
   there is but one divine essence. On the other hand, the names which
   signify essence in an adjectival manner are predicated of the three
   persons plurally, by reason of the plurality of "supposita." For we say
   there are three "existent" or three "wise" beings, or three "eternal,"
   "uncreated," and "immense" beings, if these terms are understood in an
   adjectival sense. But if taken in a substantive sense, we say "one
   uncreated, immense, eternal being," as Athanasius declares.

   Reply to Objection 1: Though the name "God" signifies a being having
   Godhead, nevertheless the mode of signification is different. For the
   name "God" is used substantively; whereas "having Godhead" is used
   adjectively. Consequently, although there are "three having Godhead,"
   it does not follow that there are three Gods.

   Reply to Objection 2: Various languages have diverse modes of
   expression. So as by reason of the plurality of "supposita" the Greeks
   said "three hypostases," so also in Hebrew "Elohim" is in the plural.
   We, however, do not apply the plural either to "God" or to "substance,"
   lest plurality be referred to the substance.

   Reply to Objection 3: This word "thing" is one of the transcendentals.
   Whence, so far as it is referred to relation, it is predicated of God
   in the plural; whereas, so far as it is referred to the substance, it
   is predicated in the singular. So Augustine says, in the passage
   quoted, that "the same Trinity is a thing supreme."

   Reply to Objection 4: The form signified by the word "person" is not
   essence or nature, but personality. So, as there are three
   personalities---that is, three personal properties in the Father, Son
   and Holy Ghost---it is predicated of the three, not in the singular,
   but in the plural.
     __________________________________________________________________

    Whether the concrete essential names can stand for the person?

   Objection 1: It would seem that the concrete, essential names cannot
   stand for the person, so that we can truly say "God begot God." For, as
   the logicians say, "a singular term signifies what it stands for." But
   this name "God" seems to be a singular term, for it cannot be
   predicated in the plural, as above explained [320](A[3]). Therefore,
   since it signifies the essence, it stands for essence, and not for
   person.

   Objection 2: Further, a term in the subject is not modified by a term
   in the predicate, as to its signification; but only as to the sense
   signified in the predicate. But when I say, "God creates," this name
   "God" stands for the essence. So when we say "God begot," this term
   "God" cannot by reason of the notional predicate, stand for person.

   Objection 3: Further, if this be true, "God begot," because the Father
   generates; for the same reason this is true, "God does not beget,"
   because the Son does not beget. Therefore there is God who begets, and
   there is God who does not beget; and thus it follows that there are two
   Gods.

   Objection 4: Further, if "God begot God," He begot either God, that is
   Himself, or another God. But He did not beget God, that is Himself;
   for, as Augustine says (De Trin. i, 1), "nothing begets itself."
   Neither did He beget another God; as there is only one God. Therefore
   it is false to say, "God begot God."

   Objection 5: Further, if "God begot God," He begot either God who is
   the Father, or God who is not the Father. If God who is the Father,
   then God the Father was begotten. If God who is not the Father, then
   there is a God who is not God the Father: which is false. Therefore it
   cannot be said that "God begot God."

   On the contrary, In the Creed it is said, "God of God."

   I answer that, Some have said that this name "God" and the like,
   properly according to their nature, stand for the essence, but by
   reason of some notional adjunct are made to stand for the Person. This
   opinion apparently arose from considering the divine simplicity, which
   requires that in God, He "who possesses" and "what is possessed" be the
   same. So He who possesses Godhead, which is signified by the name God,
   is the same as Godhead. But when we consider the proper way of
   expressing ourselves, the mode of signification must be considered no
   less than the thing signified. Hence as this word "God" signifies the
   divine essence as in Him Who possesses it, just as the name "man"
   signifies humanity in a subject, others more truly have said that this
   word "God," from its mode of signification, can, in its proper sense,
   stand for person, as does the word "man." So this word "God" sometimes
   stands for the essence, as when we say "God creates"; because this
   predicate is attributed to the subject by reason of the form
   signified---that is, Godhead. But sometimes it stands for the person,
   either for only one, as when we say, "God begets," or for two, as when
   we say, "God spirates"; or for three, as when it is said: "To the King
   of ages, immortal, invisible, the only God," etc. (1 Tim. 1:17).

   Reply to Objection 1: Although this name "God" agrees with singular
   terms as regards the form signified not being multiplied; nevertheless
   it agrees also with general terms so far as the form signified is to be
   found in several "supposita." So it need not always stand for the
   essence it signifies.

   Reply to Objection 2: This holds good against those who say that the
   word "God" does not naturally stand for person.

   Reply to Objection 3: The word "God" stands for the person in a
   different way from that in which this word "man" does; for since the
   form signified by this word "man"---that is, humanity---is really
   divided among its different subjects, it stands of itself for the
   person, even if there is no adjunct determining it to the person---that
   is, to a distinct subject. The unity or community of the human nature,
   however, is not a reality, but is only in the consideration of the
   mind. Hence this term "man" does not stand for the common nature,
   unless this is required by some adjunct, as when we say, "man is a
   species"; whereas the form signified by the name "God"---that is, the
   divine essence---is really one and common. So of itself it stands for
   the common nature, but by some adjunct it may be restricted so as to
   stand for the person. So, when we say, "God generates," by reason of
   the notional act this name "God" stands for the person of the Father.
   But when we say, "God does not generate," there is no adjunct to
   determine this name to the person of the Son, and hence the phrase
   means that generation is repugnant to the divine nature. If, however,
   something be added belonging to the person of the Son, this
   proposition, for instance, "God begotten does not beget," is true.
   Consequently, it does not follow that there exists a "God generator,"
   and a "God not generator"; unless there be an adjunct pertaining to the
   persons; as, for instance, if we were to say, "the Father is God the
   generator" and the "Son is God the non-generator" and so it does not
   follow that there are many Gods; for the Father and the Son are one
   God, as was said above [321](A[3]).

   Reply to Objection 4: This is false, "the Father begot God, that is
   Himself," because the word "Himself," as a reciprocal term, refers to
   the same "suppositum." Nor is this contrary to what Augustine says (Ep.
   lxvi ad Maxim.) that "God the Father begot another self [alterum se],"
   forasmuch as the word "se" is either in the ablative case, and then it
   means "He begot another from Himself," or it indicates a single
   relation, and thus points to identity of nature. This is, however,
   either a figurative or an emphatic way of speaking, so that it would
   really mean, "He begot another most like to Himself." Likewise also it
   is false to say, "He begot another God," because although the Son is
   another than the Father, as above explained ([322]Q[31], A[2]),
   nevertheless it cannot be said that He is "another God"; forasmuch as
   this adjective "another" would be understood to apply to the
   substantive God; and thus the meaning would be that there is a
   distinction of Godhead. Yet this proposition "He begot another God" is
   tolerated by some, provided that "another" be taken as a substantive,
   and the word "God" be construed in apposition with it. This, however,
   is an inexact way of speaking, and to be avoided, for fear of giving
   occasion to error.

   Reply to Objection 5: To say, "God begot God Who is God the Father," is
   wrong, because since the word "Father" is construed in apposition to
   "God," the word "God" is restricted to the person of the Father; so
   that it would mean, "He begot God, Who is Himself the Father"; and then
   the Father would be spoken of as begotten, which is false. Wherefore
   the negative of the proposition is true, "He begot God Who is not God
   the Father." If however, we understand these words not to be in
   apposition, and require something to be added, then, on the contrary,
   the affirmative proposition is true, and the negative is false; so that
   the meaning would be, "He begot God Who is God Who is the Father." Such
   a rendering however appears to be forced, so that it is better to say
   simply that the affirmative proposition is false, and the negative is
   true. Yet Prepositivus said that both the negative and affirmative are
   false, because this relative "Who" in the affirmative proposition can
   be referred to the "suppositum"; whereas in the negative it denotes
   both the thing signified and the "suppositum." Whence, in the
   affirmative the sense is that "to be God the Father" is befitting to
   the person of the Son; and in the negative sense is that "to be God the
   Father," is to be removed from the Son's divinity as well as from His
   personality. This, however, appears to be irrational; since, according
   to the Philosopher (Peri Herm. ii), what is open to affirmation, is
   open also to negation.
     __________________________________________________________________

    Whether abstract essential names can stand for the person?

   Objection 1: It would seem that abstract essential names can stand for
   the person, so that this proposition is true, "Essence begets essence."
   For Augustine says (De Trin. vii, i, 2): "The Father and the Son are
   one Wisdom, because they are one essence; and taken singly Wisdom is
   from Wisdom, as essence from essence."

   Objection 2: Further, generation or corruption in ourselves implies
   generation or corruption of what is within us. But the Son is
   generated. Therefore since the divine essence is in the Son, it seems
   that the divine essence is generated.

   Objection 3: Further, God and the divine essence are the same, as is
   clear from what is above explained ([323]Q[3], A[3]). But, as was
   shown, it is true to say that "God begets God." Therefore this is also
   true: "Essence begets essence."

   Objection 4: Further, a predicate can stand for that of which it is
   predicated. But the Father is the divine essence; therefore essence can
   stand for the person of the Father. Thus the essence begets.

   Objection 5: Further, the essence is "a thing begetting," because the
   essence is the Father who is begetting. Therefore if the essence is not
   begetting, the essence will be "a thing begetting," and "not
   begetting": which cannot be.

   Objection 6: Further, Augustine says (De Trin. iv, 20): "The Father is
   the principle of the whole Godhead." But He is principle only by
   begetting or spirating. Therefore the Father begets or spirates the
   Godhead.

   On the contrary, Augustine says (De Trin. i, 1): "Nothing begets
   itself." But if the essence begets the essence, it begets itself only,
   since nothing exists in God as distinguished from the divine essence.
   Therefore the essence does not beget essence.

   I answer that, Concerning this, the abbot Joachim erred in asserting
   that as we can say "God begot God," so we can say "Essence begot
   essence": considering that, by reason of the divine simplicity God is
   nothing else but the divine essence. In this he was wrong, because if
   we wish to express ourselves correctly, we must take into account not
   only the thing which is signified, but also the mode of its
   signification as above stated [324](A[4]). Now although "God" is really
   the same as "Godhead," nevertheless the mode of signification is not in
   each case the same. For since this word "God" signifies the divine
   essence in Him that possesses it, from its mode of signification it can
   of its own nature stand for person. Thus the things which properly
   belong to the persons, can be predicated of this word, "God," as, for
   instance, we can say "God is begotten" or is "Begetter," as above
   explained [325](A[4]). The word "essence," however, in its mode of
   signification, cannot stand for Person, because it signifies the
   essence as an abstract form. Consequently, what properly belongs to the
   persons whereby they are distinguished from each other, cannot be
   attributed to the essence. For that would imply distinction in the
   divine essence, in the same way as there exists distinction in the
   "supposita."

   Reply to Objection 1: To express unity of essence and of person, the
   holy Doctors have sometimes expressed themselves with greater emphasis
   than the strict propriety of terms allows. Whence instead of enlarging
   upon such expressions we should rather explain them: thus, for
   instance, abstract names should be explained by concrete names, or even
   by personal names; as when we find "essence from essence"; or "wisdom
   from wisdom"; we should take the sense to be, "the Son" who is essence
   and wisdom, is from the Father who is essence and wisdom. Nevertheless,
   as regards these abstract names a certain order should be observed,
   forasmuch as what belongs to action is more nearly allied to the
   persons because actions belong to "supposita." So "nature from nature,"
   and "wisdom from wisdom" are less inexact than "essence from essence."

   Reply to Objection 2: In creatures the one generated has not the same
   nature numerically as the generator, but another nature, numerically
   distinct, which commences to exist in it anew by generation, and ceases
   to exist by corruption, and so it is generated and corrupted
   accidentally; whereas God begotten has the same nature numerically as
   the begetter. So the divine nature in the Son is not begotten either
   directly or accidentally.

   Reply to Objection 3: Although God and the divine essence are really
   the same, nevertheless, on account of their different mode of
   signification, we must speak in a different way about each of them.

   Reply to Objection 4: The divine essence is predicated of the Father by
   mode of identity by reason of the divine simplicity; yet it does not
   follow that it can stand for the Father, its mode of signification
   being different. This objection would hold good as regards things which
   are predicated of another as the universal of a particular.

   Reply to Objection 5: The difference between substantive and adjectival
   names consist in this, that the former carry their subject with them,
   whereas the latter do not, but add the thing signified to the
   substantive. Whence logicians are wont to say that the substantive is
   considered in the light of "suppositum," whereas the adjective
   indicates something added to the "suppositum." Therefore substantive
   personal terms can be predicated of the essence, because they are
   really the same; nor does it follow that a personal property makes a
   distinct essence; but it belongs to the "suppositum" implied in the
   substantive. But notional and personal adjectives cannot be predicated
   of the essence unless we add some substantive. We cannot say that the
   "essence is begetting"; yet we can say that the "essence is a thing
   begetting," or that it is "God begetting," if "thing" and God stand for
   person, but not if they stand for essence. Consequently there exists no
   contradiction in saying that "essence is a thing begetting," and "a
   thing not begetting"; because in the first case "thing" stands for
   person, and in the second it stands for the essence.

   Reply to Objection 6: So far as Godhead is one in several "supposita,"
   it agrees in a certain degree with the form of a collective term. So
   when we say, "the Father is the principle of the whole Godhead," the
   term Godhead can be taken for all the persons together, inasmuch as it
   is the principle in all the divine persons. Nor does it follow that He
   is His own principle; as one of the people may be called the ruler of
   the people without being ruler of himself. We may also say that He is
   the principle of the whole Godhead; not as generating or spirating it,
   but as communicating it by generation and spiration.
     __________________________________________________________________

    Whether the persons can be predicated of the essential terms?

   Objection 1: It would seem that the persons cannot be predicated of the
   concrete essential names; so that we can say for instance, "God is
   three persons"; or "God is the Trinity." For it is false to say, "man
   is every man," because it cannot be verified as regards any particular
   subject. For neither Socrates, nor Plato, nor anyone else is every man.
   In the same way this proposition, "God is the Trinity," cannot be
   verified of any one of the "supposita" of the divine nature. For the
   Father is not the Trinity; nor is the Son; nor is the Holy Ghost. So to
   say, "God is the Trinity," is false.

   Objection 2: Further, the lower is not predicated of the higher except
   by accidental predication; as when I say, "animal is man"; for it is
   accidental to animal to be man. But this name "God" as regards the
   three persons is as a general term to inferior terms, as Damascene says
   (De Fide Orth. iii, 4). Therefore it seems that the names of the
   persons cannot be predicated of this name "God," except in an
   accidental sense.

   On the contrary, Augustine says, in his sermon on Faith [*Serm. ii, in
   coena Domini], "We believe that one God is one divinely named Trinity."

   I answer that, As above explained [326](A[5]), although adjectival
   terms, whether personal or notional, cannot be predicated of the
   essence, nevertheless substantive terms can be so predicated, owing to
   the real identity of essence and person. The divine essence is not only
   really the same as one person, but it is really the same as the three
   persons. Whence, one person, and two, and three, can be predicated of
   the essence as if we were to say, "The essence is the Father, and the
   Son, and the Holy Ghost." And because this word "God" can of itself
   stand for the essence, as above explained (A[4], ad 3), hence, as it is
   true to say, "The essence is the three persons"; so likewise it is true
   to say, "God is the three persons."

   Reply to Objection 1: As above explained this term "man" can of itself
   stand for person, whereas an adjunct is required for it to stand for
   the universal human nature. So it is false to say, "Man is every man";
   because it cannot be verified of any particular human subject. On the
   contrary, this word "God" can of itself be taken for the divine
   essence. So, although to say of any of the "supposita" of the divine
   nature, "God is the Trinity," is untrue, nevertheless it is true of the
   divine essence. This was denied by Porretanus because he did not take
   note of this distinction.

   Reply to Objection 2: When we say, "God," or "the divine essence is the
   Father," the predication is one of identity, and not of the lower in
   regard to a higher species: because in God there is no universal and
   singular. Hence, as this proposition, "The Father is God" is of itself
   true, so this proposition "God is the Father" is true of itself, and by
   no means accidentally.
     __________________________________________________________________

    Whether the essential names should be appropriated to the persons?

   Objection 1: It would seem that the essential names should not be
   appropriated to the persons. For whatever might verge on error in faith
   should be avoided in the treatment of divine things; for, as Jerome
   says, "careless words involve risk of heresy" [*In substance Ep.
   lvii.]. But to appropriate to any one person the names which are common
   to the three persons, may verge on error in faith; for it may be
   supposed either that such belong only to the person to whom they are
   appropriated or that they belong to Him in a fuller degree than to the
   others. Therefore the essential attributes should not be appropriated
   to the persons.

   Objection 2: Further, the essential attributes expressed in the
   abstract signify by mode of form. But one person is not as a form to
   another; since a form is not distinguished in subject from that of
   which it is the form. Therefore the essential attributes, especially
   when expressed in the abstract, are not to be appropriated to the
   persons.

   Objection 3: Further, property is prior to the appropriated, for
   property is included in the idea of the appropriated. But the essential
   attributes, in our way of understanding, are prior to the persons; as
   what is common is prior to what is proper. Therefore the essential
   attributes are not to be appropriated to the persons.

   On the contrary, the Apostle says: "Christ the power of God and the
   wisdom of God" (1 Cor. 1:24).

   I answer that, For the manifestation of our faith it is fitting that
   the essential attributes should be appropriated to the persons. For
   although the trinity of persons cannot be proved by demonstration, as
   was above expounded ([327]Q[32], A[1]), nevertheless it is fitting that
   it be declared by things which are more known to us. Now the essential
   attributes of God are more clear to us from the standpoint of reason
   than the personal properties; because we can derive certain knowledge
   of the essential attributes from creatures which are sources of
   knowledge to us, such as we cannot obtain regarding the personal
   properties, as was above explained ([328]Q[32], A[1]). As, therefore,
   we make use of the likeness of the trace or image found in creatures
   for the manifestation of the divine persons, so also in the same manner
   do we make use of the essential attributes. And such a manifestation of
   the divine persons by the use of the essential attributes is called
   "appropriation."

   The divine person can be manifested in a twofold manner by the
   essential attributes; in one way by similitude, and thus the things
   which belong to the intellect are appropriated to the Son, Who proceeds
   by way of intellect, as Word. In another way by dissimilitude; as power
   is appropriated to the Father, as Augustine says, because fathers by
   reason of old age are sometimes feeble; lest anything of the kind be
   imagined of God.

   Reply to Objection 1: The essential attributes are not appropriated to
   the persons as if they exclusively belonged to them; but in order to
   make the persons manifest by way of similitude, or dissimilitude, as
   above explained. So, no error in faith can arise, but rather
   manifestation of the truth.

   Reply to Objection 2: If the essential attributes were appropriated to
   the persons as exclusively belonging to each of them, then it would
   follow that one person would be as a form as regards another; which
   Augustine altogether repudiates (De Trin. vi, 2), showing that the
   Father is wise, not by Wisdom begotten by Him, as though only the Son
   were Wisdom; so that the Father and the Son together only can be called
   wise, but not the Father without the Son. But the Son is called the
   Wisdom of the Father, because He is Wisdom from the Father Who is
   Wisdom. For each of them is of Himself Wisdom; and both together are
   one Wisdom. Whence the Father is not wise by the wisdom begotten by
   Him, but by the wisdom which is His own essence.

   Reply to Objection 3: Although the essential attribute is in its proper
   concept prior to person, according to our way of understanding;
   nevertheless, so far as it is appropriated, there is nothing to prevent
   the personal property from being prior to that which is appropriated.
   Thus color is posterior to body considered as body, but is naturally
   prior to "white body," considered as white.
     __________________________________________________________________

    Whether the essential attributes are appropriated to the persons in a
    fitting manner by the holy doctors?

   Objection 1: It would seem that the essential attributes are
   appropriated to the persons unfittingly by the holy doctors. For Hilary
   says (De Trin. ii): "Eternity is in the Father, the species in the
   Image; and use is in the Gift." In which words he designates three
   names proper to the persons: the name of the "Father," the name "Image"
   proper to the Son ([329]Q[35], A[2]), and the name "Bounty" or "Gift,"
   which is proper to the Holy Ghost ([330]Q[38], A[2]). He also
   designates three appropriated terms. For he appropriates "eternity" to
   the Father, "species" to the Son, and "use" to the Holy Ghost. This he
   does apparently without reason. For "eternity" imports duration of
   existence; "species," the principle of existence; and 'use' belongs to
   the operation. But essence and operation are not found to be
   appropriated to any person. Therefore the above terms are not fittingly
   appropriated to the persons.

   Objection 2: Further, Augustine says (De Doctr. Christ. i, 5): "Unity
   is in the Father, equality in the Son, and in the Holy Ghost is the
   concord of equality and unity." This does not, however, seem fitting;
   because one person does not receive formal denomination from what is
   appropriated to another. For the Father is not wise by the wisdom
   begotten, as above explained ([331]Q[37], A[2], ad 1). But, as he
   subjoins, "All these three are one by the Father; all are equal by the
   Son, and all united by the Holy Ghost." The above, therefore, are not
   fittingly appropriated to the Persons.

   Objection 3: Further, according to Augustine, to the Father is
   attributed "power," to the Son "wisdom," to the Holy Ghost "goodness."
   Nor does this seem fitting; for "strength" is part of power, whereas
   strength is found to be appropriated to the Son, according to the text,
   "Christ the strength [*Douay: power] of God" (1 Cor. 1:24). So it is
   likewise appropriated to the Holy Ghost, according to the words,
   "strength [*Douay: virtue] came out from Him and healed all" (Lk.
   6:19). Therefore power should not be appropriated to the Father.

   Objection 4: Likewise Augustine says (De Trin. vi, 10): "What the
   Apostle says, "From Him, and by Him, and in Him," is not to be taken in
   a confused sense." And (Contra Maxim. ii) "'from Him' refers to the
   Father, 'by Him' to the Son, 'in Him' to the Holy Ghost.'" This,
   however, seems to be incorrectly said; for the words "in Him" seem to
   imply the relation of final cause, which is first among the causes.
   Therefore this relation of cause should be appropriated to the Father,
   Who is "the principle from no principle."

   Objection 5: Likewise, Truth is appropriated to the Son, according to
   Jn. 14:6, "I am the Way, the Truth, and the Life"; and likewise "the
   book of life," according to Ps. 39:9, "In the beginning of the book it
   is written of Me," where a gloss observes, "that is, with the Father
   Who is My head," also this word "Who is"; because on the text of Is.
   65:1, "Behold I go to the Gentiles," a gloss adds, "The Son speaks Who
   said to Moses, I am Who am." These appear to belong to the Son, and are
   not appropriated. For "truth," according to Augustine (De Vera Relig.
   36), "is the supreme similitude of the principle without any
   dissimilitude." So it seems that it properly belongs to the Son, Who
   has a principle. Also the "book of life" seems proper to the Son, as
   signifying "a thing from another"; for every book is written by
   someone. This also, "Who is," appears to be proper to the Son; because
   if when it was said to Moses, "I am Who am," the Trinity spoke, then
   Moses could have said, "He Who is Father, Son, and Holy Ghost, and the
   Holy Ghost sent me to you," so also he could have said further, "He Who
   is the Father, and the Son, and the Holy Ghost sent me to you,"
   pointing out a certain person. This, however, is false; because no
   person is Father, Son and Holy Ghost. Therefore it cannot be common to
   the Trinity, but is proper to the Son.

   I answer that, Our intellect, which is led to the knowledge of God from
   creatures, must consider God according to the mode derived from
   creatures. In considering any creature four points present themselves
   to us in due order. Firstly, the thing itself taken absolutely is
   considered as a being. Secondly, it is considered as one. Thirdly, its
   intrinsic power of operation and causality is considered. The fourth
   point of consideration embraces its relation to its effects. Hence this
   fourfold consideration comes to our mind in reference to God.

   According to the first point of consideration, whereby we consider God
   absolutely in His being, the appropriation mentioned by Hilary applies,
   according to which "eternity" is appropriated to the Father, "species"
   to the Son, "use" to the Holy Ghost. For "eternity" as meaning a
   "being" without a principle, has a likeness to the property of the
   Father, Who is "a principle without a principle." Species or beauty has
   a likeness to the property of the Son. For beauty includes three
   conditions, "integrity" or "perfection," since those things which are
   impaired are by the very fact ugly; due "proportion" or "harmony"; and
   lastly, "brightness" or "clarity," whence things are called beautiful
   which have a bright color.

   The first of these has a likeness to the property of the Son, inasmuch
   as He as Son has in Himself truly and perfectly the nature of the
   Father. To insinuate this, Augustine says in his explanation (De Trin.
   vi, 10): "Where---that is, in the Son---there is supreme and primal
   life," etc.

   The second agrees with the Son's property, inasmuch as He is the
   express Image of the Father. Hence we see that an image is said to be
   beautiful, if it perfectly represents even an ugly thing. This is
   indicated by Augustine when he says (De Trin. vi, 10), "Where there
   exists wondrous proportion and primal equality," etc.

   The third agrees with the property of the Son, as the Word, which is
   the light and splendor of the intellect, as Damascene says (De Fide
   Orth. iii, 3). Augustine alludes to the same when he says (De Trin. vi,
   10): "As the perfect Word, not wanting in anything, and, so to speak,
   the art of the omnipotent God," etc.

   "Use" has a likeness to the property of the Holy Ghost; provided the
   "use" be taken in a wide sense, as including also the sense of "to
   enjoy"; according as "to use" is to employ something at the beck of the
   will, and "to enjoy" means to use joyfully, as Augustine says (De Trin.
   x, 11). So "use," whereby the Father and the Son enjoy each other,
   agrees with the property of the Holy Ghost, as Love. This is what
   Augustine says (De Trin. vi, 10): "That love, that delectation, that
   felicity or beatitude, is called use by him" (Hilary). But the "use" by
   which we enjoy God, is likened to the property of the Holy Ghost as the
   Gift; and Augustine points to this when he says (De Trin. vi, 10): "In
   the Trinity, the Holy Ghost, the sweetness of the Begettor and the
   Begotten, pours out upon us mere creatures His immense bounty and
   wealth." Thus it is clear how "eternity," "species," and "use" are
   attributed or appropriated to the persons, but not essence or
   operation; because, being common, there is nothing in their concept to
   liken them to the properties of the Persons.

   The second consideration of God regards Him as "one." In that view
   Augustine (De Doctr. Christ. i, 5) appropriates "unity" to the Father,
   "equality" to the Son, "concord" or "union" to the Holy Ghost. It is
   manifest that these three imply unity, but in different ways. For
   "unity" is said absolutely, as it does not presuppose anything else;
   and for this reason it is appropriated to the Father, to Whom any other
   person is not presupposed since He is the "principle without
   principle." "Equality" implies unity as regards another; for that is
   equal which has the same quantity as another. So equality is
   appropriated to the Son, Who is the "principle from a principle."
   "Union" implies the unity of two; and is therefore appropriated to the
   Holy Ghost, inasmuch as He proceeds from two. And from this we can
   understand what Augustine means when he says (De Doctr. Christ. i, 5)
   that "The Three are one, by reason of the Father; They are equal by
   reason of the Son; and are united by reason of the Holy Ghost." For it
   is clear that we trace a thing back to that in which we find it first:
   just as in this lower world we attribute life to the vegetative soul,
   because therein we find the first trace of life. Now "unity" is
   perceived at once in the person of the Father, even if by an impossible
   hypothesis, the other persons were removed. So the other persons derive
   their unity from the Father. But if the other persons be removed, we do
   not find equality in the Father, but we find it as soon as we suppose
   the Son. So, all are equal by reason of the Son, not as if the Son were
   the principle of equality in the Father, but that, without the Son
   equal to the Father, the Father could not be called equal; because His
   equality is considered firstly in regard to the Son: for that the Holy
   Ghost is equal to the Father, is also from the Son. Likewise, if the
   Holy Ghost, Who is the union of the two, be excluded, we cannot
   understand the oneness of the union between the Father and the Son. So
   all are connected by reason of the Holy Ghost; because given the Holy
   Ghost, we find whence the Father and the Son are said to be united.

   According to the third consideration, which brings before us the
   adequate power of God in the sphere of causality, there is said to be a
   third kind of appropriation, of "power," "wisdom," and "goodness." This
   kind of appropriation is made both by reason of similitude as regards
   what exists in the divine persons, and by reason of dissimilitude if we
   consider what is in creatures. For "power" has the nature of a
   principle, and so it has a likeness to the heavenly Father, Who is the
   principle of the whole Godhead. But in an earthly father it is wanting
   sometimes by reason of old age. "Wisdom" has likeness to the heavenly
   Son, as the Word, for a word is nothing but the concept of wisdom. In
   an earthly son this is sometimes absent by reason of lack of years.
   "Goodness," as the nature and object of love, has likeness to the Holy
   Ghost; but seems repugnant to the earthly spirit, which often implies a
   certain violent impulse, according to Is. 25:4: "The spirit of the
   strong is as a blast beating on the wall." "Strength" is appropriated
   to the Son and to the Holy Ghost, not as denoting the power itself of a
   thing, but as sometimes used to express that which proceeds from power;
   for instance, we say that the strong work done by an agent is its
   strength.

   According to the fourth consideration, i.e. God's relation to His
   effects, there arise appropriation of the expression "from Whom, by
   Whom, and in Whom." For this preposition "from" [ex] sometimes implies
   a certain relation of the material cause; which has no place in God;
   and sometimes it expresses the relation of the efficient cause, which
   can be applied to God by reason of His active power; hence it is
   appropriated to the Father in the same way as power. The preposition
   "by" [per] sometimes designates an intermediate cause; thus we may say
   that a smith works "by" a hammer. Hence the word "by" is not always
   appropriated to the Son, but belongs to the Son properly and strictly,
   according to the text, "All things were made by Him" (Jn. 1:3); not
   that the Son is an instrument, but as "the principle from a principle."
   Sometimes it designates the habitude of a form "by" which an agent
   works; thus we say that an artificer works by his art. Hence, as wisdom
   and art are appropriated to the Son, so also is the expression "by
   Whom." The preposition "in" strictly denotes the habitude of one
   containing. Now, God contains things in two ways: in one way by their
   similitudes; thus things are said to be in God, as existing in His
   knowledge. In this sense the expression "in Him" should be appropriated
   to the Son. In another sense things are contained in God forasmuch as
   He in His goodness preserves and governs them, by guiding them to a
   fitting end; and in this sense the expression "in Him" is appropriated
   to the Holy Ghost, as likewise is "goodness." Nor need the habitude of
   the final cause (though the first of causes) be appropriated to the
   Father, Who is "the principle without a principle": because the divine
   persons, of Whom the Father is the principle, do not proceed from Him
   as towards an end, since each of Them is the last end; but They proceed
   by a natural procession, which seems more to belong to the nature of a
   natural power.

   Regarding the other points of inquiry, we can say that since "truth"
   belongs to the intellect, as stated above ([332]Q[16], A[1]), it is
   appropriated to the Son, without, however, being a property of His. For
   truth can be considered as existing in the thought or in the thing
   itself. Hence, as intellect and thing in their essential meaning, are
   referred to the essence, and not to the persons, so the same is to be
   said of truth. The definition quoted from Augustine belongs to truth as
   appropriated to the Son. The "book of life" directly means knowledge
   but indirectly it means life. For, as above explained ([333]Q[24],
   A[1]), it is God's knowledge regarding those who are to possess eternal
   life. Consequently, it is appropriated to the Son; although life is
   appropriated to the Holy Ghost, as implying a certain kind of interior
   movement, agreeing in that sense with the property of the Holy Ghost as
   Love. To be written by another is not of the essence of a book
   considered as such; but this belongs to it only as a work produced. So
   this does not imply origin; nor is it personal, but an appropriation to
   a person. The expression "Who is" is appropriated to the person of the
   Son, not by reason of itself, but by reason of an adjunct, inasmuch as,
   in God's word to Moses, was prefigured the delivery of the human race
   accomplished by the Son. Yet, forasmuch as the word "Who" is taken in a
   relative sense, it may sometimes relate to the person of the Son; and
   in that sense it would be taken personally; as, for instance, were we
   to say, "The Son is the begotten 'Who is,'" inasmuch as "God begotten
   is personal." But taken indefinitely, it is an essential term. And
   although the pronoun "this" [iste] seems grammatically to point to a
   particular person, nevertheless everything that we can point to can be
   grammatically treated as a person, although in its own nature it is not
   a person; as we may say, "this stone," and "this ass." So, speaking in
   a grammatical sense, so far as the word "God" signifies and stands for
   the divine essence, the latter may be designated by the pronoun "this,"
   according to Ex. 15:2: "This is my God, and I will glorify Him."
     __________________________________________________________________

                 FIRST PART OF THE SECOND PART (FS) (QQ[1]-114)
}

$expected_prologue = %{Forasmuch as our Saviour the Lord Jesus Christ, in order to "save His people from their sins" (Mat. 1:21), as the angel announced, showed unto us in His own Person the way of truth, whereby we may attain to the bliss of eternal life by rising again, it is necessary, in order to complete the work of theology, that after considering the last end of human life, and the virtues and vices, there should follow the consideration of the Saviour of all, and of the benefits bestowed by Him on the human race.
Concerning this we must consider (1) the Saviour Himself; (2) the sacraments by which we attain to our salvation; (3) the end of immortal life to which we attain by the resurrection.
Concerning the first, a double consideration occurs: the first, about the mystery of the Incarnation itself, whereby God was made man for our salvation; the second, about such things as were done and suffered by our Saviour---i.e. God incarnate.}

$part_with_prologue = %{

               THIRD PART (TP) OF THE SUMMA THEOLOGICA (QQ[1]-90)
     __________________________________________________________________

PROLOGUE

   Forasmuch as our Saviour the Lord Jesus Christ, in order to "save His
   people from their sins" (Mat. 1:21), as the angel announced, showed
   unto us in His own Person the way of truth, whereby we may attain to
   the bliss of eternal life by rising again, it is necessary, in order to
   complete the work of theology, that after considering the last end of
   human life, and the virtues and vices, there should follow the
   consideration of the Saviour of all, and of the benefits bestowed by
   Him on the human race.

   Concerning this we must consider (1) the Saviour Himself; (2) the
   sacraments by which we attain to our salvation; (3) the end of immortal
   life to which we attain by the resurrection.

   Concerning the first, a double consideration occurs: the first, about
   the mystery of the Incarnation itself, whereby God was made man for our
   salvation; the second, about such things as were done and suffered by
   our Saviour---i.e. God incarnate.
     __________________________________________________________________

TREATISE ON THE INCARNATION (QQ[1]-59)
}
