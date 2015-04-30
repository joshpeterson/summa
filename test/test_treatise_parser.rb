gem "minitest"
require "minitest/autorun"
require_relative '../parser/treatise_parser'

class TestTreatiseParser < MiniTest::Test
	def setup
		@parser = TreatiseParser.new $treatise
	end

	def test_VerifyTitle
		expected_title = "TREATISE ON THE DISTINCTION OF GOOD AND EVIL (QQ[48]-49)"
		assert_equal expected_title, @parser.treatise.title
	end

	def test_VerifyPrologueIsNil
        assert_nil @parser.treatise.prologue
	end

	def test_VerifyPrologueInTreatiseWithPrologue
        expected_prologue = %{Since, as Damascene states (De Fide Orth. ii, 12), man is said to be made in God's image, in so far as the image implies "an intelligent being endowed with free-will and self-movement": now that we have treated of the exemplar, i.e. God, and of those things which came forth from the power of God in accordance with His will; it remains for us to treat of His image, i.e. man, inasmuch as he too is the principle of his actions, as having free-will and control of his actions.}
		parser = TreatiseParser.new $treatise_with_prologue
        assert_equal expected_prologue, parser.treatise.prologue
	end

	def test_VerifyCorrectNumberOfQuestionsFound
        skip "Question parsing needs to be implemented."
        assert_equal 2, @parser.treatise.questions.size
	end
end

$treatise = %{
TREATISE ON THE DISTINCTION OF GOOD AND EVIL (QQ[48]-49)
     __________________________________________________________________

  THE DISTINCTION OF THINGS IN PARTICULAR (SIX ARTICLES)

   We must now consider the distinction of things in particular; and
   firstly the distinction of good and evil; and then the distinction of
   the spiritual and corporeal creatures.

   Concerning the first, we inquire into evil and its cause.

   Concerning evil, six points are to be considered:

   (1) Whether evil is a nature?

   (2) Whether evil is found in things?

   (3) Whether good is the subject of evil?

   (4) Whether evil totally corrupts good?

   (5) The division of evil into pain and fault.

   (6) Whether pain, or fault, has more the nature of evil?
     __________________________________________________________________

    Whether evil is a nature?

   Objection 1: It would seem that evil is a nature. For every genus is a
   nature. But evil is a genus; for the Philosopher says (Praedic. x) that
   "good and evil are not in a genus, but are genera of other things."
   Therefore evil is a nature.

   Objection 2: Further, every difference which constitutes a species is a
   nature. But evil is a difference constituting a species of morality;
   for a bad habit differs in species from a good habit, as liberality
   from illiberality. Therefore evil signifies a nature.

   Objection 3: Further, each extreme of two contraries is a nature. But
   evil and good are not opposed as privation and habit, but as
   contraries, as the Philosopher shows (Praedic. x) by the fact that
   between good and evil there is a medium, and from evil there can be a
   return to good. Therefore evil signifies a nature.

   Objection 4: Further, what is not, acts not. But evil acts, for it
   corrupts good. Therefore evil is a being and a nature.

   Objection 5: Further, nothing belongs to the perfection of the universe
   except what is a being and a nature. But evil belongs to the perfection
   of the universe of things; for Augustine says (Enchir. 10,11) that the
   "admirable beauty of the universe is made up of all things. In which
   even what is called evil, well ordered and in its place, is the eminent
   commendation of what is good." Therefore evil is a nature.

   On the contrary, Dionysius says (Div. Nom. iv), "Evil is neither a
   being nor a good."

   I answer that, One opposite is known through the other, as darkness is
   known through light. Hence also what evil is must be known from the
   nature of good. Now, we have said above that good is everything
   appetible; and thus, since every nature desires its own being and its
   own perfection, it must be said also that the being and the perfection
   of any nature is good. Hence it cannot be that evil signifies being, or
   any form or nature. Therefore it must be that by the name of evil is
   signified the absence of good. And this is what is meant by saying that
   "evil is neither a being nor a good." For since being, as such, is
   good, the absence of one implies the absence of the other.

   Reply to Objection 1: Aristotle speaks there according to the opinion
   of Pythagoreans, who thought that evil was a kind of nature; and
   therefore they asserted the existence of the genus of good and evil.
   For Aristotle, especially in his logical works, brings forward examples
   that in his time were probable in the opinion of some philosophers. Or,
   it may be said that, as the Philosopher says (Metaph. iv, text 6), "the
   first kind of contrariety is habit and privation," as being verified in
   all contraries; since one contrary is always imperfect in relation to
   another, as black in relation to white, and bitter in relation to
   sweet. And in this way good and evil are said to be genera not simply,
   but in regard to contraries; because, as every form has the nature of
   good, so every privation, as such, has the nature of evil.

   Reply to Objection 2: Good and evil are not constitutive differences
   except in morals, which receive their species from the end, which is
   the object of the will, the source of all morality. And because good
   has the nature of an end, therefore good and evil are specific
   differences in moral things; good in itself, but evil as the absence of
   the due end. Yet neither does the absence of the due end by itself
   constitute a moral species, except as it is joined to the undue end;
   just as we do not find the privation of the substantial form in natural
   things, unless it is joined to another form. Thus, therefore, the evil
   which is a constitutive difference in morals is a certain good joined
   to the privation of another good; as the end proposed by the
   intemperate man is not the privation of the good of reason, but the
   delight of sense without the order of reason. Hence evil is not a
   constitutive difference as such, but by reason of the good that is
   annexed.

   Reply to Objection 3: This appears from the above. For the Philosopher
   speaks there of good and evil in morality. Because in that respect,
   between good and evil there is a medium, as good is considered as
   something rightly ordered, and evil as a thing not only out of right
   order, but also as injurious to another. Hence the Philosopher says
   (Ethic. iv, i) that a "prodigal man is foolish, but not evil." And from
   this evil in morality, there may be a return to good, but not from any
   sort of evil, for from blindness there is no return to sight, although
   blindness is an evil.

   Reply to Objection 4: A thing is said to act in a threefold sense. In
   one way, formally, as when we say that whiteness makes white; and in
   that sense evil considered even as a privation is said to corrupt good,
   forasmuch as it is itself a corruption or privation of good. In another
   sense a thing is said to act effectively, as when a painter makes a
   wall white. Thirdly, it is said in the sense of the final cause, as the
   end is said to effect by moving the efficient cause. But in these two
   ways evil does not effect anything of itself, that is, as a privation,
   but by virtue of the good annexed to it. For every action comes from
   some form; and everything which is desired as an end, is a perfection.
   And therefore, as Dionysius says (Div. Nom. iv): "Evil does not act,
   nor is it desired, except by virtue of some good joined to it: while of
   itself it is nothing definite, and beside the scope of our will and
   intention."

   Reply to Objection 5: As was said above, the parts of the universe are
   ordered to each other, according as one acts on the other, and
   according as one is the end and exemplar of the other. But, as was said
   above, this can only happen to evil as joined to some good. Hence evil
   neither belongs to the perfection of the universe, nor does it come
   under the order of the same, except accidentally, that is, by reason of
   some good joined to it.
     __________________________________________________________________

    Whether evil is found in things?

   Objection 1: It would seem that evil is not found in things. For
   whatever is found in things, is either something, or a privation of
   something, that is a "not-being." But Dionysius says (Div. Nom. iv)
   that "evil is distant from existence, and even more distant from
   non-existence." Therefore evil is not at all found in things.

   Objection 2: Further, "being" and "thing" are convertible. If therefore
   evil is a being in things, it follows that evil is a thing, which is
   contrary to what has been said [421](A[1]).

   Objection 3: Further, "the white unmixed with black is the most white,"
   as the Philosopher says (Topic. iii, 4). Therefore also the good
   unmixed with evil is the greater good. But God makes always what is
   best, much more than nature does. Therefore in things made by God there
   is no evil.

   On the contrary, On the above assumptions, all prohibitions and
   penalties would cease, for they exist only for evils.

   I answer that, As was said above ([422]Q[47], AA[1],2), the perfection
   of the universe requires that there should be inequality in things, so
   that every grade of goodness may be realized. Now, one grade of
   goodness is that of the good which cannot fail. Another grade of
   goodness is that of the good which can fail in goodness, and this grade
   is to be found in existence itself; for some things there are which
   cannot lose their existence as incorruptible things, while some there
   are which can lose it, as things corruptible.

   As, therefore, the perfection of the universe requires that there
   should be not only beings incorruptible, but also corruptible beings;
   so the perfection of the universe requires that there should be some
   which can fail in goodness, and thence it follows that sometimes they
   do fail. Now it is in this that evil consists, namely, in the fact that
   a thing fails in goodness. Hence it is clear that evil is found in
   things, as corruption also is found; for corruption is itself an evil.

   Reply to Objection 1: Evil is distant both from simple being and from
   simple "not-being," because it is neither a habit nor a pure negation,
   but a privation.

   Reply to Objection 2: As the Philosopher says (Metaph. v, text 14),
   being is twofold. In one way it is considered as signifying the entity
   of a thing, as divisible by the ten "predicaments"; and in that sense
   it is convertible with thing, and thus no privation is a being, and
   neither therefore is evil a being. In another sense being conveys the
   truth of a proposition which unites together subject and attribute by a
   copula, notified by this word "is"; and in this sense being is what
   answers to the question, "Does it exist?" and thus we speak of
   blindness as being in the eye; or of any other privation. In this way
   even evil can be called a being. Through ignorance of this distinction
   some, considering that things may be evil, or that evil is said to be
   in things, believed that evil was a positive thing in itself.

   Reply to Objection 3: God and nature and any other agent make what is
   best in the whole, but not what is best in every single part, except in
   order to the whole, as was said above ([423]Q[47], A[2]). And the whole
   itself, which is the universe of creatures, is all the better and more
   perfect if some things in it can fail in goodness, and do sometimes
   fail, God not preventing this. This happens, firstly, because "it
   belongs to Providence not to destroy, but to save nature," as Dionysius
   says (Div. Nom. iv); but it belongs to nature that what may fail should
   sometimes fail; secondly, because, as Augustine says (Enchir. 11), "God
   is so powerful that He can even make good out of evil." Hence many good
   things would be taken away if God permitted no evil to exist; for fire
   would not be generated if air was not corrupted, nor would the life of
   a lion be preserved unless the ass were killed. Neither would avenging
   justice nor the patience of a sufferer be praised if there were no
   injustice.
     __________________________________________________________________

    Whether evil is in good as in its subject?

   Objection 1: It would seem that evil is not in good as its subject. For
   good is something that exists. But Dionysius says (Div. Nom. iv, 4)
   that "evil does not exist, nor is it in that which exists." Therefore,
   evil is not in good as its subject.

   Objection 2: Further, evil is not a being; whereas good is a being. But
   "non-being" does not require being as its subject. Therefore, neither
   does evil require good as its subject.

   Objection 3: Further, one contrary is not the subject of another. But
   good and evil are contraries. Therefore, evil is not in good as in its
   subject.

   Objection 4: Further, the subject of whiteness is called white.
   Therefore also the subject of evil is evil. If, therefore, evil is in
   good as in its subject, it follows that good is evil, against what is
   said (Is. 5:20): "Woe to you who call evil good, and good evil!"

   On the contrary, Augustine says (Enchiridion 14) that "evil exists only
   in good."

   I answer that, As was said above [424](A[1]), evil imports the absence
   of good. But not every absence of good is evil. For absence of good can
   be taken in a privative and in a negative sense. Absence of good, taken
   negatively, is not evil; otherwise, it would follow that what does not
   exist is evil, and also that everything would be evil, through not
   having the good belonging to something else; for instance, a man would
   be evil who had not the swiftness of the roe, or the strength of a
   lion. But the absence of good, taken in a privative sense, is an evil;
   as, for instance, the privation of sight is called blindness.

   Now, the subject of privation and of form is one and the same---viz.
   being in potentiality, whether it be being in absolute potentiality, as
   primary matter, which is the subject of the substantial form, and of
   privation of the opposite form; or whether it be being in relative
   potentiality, and absolute actuality, as in the case of a transparent
   body, which is the subject both of darkness and light. It is, however,
   manifest that the form which makes a thing actual is a perfection and a
   good; and thus every actual being is a good; and likewise every
   potential being, as such, is a good, as having a relation to good. For
   as it has being in potentiality, so has it goodness in potentiality.
   Therefore, the subject of evil is good.

   Reply to Objection 1: Dionysius means that evil is not in existing
   things as a part, or as a natural property of any existing thing.

   Reply to Objection 2: "Not-being," understood negatively, does not
   require a subject; but privation is negation in a subject, as the
   Philosopher says (Metaph. iv, text 4), and such "not-being" is an evil.

   Reply to Objection 3: Evil is not in the good opposed to it as in its
   subject, but in some other good, for the subject of blindness is not
   "sight," but "animal." Yet, it appears, as Augustine says (Enchiridion
   13), that the rule of dialectics here fails, where it is laid down that
   contraries cannot exist together. But this is to be taken as referring
   to good and evil in general, but not in reference to any particular
   good and evil. For white and black, sweet and bitter, and the like
   contraries, are only considered as contraries in a special sense,
   because they exist in some determinate genus; whereas good enters into
   every genus. Hence one good can coexist with the privation of another
   good.

   Reply to Objection 4: The prophet invokes woe to those who say that
   good as such is evil. But this does not follow from what is said above,
   as is clear from the explanation given.
     __________________________________________________________________

    Whether evil corrupts the whole good?

   Objection 1: It would seem that evil corrupts the whole good. For one
   contrary is wholly corrupted by another. But good and evil are
   contraries. Therefore evil corrupts the whole good.

   Objection 2: Further, Augustine says (Enchiridion 12) that "evil hurts
   inasmuch as it takes away good." But good is all of a piece and
   uniform. Therefore it is wholly taken away by evil.

   Objection 3: Further, evil, as long as it lasts, hurts, and takes away
   good. But that from which something is always being removed, is at some
   time consumed, unless it is infinite, which cannot be said of any
   created good. Therefore evil wholly consumes good.

   On the contrary, Augustine says (Enchiridion 12) that "evil cannot
   wholly consume good."

   I answer that, Evil cannot wholly consume good. To prove this we must
   consider that good is threefold. One kind of good is wholly destroyed
   by evil, and this is the good opposed to evil, as light is wholly
   destroyed by darkness, and sight by blindness. Another kind of good is
   neither wholly destroyed nor diminished by evil, and that is the good
   which is the subject of evil; for by darkness the substance of the air
   is not injured. And there is also a kind of good which is diminished by
   evil, but is not wholly taken away; and this good is the aptitude of a
   subject to some actuality.

   The diminution, however, of this kind of good is not to be considered
   by way of subtraction, as diminution in quantity, but rather by way of
   remission, as diminution in qualities and forms. The remission likewise
   of this habitude is to be taken as contrary to its intensity. For this
   kind of aptitude receives its intensity by the dispositions whereby the
   matter is prepared for actuality; which the more they are multiplied in
   the subject the more is it fitted to receive its perfection and form;
   and, on the contrary, it receives its remission by contrary
   dispositions which, the more they are multiplied in the matter, and the
   more they are intensified, the more is the potentiality remitted as
   regards the actuality.

   Therefore, if contrary dispositions cannot be multiplied and
   intensified to infinity, but only to a certain limit, neither is the
   aforesaid aptitude diminished or remitted infinitely, as appears in the
   active and passive qualities of the elements; for coldness and
   humidity, whereby the aptitude of matter to the form of fire is
   diminished or remitted, cannot be infinitely multiplied. But if the
   contrary dispositions can be infinitely multiplied, the aforesaid
   aptitude is also infinitely diminished or remitted; yet, nevertheless,
   it is not wholly taken away, because its root always remains, which is
   the substance of the subject. Thus, if opaque bodies were interposed to
   infinity between the sun and the air, the aptitude of the air to light
   would be infinitely diminished, but still it would never be wholly
   removed while the air remained, which in its very nature is
   transparent. Likewise, addition in sin can be made to infinitude,
   whereby the aptitude of the soul to grace is more and more lessened;
   and these sins, indeed, are like obstacles interposed between us and
   God, according to Is. 59:2: "Our sins have divided between us and God."
   Yet the aforesaid aptitude of the soul is not wholly taken away, for it
   belongs to its very nature.

   Reply to Objection 1: The good which is opposed to evil is wholly taken
   away; but other goods are not wholly removed, as said above.

   Reply to Objection 2: The aforesaid aptitude is a medium between
   subject and act. Hence, where it touches act, it is diminished by evil;
   but where it touches the subject, it remains as it was. Therefore,
   although good is like to itself, yet, on account of its relation to
   different things, it is not wholly, but only partially taken away.

   Reply to Objection 3: Some, imagining that the diminution of this kind
   of good is like the diminution of quantity, said that just as the
   continuous is infinitely divisible, if the division be made in an ever
   same proportion (for instance, half of half, or a third of a third), so
   is it in the present case. But this explanation does not avail here.
   For when in a division we keep the same proportion, we continue to
   subtract less and less; for half of half is less than half of the
   whole. But a second sin does not necessarily diminish the above
   mentioned aptitude less than a preceding sin, but perchance either
   equally or more.

   Therefore it must be said that, although this aptitude is a finite
   thing, still it may be so diminished infinitely, not "per se," but
   accidentally; according as the contrary dispositions are also increased
   infinitely, as explained above.
     __________________________________________________________________

    Whether evil is adequately divided into pain* and fault?

   [*Pain here means "penalty": such was its original signification, being
   derived from "poena." In this sense we say "Pain of death, Pain of
   loss, Pain of sense."---Ed.]

   Objection 1: It would seem that evil is not adequately divided into
   pain and fault. For every defect is a kind of evil. But in all
   creatures there is the defect of not being able to preserve their own
   existence, which nevertheless is neither a pain nor a fault. Therefore
   evil is inadequately divided into pain and fault.

   Objection 2: Further, in irrational creatures there is neither fault
   nor pain; but, nevertheless, they have corruption and defect, which are
   evils. Therefore not every evil is a pain or a fault.

   Objection 3: Further, temptation is an evil, but it is not a fault; for
   "temptation which involves no consent, is not a sin, but an occasion
   for the exercise of virtue," as is said in a gloss on 2 Cor. 12; not is
   it a pain; because temptation precedes the fault, and the pain follows
   afterwards. Therefore, evil is not sufficiently divided into pain and
   fault.

   Objection 4: On the contrary, It would seem that this division is
   superfluous: for, as Augustine says (Enchiridion 12), a thing is evil
   "because it hurts." But whatever hurts is penal. Therefore every evil
   comes under pain.

   I answer that, Evil, as was said above [425](A[3]) is the privation of
   good, which chiefly and of itself consists in perfection and act. Act,
   however, is twofold; first, and second. The first act is the form and
   integrity of a thing; the second act is its operation. Therefore evil
   also is twofold. In one way it occurs by the subtraction of the form,
   or of any part required for the integrity of the thing, as blindness is
   an evil, as also it is an evil to be wanting in any member of the body.
   In another way evil exists by the withdrawal of the due operation,
   either because it does not exist, or because it has not its due mode
   and order. But because good in itself is the object of the will, evil,
   which is the privation of good, is found in a special way in rational
   creatures which have a will. Therefore the evil which comes from the
   withdrawal of the form and integrity of the thing, has the nature of a
   pain; and especially so on the supposition that all things are subject
   to divine providence and justice, as was shown above ([426]Q[22],
   A[2]); for it is of the very nature of a pain to be against the will.
   But the evil which consists in the subtraction of the due operation in
   voluntary things has the nature of a fault; for this is imputed to
   anyone as a fault to fail as regards perfect action, of which he is
   master by the will. Therefore every evil in voluntary things is to be
   looked upon as a pain or a fault.

   Reply to Objection 1: Because evil is the privation of good, and not a
   mere negation, as was said above [427](A[3]), therefore not every
   defect of good is an evil, but the defect of the good which is
   naturally due. For the want of sight is not an evil in a stone, but it
   is an evil in an animal; since it is against the nature of a stone to
   see. So, likewise, it is against the nature of a creature to be
   preserved in existence by itself, because existence and conservation
   come from one and the same source. Hence this kind of defect is not an
   evil as regards a creature.

   Reply to Objection 2: Pain and fault do not divide evil absolutely
   considered, but evil that is found in voluntary things.

   Reply to Objection 3: Temptation, as importing provocation to evil, is
   always an evil of fault in the tempter; but in the one tempted it is
   not, properly speaking, a fault; unless through the temptation some
   change is wrought in the one who is tempted; for thus is the action of
   the agent in the patient. And if the tempted is changed to evil by the
   tempter he falls into fault.

   Reply to Objection 4: In answer to the opposite argument, it must be
   said that the very nature of pain includes the idea of injury to the
   agent in himself, whereas the idea of fault includes the idea of injury
   to the agent in his operation; and thus both are contained in evil, as
   including the idea of injury.
     __________________________________________________________________

    Whether pain has the nature of evil more than fault has?

   Objection 1: It would seem that pain has more of evil than fault. For
   fault is to pain what merit is to reward. But reward has more good than
   merit, as its end. Therefore pain has more evil in it than fault has.

   Objection 2: Further, that is the greater evil which is opposed to the
   greater good. But pain, as was said above [428](A[5]), is opposed to
   the good of the agent, while fault is opposed to the good of the
   action. Therefore, since the agent is better than the action, it seems
   that pain is worse than fault.

   Objection 3: Further, the privation of the end is a pain consisting in
   forfeiting the vision of God; whereas the evil of fault is privation of
   the order to the end. Therefore pain is a greater evil than fault.

   On the contrary, A wise workman chooses a less evil in order to prevent
   a greater, as the surgeon cuts off a limb to save the whole body. But
   divine wisdom inflicts pain to prevent fault. Therefore fault is a
   greater evil than pain.

   I answer that, Fault has the nature of evil more than pain has; not
   only more than pain of sense, consisting in the privation of corporeal
   goods, which kind of pain appeals to most men; but also more than any
   kind of pain, thus taking pain in its most general meaning, so as to
   include privation of grace or glory.

   There is a twofold reason for this. The first is that one becomes evil
   by the evil of fault, but not by the evil of pain, as Dionysius says
   (Div. Nom. iv): "To be punished is not an evil; but it is an evil to be
   made worthy of punishment." And this because, since good absolutely
   considered consists in act, and not in potentiality, and the ultimate
   act is operation, or the use of something possessed, it follows that
   the absolute good of man consists in good operation, or the good use of
   something possessed. Now we use all things by the act of the will.
   Hence from a good will, which makes a man use well what he has, man is
   called good, and from a bad will he is called bad. For a man who has a
   bad will can use ill even the good he has, as when a grammarian of his
   own will speaks incorrectly. Therefore, because the fault itself
   consists in the disordered act of the will, and the pain consists in
   the privation of something used by the will, fault has more of evil in
   it than pain has.

   The second reason can be taken from the fact that God is the author of
   the evil of pain, but not of the evil of fault. And this is because the
   evil of pain takes away the creature's good, which may be either
   something created, as sight, destroyed by blindness, or something
   uncreated, as by being deprived of the vision of God, the creature
   forfeits its uncreated good. But the evil of fault is properly opposed
   to uncreated good; for it is opposed to the fulfilment of the divine
   will, and to divine love, whereby the divine good is loved for itself,
   and not only as shared by the creature. Therefore it is plain that
   fault has more evil in it than pain has.

   Reply to Objection 1: Although fault results in pain, as merit in
   reward, yet fault is not intended on account of the pain, as merit is
   for the reward; but rather, on the contrary, pain is brought about so
   that the fault may be avoided, and thus fault is worse than pain.

   Reply to Objection 2: The order of action which is destroyed by fault
   is the more perfect good of the agent, since it is the second
   perfection, than the good taken away by pain, which is the first
   perfection.

   Reply to Objection 3: Pain and fault are not to be compared as end and
   order to the end; because one may be deprived of both of these in some
   way, both by fault and by pain; by pain, accordingly as a man is
   removed from the end and from the order to the end; by fault, inasmuch
   as this privation belongs to the action which is not ordered to its due
   end.
     __________________________________________________________________

  THE CAUSE OF EVIL (THREE ARTICLES)

   We next inquire into the cause of evil. Concerning this there are three
   points of inquire:

   (1) Whether good can be the cause of evil?

   (2) Whether the supreme good, God, is the cause of evil?

   (3) Whether there be any supreme evil, which is the first cause of all
   evils?
     __________________________________________________________________

    Whether good can be the cause of evil?

   Objection 1: It would seem that good cannot be the cause of evil. For
   it is said (Mat. 7:18): "A good tree cannot bring forth evil fruit."

   Objection 2: Further, one contrary cannot be the cause of another. But
   evil is the contrary to good. Therefore good cannot be the cause of
   evil.

   Objection 3: Further, a deficient effect can proceed only from a
   deficient cause. But evil is a deficient effect. Therefore its cause,
   if it has one, is deficient. But everything deficient is an evil.
   Therefore the cause of evil can only be evil.

   Objection 4: Further, Dionysius says (Div. Nom. iv) that evil has no
   cause. Therefore good is not the cause of evil.

   On the contrary, Augustine says (Contra Julian. i, 9): "There is no
   possible source of evil except good."

   I answer that, It must be said that every evil in some way has a cause.
   For evil is the absence of the good, which is natural and due to a
   thing. But that anything fail from its natural and due disposition can
   come only from some cause drawing it out of its proper disposition. For
   a heavy thing is not moved upwards except by some impelling force; nor
   does an agent fail in its action except from some impediment. But only
   good can be a cause; because nothing can be a cause except inasmuch as
   it is a being, and every being, as such, is good.

   And if we consider the special kinds of causes, we see that the agent,
   the form, and the end, import some kind of perfection which belongs to
   the notion of good. Even matter, as a potentiality to good, has the
   nature of good. Now that good is the cause of evil by way of the
   material cause was shown above ([429]Q[48], A[3]). For it was shown
   that good is the subject of evil. But evil has no formal cause, rather
   is it a privation of form; likewise, neither has it a final cause, but
   rather is it a privation of order to the proper end; since not only the
   end has the nature of good, but also the useful, which is ordered to
   the end. Evil, however, has a cause by way of an agent, not directly,
   but accidentally.

   In proof of this, we must know that evil is caused in the action
   otherwise than in the effect. In the action evil is caused by reason of
   the defect of some principle of action, either of the principal or the
   instrumental agent; thus the defect in the movement of an animal may
   happen by reason of the weakness of the motive power, as in the case of
   children, or by reason only of the ineptitude of the instrument, as in
   the lame. On the other hand, evil is caused in a thing, but not in the
   proper effect of the agent, sometimes by the power of the agent,
   sometimes by reason of a defect, either of the agent or of the matter.
   It is caused by reason of the power or perfection of the agent when
   there necessarily follows on the form intended by the agent the
   privation of another form; as, for instance, when on the form of fire
   there follows the privation of the form of air or of water. Therefore,
   as the more perfect the fire is in strength, so much the more perfectly
   does it impress its own form, so also the more perfectly does it
   corrupt the contrary. Hence that evil and corruption befall air and
   water comes from the perfection of the fire: but this is accidental;
   because fire does not aim at the privation of the form of water, but at
   the bringing in of its own form, though by doing this it also
   accidentally causes the other. But if there is a defect in the proper
   effect of the fire---as, for instance, that it fails to heat---this
   comes either by defect of the action, which implies the defect of some
   principle, as was said above, or by the indisposition of the matter,
   which does not receive the action of the fire, the agent. But this very
   fact that it is a deficient being is accidental to good to which of
   itself it belongs to act. Hence it is true that evil in no way has any
   but an accidental cause; and thus is good the cause of evil.

   Reply to Objection 1: As Augustine says (Contra Julian. i): "The Lord
   calls an evil will the evil tree, and a good will a good tree." Now, a
   good will does not produce a morally bad act, since it is from the good
   will itself that a moral act is judged to be good. Nevertheless the
   movement itself of an evil will is caused by the rational creature,
   which is good; and thus good is the cause of evil.

   Reply to Objection 2: Good does not cause that evil which is contrary
   to itself, but some other evil: thus the goodness of the fire causes
   evil to the water, and man, good as to his nature, causes an act
   morally evil. And, as explained above ([430]Q[19], A[9]), this is by
   accident. Moreover, it does happen sometimes that one contrary causes
   another by accident: for instance, the exterior surrounding cold heats
   (the body) through the concentration of the inward heat.

   Reply to Objection 3: Evil has a deficient cause in voluntary things
   otherwise than in natural things. For the natural agent produces the
   same kind of effect as it is itself, unless it is impeded by some
   exterior thing; and this amounts to some defect belonging to it. Hence
   evil never follows in the effect, unless some other evil pre-exists in
   the agent or in the matter, as was said above. But in voluntary things
   the defect of the action comes from the will actually deficient,
   inasmuch as it does not actually subject itself to its proper rule.
   This defect, however, is not a fault, but fault follows upon it from
   the fact that the will acts with this defect.

   Reply to Objection 4: Evil has no direct cause, but only an accidental
   cause, as was said above.
     __________________________________________________________________

    Whether the supreme good, God, is the cause of evil?

   Objection 1: It would seem that the supreme good, God, is the cause of
   evil. For it is said (Is. 45:5, 7): "I am the Lord, and there is no
   other God, forming the light, and creating darkness, making peace, and
   creating evil." And Amos 3:6, "Shall there be evil in a city, which the
   Lord hath not done?"

   Objection 2: Further, the effect of the secondary cause is reduced to
   the first cause. But good is the cause of evil, as was said above
   [431](A[1]). Therefore, since God is the cause of every good, as was
   shown above ([432]Q[2] , A[3]; [433]Q[6], AA[1],4), it follows that
   also every evil is from God.

   Objection 3: Further, as is said by the Philosopher (Phys. ii, text
   30), the cause of both safety and danger of the ship is the same. But
   God is the cause of the safety of all things. Therefore He is the cause
   of all perdition and of all evil.

   On the contrary, Augustine says (QQ. 83, qu. 21), that, "God is not the
   author of evil because He is not the cause of tending to not-being."

   I answer that, As appears from what was said [434](A[1]), the evil
   which consists in the defect of action is always caused by the defect
   of the agent. But in God there is no defect, but the highest
   perfection, as was shown above ([435]Q[4], A[1]). Hence, the evil which
   consists in defect of action, or which is caused by defect of the
   agent, is not reduced to God as to its cause.

   But the evil which consists in the corruption of some things is reduced
   to God as the cause. And this appears as regards both natural things
   and voluntary things. For it was said [436](A[1]) that some agent
   inasmuch as it produces by its power a form to which follows corruption
   and defect, causes by its power that corruption and defect. But it is
   manifest that the form which God chiefly intends in things created is
   the good of the order of the universe. Now, the order of the universe
   requires, as was said above ([437]Q[22], A[2], ad 2; [438]Q[48], A[2]),
   that there should be some things that can, and do sometimes, fail. And
   thus God, by causing in things the good of the order of the universe,
   consequently and as it were by accident, causes the corruptions of
   things, according to 1 2:6: "The Lord killeth and maketh alive." But
   when we read that "God hath not made death" (Wis. 1:13), the sense is
   that God does not will death for its own sake. Nevertheless the order
   of justice belongs to the order of the universe; and this requires that
   penalty should be dealt out to sinners. And so God is the author of the
   evil which is penalty, but not of the evil which is fault, by reason of
   what is said above.

   Reply to Objection 1: These passages refer to the evil of penalty, and
   not to the evil of fault.

   Reply to Objection 2: The effect of the deficient secondary cause is
   reduced to the first non-deficient cause as regards what it has of
   being and perfection, but not as regards what it has of defect; just as
   whatever there is of motion in the act of limping is caused by the
   motive power, whereas what there is of obliqueness in it does not come
   from the motive power, but from the curvature of the leg. And,
   likewise, whatever there is of being and action in a bad action, is
   reduced to God as the cause; whereas whatever defect is in it is not
   caused by God, but by the deficient secondary cause.

   Reply to Objection 3: The sinking of a ship is attributed to the sailor
   as the cause, from the fact that he does not fulfil what the safety of
   the ship requires; but God does not fail in doing what is necessary for
   the safety of all. Hence there is no parity.
     __________________________________________________________________

    Whether there be one supreme evil which is the cause of every evil?

   Objection 1: It would seem that there is one supreme evil which is the
   cause of every evil. For contrary effects have contrary causes. But
   contrariety is found in things, according to Ecclus. 33:15: "Good is
   set against evil, and life against death; so also is the sinner against
   a just man." Therefore there are many contrary principles, one of good,
   the other of evil.

   Objection 2: Further, if one contrary is in nature, so is the other.
   But the supreme good is in nature, and is the cause of every good, as
   was shown above ([439]Q[2], A[3]; [440]Q[6], AA[2],4). Therefore, also,
   there is a supreme evil opposed to it as the cause of every evil.

   Objection 3: Further, as we find good and better things, so we find
   evil and worse. But good and better are so considered in relation to
   what is best. Therefore evil and worse are so considered in relation to
   some supreme evil.

   Objection 4: Further, everything participated is reduced to what is
   essential. But things which are evil among us are evil not essentially,
   but by participation. Therefore we must seek for some supreme essential
   evil, which is the cause of every evil.

   Objection 5: Further, whatever is accidental is reduced to that which
   is "per se." But good is the accidental cause of evil. Therefore, we
   must suppose some supreme evil which is the "per se" cause of evils.
   Nor can it be said that evil has no "per se" cause, but only an
   accidental cause; for it would then follow that evil would not exist in
   the many, but only in the few.

   Objection 6: Further, the evil of the effect is reduced to the evil of
   the cause; because the deficient effect comes from the deficient cause,
   as was said above ([441]AA[1],2). But we cannot proceed to infinity in
   this matter. Therefore, we must suppose one first evil as the cause of
   every evil.

   On the contrary, The supreme good is the cause of every being, as was
   shown above ([442]Q[2], A[3]; [443]Q[6], A[4]). Therefore there cannot
   be any principle opposed to it as the cause of evils.

   I answer that, It appears from what precedes that there is no one first
   principle of evil, as there is one first principle of good.

   First, indeed, because the first principle of good is essentially good,
   as was shown above ([444]Q[6], AA[3],4). But nothing can be essentially
   bad. For it was shown above that every being, as such, is good
   ([445]Q[5], A[3]); and that evil can exist only in good as in its
   subject ([446]Q[48], A[3]).

   Secondly, because the first principle of good is the highest and
   perfect good which pre-contains in itself all goodness, as shown above
   ([447]Q[6], A[2]). But there cannot be a supreme evil; because, as was
   shown above ([448]Q[48], A[4]), although evil always lessens good, yet
   it never wholly consumes it; and thus, while good ever remains, nothing
   can be wholly and perfectly bad. Therefore, the Philosopher says
   (Ethic. iv, 5) that "if the wholly evil could be, it would destroy
   itself"; because all good being destroyed (which it need be for
   something to be wholly evil), evil itself would be taken away, since
   its subject is good.

   Thirdly, because the very nature of evil is against the idea of a first
   principle; both because every evil is caused by good, as was shown
   above [449](A[1]), and because evil can be only an accidental cause,
   and thus it cannot be the first cause, for the accidental cause is
   subsequent to the direct cause.

   Those, however, who upheld two first principles, one good and the other
   evil, fell into this error from the same cause, whence also arose other
   strange notions of the ancients; namely, because they failed to
   consider the universal cause of all being, and considered only the
   particular causes of particular effects. For on that account, if they
   found a thing hurtful to something by the power of its own nature, they
   thought that the very nature of that thing was evil; as, for instance,
   if one should say that the nature of fire was evil because it burnt the
   house of a poor man. The judgment, however, of the goodness of anything
   does not depend upon its order to any particular thing, but rather upon
   what it is in itself, and on its order to the whole universe, wherein
   every part has its own perfectly ordered place, as was said above
   ([450]Q[47], A[2], ad 1).

   Likewise, because they found two contrary particular causes of two
   contrary particular effects, they did not know how to reduce these
   contrary particular causes to the universal common cause; and therefore
   they extended the contrariety of causes even to the first principles.
   But since all contraries agree in something common, it is necessary to
   search for one common cause for them above their own contrary proper
   causes; as above the contrary qualities of the elements exists the
   power of a heavenly body; and above all things that exist, no matter
   how, there exists one first principle of being, as was shown above
   ([451]Q[2], A[3]).

   Reply to Objection 1: Contraries agree in one genus, and they also
   agree in the nature of being; and therefore, although they have
   contrary particular cause, nevertheless we must come at last to one
   first common cause.

   Reply to Objection 2: Privation and habit belong naturally to the same
   subject. Now the subject of privation is a being in potentiality, as
   was said above ([452]Q[48], A[3]). Hence, since evil is privation of
   good, as appears from what was said above ([453]Q[48], AA[1], 2,3), it
   is opposed to that good which has some potentiality, but not to the
   supreme good, who is pure act.

   Reply to Objection 3: Increase in intensity is in proportion to the
   nature of a thing. And as the form is a perfection, so privation
   removes a perfection. Hence every form, perfection, and good is
   intensified by approach to the perfect term; but privation and evil by
   receding from that term. Hence a thing is not said to be evil and
   worse, by reason of access to the supreme evil, in the same way as it
   is said to be good and better, by reason of access to the supreme good.

   Reply to Objection 4: No being is called evil by participation, but by
   privation of participation. Hence it is not necessary to reduce it to
   any essential evil.

   Reply to Objection 5: Evil can only have an accidental cause, as was
   shown above [454](A[1]). Hence reduction to any 'per se' cause of evil
   is impossible. And to say that evil is in the greater number is simply
   false. For things which are generated and corrupted, in which alone can
   there be natural evil, are the smaller part of the whole universe. And
   again, in every species the defect of nature is in the smaller number.
   In man alone does evil appear as in the greater number; because the
   good of man as regards the senses is not the good of man as man---that
   is, in regard to reason; and more men seek good in regard to the senses
   than good according to reason.

   Reply to Objection 6: In the causes of evil we do not proceed to
   infinity, but reduce all evils to some good cause, whence evil follows
   accidentally.
     __________________________________________________________________
}

$treatise_with_prologue = %{
TREATISE ON THE LAST END (QQ[1]-5)
     __________________________________________________________________

  PROLOGUE

   Since, as Damascene states (De Fide Orth. ii, 12), man is said to be
   made in God's image, in so far as the image implies "an intelligent
   being endowed with free-will and self-movement": now that we have
   treated of the exemplar, i.e. God, and of those things which came forth
   from the power of God in accordance with His will; it remains for us to
   treat of His image, i.e. man, inasmuch as he too is the principle of
   his actions, as having free-will and control of his actions.
     __________________________________________________________________

  OF MAN'S LAST END (EIGHT ARTICLES)

   In this matter we shall consider first the last end of human life; and
   secondly, those things by means of which man may advance towards this
   end, or stray from the path: for the end is the rule of whatever is
   ordained to the end. And since the last end of human life is stated to
   be happiness, we must consider (1) the last end in general; (2)
   happiness.

   Under the first head there are eight points of inquiry:

   (1) Whether it belongs to man to act for an end?

   (2) Whether this is proper to the rational nature?

   (3) Whether a man's actions are specified by their end?

   (4) Whether there is any last end of human life?

   (5) Whether one man can have several last ends?

   (6) Whether man ordains all to the last end?

   (7) Whether all men have the same last end?

   (8) Whether all other creatures concur with man in that last end?
}
