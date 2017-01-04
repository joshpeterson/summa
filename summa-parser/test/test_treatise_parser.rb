gem 'minitest'
require 'minitest/autorun'
require_relative '../parser/treatise_parser'

class TestTreatiseParser < MiniTest::Test
  def setup
    @parser = TreatiseParser.new(TREATISE)
  end

  def test_verify_title
    expected_title = 'TREATISE ON THE DISTINCTION OF GOOD AND EVIL'\
                      ' (QQ[48]-49)'
    assert_equal(expected_title, @parser.treatise.title)
  end

  def test_verify_prologue_is_nil
    assert_nil(@parser.treatise.prologue)
  end

  def test_verify_prologue_in_treatise_with_prologue
    expected_prologue = 'Since, as Damascene states (De Fide Orth. ii,'\
                        " 12), man is said to be made in God's image,"\
                        ' in so far as the image implies "an'\
                        ' intelligent being endowed with free-will and'\
                        ' self-movement": now that we have treated of'\
                        ' the exemplar, i.e. God, and of those things'\
                        ' which came forth from the power of God in'\
                        ' accordance with His will; it remains for us'\
                        ' to treat of His image, i.e. man, inasmuch as'\
                        ' he too is the principle of his actions, as'\
                        ' having free-will and control of his actions.'
    parser = TreatiseParser.new(TREATISE_WITH_PROLOGUE)
    assert_equal(expected_prologue, parser.treatise.prologue)
  end

  def test_verify_correct_number_of_questions_found
    assert_equal(2, @parser.treatise.questions.size)
  end

  def test_verify_correct_number_of_questions_found_with_complex_question
    parser = TreatiseParser.new(TREATISE_WITH_COMPLEX_QUESTION)
    assert_equal(1, parser.treatise.questions.size)
  end
end

TREATISE = %{
TREATISE ON THE DISTINCTION OF GOOD AND EVIL (QQ[48]-49)
     __________________________________________________________________

  THE DISTINCTION OF THINGS
  IN PARTICULAR (SIX ARTICLES)

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
}.freeze

TREATISE_WITH_PROLOGUE = %{
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
     __________________________________________________________________

    Whether it belongs to man to act for an end?

   Objection 1: It would seem that it does not belong to man to act for an
   end. For a cause is naturally first. But an end, in its very name,
   implies something that is last. Therefore an end is not a cause. But
   that for which a man acts, is the cause of his action; since this
   preposition "for" indicates a relation of causality. Therefore it does
   not belong to man to act for an end.

   Objection 2: Further, that which is itself the last end is not for an
   end. But in some cases the last end is an action, as the Philosopher
   states (Ethic. i, 1). Therefore man does not do everything for an end.

   Objection 3: Further, then does a man seem to act for an end, when he
   acts deliberately. But man does many things without deliberation,
   sometimes not even thinking of what he is doing; for instance when one
   moves one's foot or hand, or scratches one's beard, while intent on
   something else. Therefore man does not do everything for an end.

   On the contrary, All things contained in a genus are derived from the
   principle of that genus. Now the end is the principle in human
   operations, as the Philosopher states (Phys. ii, 9). Therefore it
   belongs to man to do everything for an end.

   I answer that, Of actions done by man those alone are properly called
   "human," which are proper to man as man. Now man differs from
   irrational animals in this, that he is master of his actions. Wherefore
   those actions alone are properly called human, of which man is master.
   Now man is master of his actions through his reason and will; whence,
   too, the free-will is defined as "the faculty and will of reason."
   Therefore those actions are properly called human which proceed from a
   deliberate will. And if any other actions are found in man, they can be
   called actions "of a man," but not properly "human" actions, since they
   are not proper to man as man. Now it is clear that whatever actions
   proceed from a power, are caused by that power in accordance with the
   nature of its object. But the object of the will is the end and the
   good. Therefore all human actions must be for an end.

   Reply to Objection 1: Although the end be last in the order of
   execution, yet it is first in the order of the agent's intention. And
   it is this way that it is a cause.

   Reply to Objection 2: If any human action be the last end, it must be
   voluntary, else it would not be human, as stated above. Now an action
   is voluntary in one of two ways: first, because it is commanded by the
   will, e.g. to walk, or to speak; secondly, because it is elicited by
   the will, for instance the very act of willing. Now it is impossible
   for the very act elicited by the will to be the last end. For the
   object of the will is the end, just as the object of sight is color:
   wherefore just as the first visible cannot be the act of seeing,
   because every act of seeing is directed to a visible object; so the
   first appetible, i.e. the end, cannot be the very act of willing.
   Consequently it follows that if a human action be the last end, it must
   be an action commanded by the will: so that there, some action of man,
   at least the act of willing, is for the end. Therefore whatever a man
   does, it is true to say that man acts for an end, even when he does
   that action in which the last end consists.

   Reply to Objection 3: Such like actions are not properly human actions;
   since they do not proceed from deliberation of the reason, which is the
   proper principle of human actions. Therefore they have indeed an
   imaginary end, but not one that is fixed by reason.
     __________________________________________________________________

    Whether it is proper to the rational nature to act for an end?

   Objection 1: It would seem that it is proper to the rational nature to
   act for an end. For man, to whom it belongs to act for an end, never
   acts for an unknown end. On the other hand, there are many things that
   have no knowledge of an end; either because they are altogether without
   knowledge, as insensible creatures: or because they do not apprehend
   the idea of an end as such, as irrational animals. Therefore it seems
   proper to the rational nature to act for an end.

   Objection 2: Further, to act for an end is to order one's action to an
   end. But this is the work of reason. Therefore it does not belong to
   things that lack reason.

   Objection 3: Further, the good and the end is the object of the will.
   But "the will is in the reason" (De Anima iii, 9). Therefore to act for
   an end belongs to none but a rational nature.

   On the contrary, The Philosopher proves (Phys. ii, 5) that "not only
   mind but also nature acts for an end."

   I answer that, Every agent, of necessity, acts for an end. For if, in a
   number of causes ordained to one another, the first be removed, the
   others must, of necessity, be removed also. Now the first of all causes
   is the final cause. The reason of which is that matter does not receive
   form, save in so far as it is moved by an agent; for nothing reduces
   itself from potentiality to act. But an agent does not move except out
   of intention for an end. For if the agent were not determinate to some
   particular effect, it would not do one thing rather than another:
   consequently in order that it produce a determinate effect, it must, of
   necessity, be determined to some certain one, which has the nature of
   an end. And just as this determination is effected, in the rational
   nature, by the "rational appetite," which is called the will; so, in
   other things, it is caused by their natural inclination, which is
   called the "natural appetite."

   Nevertheless it must be observed that a thing tends to an end, by its
   action or movement, in two ways: first, as a thing, moving itself to
   the end, as man; secondly, as a thing moved by another to the end, as
   an arrow tends to a determinate end through being moved by the archer
   who directs his action to the end. Therefore those things that are
   possessed of reason, move themselves to an end; because they have
   dominion over their actions through their free-will, which is the
   "faculty of will and reason." But those things that lack reason tend to
   an end, by natural inclination, as being moved by another and not by
   themselves; since they do not know the nature of an end as such, and
   consequently cannot ordain anything to an end, but can be ordained to
   an end only by another. For the entire irrational nature is in
   comparison to God as an instrument to the principal agent, as stated
   above ([991]FP, Q[22], A[2], ad 4; [992]FP, Q[103], A[1], ad 3).
   Consequently it is proper to the rational nature to tend to an end, as
   directing [agens] and leading itself to the end: whereas it is proper
   to the irrational nature to tend to an end, as directed or led by
   another, whether it apprehend the end, as do irrational animals, or do
   not apprehend it, as is the case of those things which are altogether
   void of knowledge.

   Reply to Objection 1: When a man of himself acts for an end, he knows
   the end: but when he is directed or led by another, for instance, when
   he acts at another's command, or when he is moved under another's
   compulsion, it is not necessary that he should know the end. And it is
   thus with irrational creatures.

   Reply to Objection 2: To ordain towards an end belongs to that which
   directs itself to an end: whereas to be ordained to an end belongs to
   that which is directed by another to an end. And this can belong to an
   irrational nature, but owing to some one possessed of reason.

   Reply to Objection 3: The object of the will is the end and the good in
   universal. Consequently there can be no will in those things that lack
   reason and intellect, since they cannot apprehend the universal; but
   they have a natural appetite or a sensitive appetite, determinate to
   some particular good. Now it is clear that particular causes are moved
   by a universal cause: thus the governor of a city, who intends the
   common good, moves, by his command, all the particular departments of
   the city. Consequently all things that lack reason are, of necessity,
   moved to their particular ends by some rational will which extends to
   the universal good, namely by the Divine will.
     __________________________________________________________________

    Whether human acts are specified by their end?

   Objection 1: It would seem that human acts are not specified by their
   end. For the end is an extrinsic cause. But everything is specified by
   an intrinsic principle. Therefore human acts are not specified by their
   end.

   Objection 2: Further, that which gives a thing its species should exist
   before it. But the end comes into existence afterwards. Therefore a
   human act does not derive its species from the end.

   Objection 3: Further, one thing cannot be in more than one species. But
   one and the same act may happen to be ordained to various ends.
   Therefore the end does not give the species to human acts.

   On the contrary, Augustine says (De Mor. Eccl. et Manich. ii, 13):
   "According as their end is worthy of blame or praise so are our deeds
   worthy of blame or praise."

   I answer that Each thing receives its species in respect of an act and
   not in respect of potentiality; wherefore things composed of matter and
   form are established in their respective species by their own forms.
   And this is also to be observed in proper movements. For since
   movements are, in a way, divided into action and passion, each of these
   receives its species from an act; action indeed from the act which is
   the principle of acting, and passion from the act which is the terminus
   of the movement. Wherefore heating, as an action, is nothing else than
   a certain movement proceeding from heat, while heating as a passion is
   nothing else than a movement towards heat: and it is the definition
   that shows the specific nature. And either way, human acts, whether
   they be considered as actions, or as passions, receive their species
   from the end. For human acts can be considered in both ways, since man
   moves himself, and is moved by himself. Now it has been stated above
   [993](A[1]) that acts are called human, inasmuch as they proceed from a
   deliberate will. Now the object of the will is the good and the end.
   And hence it is clear that the principle of human acts, in so far as
   they are human, is the end. In like manner it is their terminus: for
   the human act terminates at that which the will intends as the end;
   thus in natural agents the form of the thing generated is conformed to
   the form of the generator. And since, as Ambrose says (Prolog. super
   Luc.) "morality is said properly of man," moral acts properly speaking
   receive their species from the end, for moral acts are the same as
   human acts.

   Reply to Objection 1: The end is not altogether extrinsic to the act,
   because it is related to the act as principle or terminus; and thus it
   just this that is essential to an act, viz. to proceed from something,
   considered as action, and to proceed towards something, considered as
   passion.

   Reply to Objection 2: The end, in so far as it pre-exists in the
   intention, pertains to the will, as stated above (A[1], ad 1). And it
   is thus that it gives the species to the human or moral act.

   Reply to Objection 3: One and the same act, in so far as it proceeds
   once from the agent, is ordained to but one proximate end, from which
   it has its species: but it can be ordained to several remote ends, of
   which one is the end of the other. It is possible, however, that an act
   which is one in respect of its natural species, be ordained to several
   ends of the will: thus this act "to kill a man," which is but one act
   in respect of its natural species, can be ordained, as to an end, to
   the safeguarding of justice, and to the satisfying of anger: the result
   being that there would be several acts in different species of
   morality: since in one way there will be an act of virtue, in another,
   an act of vice. For a movement does not receive its species from that
   which is its terminus accidentally, but only from that which is its
   "per se" terminus. Now moral ends are accidental to a natural thing,
   and conversely the relation to a natural end is accidental to morality.
   Consequently there is no reason why acts which are the same considered
   in their natural species, should not be diverse, considered in their
   moral species, and conversely.
     __________________________________________________________________

    Whether there is one last end of human life?

   Objection 1: It would seem that there is no last end of human life, but
   that we proceed to infinity. For good is essentially diffusive, as
   Dionysius states (Div. Nom. iv). Consequently if that which proceeds
   from good is itself good, the latter must needs diffuse some other
   good: so that the diffusion of good goes on indefinitely. But good has
   the nature of an end. Therefore there is an indefinite series of ends.

   Objection 2: Further, things pertaining to the reason can be multiplied
   to infinity: thus mathematical quantities have no limit. For the same
   reason the species of numbers are infinite, since, given any number,
   the reason can think of one yet greater. But desire of the end is
   consequent on the apprehension of the reason. Therefore it seems that
   there is also an infinite series of ends.

   Objection 3: Further, the good and the end is the object of the will.
   But the will can react on itself an infinite number of times: for I can
   will something, and will to will it, and so on indefinitely. Therefore
   there is an infinite series of ends of the human will, and there is no
   last end of the human will.

   On the contrary, The Philosopher says (Metaph. ii, 2) that "to suppose
   a thing to be indefinite is to deny that it is good." But the good is
   that which has the nature of an end. Therefore it is contrary to the
   nature of an end to proceed indefinitely. Therefore it is necessary to
   fix one last end.

   I answer that, Absolutely speaking, it is not possible to proceed
   indefinitely in the matter of ends, from any point of view. For in
   whatsoever things there is an essential order of one to another, if the
   first be removed, those that are ordained to the first, must of
   necessity be removed also. Wherefore the Philosopher proves (Phys.
   viii, 5) that we cannot proceed to infinitude in causes of movement,
   because then there would be no first mover, without which neither can
   the others move, since they move only through being moved by the first
   mover. Now there is to be observed a twofold order in ends---the order
   of intention and the order of execution: and in either of these orders
   there must be something first. For that which is first in the order of
   intention, is the principle, as it were, moving the appetite;
   consequently, if you remove this principle, there will be nothing to
   move the appetite. On the other hand, the principle in execution is
   that wherein operation has its beginning; and if this principle be
   taken away, no one will begin to work. Now the principle in the
   intention is the last end; while the principle in execution is the
   first of the things which are ordained to the end. Consequently, on
   neither side is it possible to go to infinity since if there were no
   last end, nothing would be desired, nor would any action have its term,
   nor would the intention of the agent be at rest; while if there is no
   first thing among those that are ordained to the end, none would begin
   to work at anything, and counsel would have no term, but would continue
   indefinitely.

   On the other hand, nothing hinders infinity from being in things that
   are ordained to one another not essentially but accidentally; for
   accidental causes are indeterminate. And in this way it happens that
   there is an accidental infinity of ends, and of things ordained to the
   end.

   Reply to Objection 1: The very nature of good is that something flows
   from it, but not that it flows from something else. Since, therefore,
   good has the nature of end, and the first good is the last end, this
   argument does not prove that there is no last end; but that from the
   end, already supposed, we may proceed downwards indefinitely towards
   those things that are ordained to the end. And this would be true if we
   considered but the power of the First Good, which is infinite. But,
   since the First Good diffuses itself according to the intellect, to
   which it is proper to flow forth into its effects according to a
   certain fixed form; it follows that there is a certain measure to the
   flow of good things from the First Good from Which all other goods
   share the power of diffusion. Consequently the diffusion of goods does
   not proceed indefinitely but, as it is written (Wis. 11:21), God
   disposes all things "in number, weight and measure."

   Reply to Objection 2: In things which are of themselves, reason begins
   from principles that are known naturally, and advances to some term.
   Wherefore the Philosopher proves (Poster. i, 3) that there is no
   infinite process in demonstrations, because there we find a process of
   things having an essential, not an accidental, connection with one
   another. But in those things which are accidentally connected, nothing
   hinders the reason from proceeding indefinitely. Now it is accidental
   to a stated quantity or number, as such, that quantity or unity be
   added to it. Wherefore in such like things nothing hinders the reason
   from an indefinite process.

   Reply to Objection 3: This multiplication of acts of the will reacting
   on itself, is accidental to the order of ends. This is clear from the
   fact that in regard to one and the same end, the will reacts on itself
   indifferently once or several times.
     __________________________________________________________________

    Whether one man can have several last ends?

   Objection 1: It would seem possible for one man's will to be directed
   at the same time to several things, as last ends. For Augustine says
   (De Civ. Dei xix, 1) that some held man's last end to consist in four
   things, viz. "in pleasure, repose, the gifts of nature, and virtue."
   But these are clearly more than one thing. Therefore one man can place
   the last end of his will in many things.

   Objection 2: Further, things not in opposition to one another do not
   exclude one another. Now there are many things which are not in
   opposition to one another. Therefore the supposition that one thing is
   the last end of the will does not exclude others.

   Objection 3: Further, by the fact that it places its last end in one
   thing, the will does not lose its freedom. But before it placed its
   last end in that thing, e.g. pleasure, it could place it in something
   else, e.g. riches. Therefore even after having placed his last end in
   pleasure, a man can at the same time place his last end in riches.
   Therefore it is possible for one man's will to be directed at the same
   time to several things, as last ends.

   On the contrary, That in which a man rests as in his last end, is
   master of his affections, since he takes therefrom his entire rule of
   life. Hence of gluttons it is written (Phil. 3:19): "Whose god is their
   belly": viz. because they place their last end in the pleasures of the
   belly. Now according to Mat. 6:24, "No man can serve two masters,"
   such, namely, as are not ordained to one another. Therefore it is
   impossible for one man to have several last ends not ordained to one
   another.

   I answer that, It is impossible for one man's will to be directed at
   the same time to diverse things, as last ends. Three reasons may be
   assigned for this. First, because, since everything desires its own
   perfection, a man desires for his ultimate end, that which he desires
   as his perfect and crowning good. Hence Augustine (De Civ. Dei xix, 1):
   "In speaking of the end of good we mean now, not that it passes away so
   as to be no more, but that it is perfected so as to be complete." It is
   therefore necessary for the last end so to fill man's appetite, that
   nothing is left besides it for man to desire. Which is not possible, if
   something else be required for his perfection. Consequently it is not
   possible for the appetite so to tend to two things, as though each were
   its perfect good.

   The second reason is because, just as in the process of reasoning, the
   principle is that which is naturally known, so in the process of the
   rational appetite, i.e. the will, the principle needs to be that which
   is naturally desired. Now this must needs be one: since nature tends to
   one thing only. But the principle in the process of the rational
   appetite is the last end. Therefore that to which the will tends, as to
   its last end, is one.

   The third reason is because, since voluntary actions receive their
   species from the end, as stated above [994](A[3]), they must needs
   receive their genus from the last end, which is common to them all:
   just as natural things are placed in a genus according to a common
   form. Since, then, all things that can be desired by the will, belong,
   as such, to one genus, the last end must needs be one. And all the more
   because in every genus there is one first principle; and the last end
   has the nature of a first principle, as stated above. Now as the last
   end of man, simply as man, is to the whole human race, so is the last
   end of any individual man to that individual. Therefore, just as of all
   men there is naturally one last end, so the will of an individual man
   must be fixed on one last end.

   Reply to Objection 1: All these several objects were considered as one
   perfect good resulting therefrom, by those who placed in them the last
   end.

   Reply to Objection 2: Although it is possible to find several things
   which are not in opposition to one another, yet it is contrary to a
   thing's perfect good, that anything besides be required for that
   thing's perfection.

   Reply to Objection 3: The power of the will does not extend to making
   opposites exist at the same time. Which would be the case were it to
   tend to several diverse objects as last ends, as has been shown above
   (ad 2).
     __________________________________________________________________

    Whether man will all, whatsoever he wills, for the last end?

   Objection 1: It would seem that man does not will all, whatsoever he
   wills, for the last end. For things ordained to the last end are said
   to be serious matter, as being useful. But jests are foreign to serious
   matter. Therefore what man does in jest, he ordains not to the last
   end.

   Objection 2: Further, the Philosopher says at the beginning of his
   Metaphysics 1,[2] that speculative science is sought for its own sake.
   Now it cannot be said that each speculative science is the last end.
   Therefore man does not desire all, whatsoever he desires, for the last
   end.

   Objection 3: Further, whosoever ordains something to an end, thinks of
   that end. But man does not always think of the last end in all that he
   desires or does. Therefore man neither desires nor does all for the
   last end.

   On the contrary, Augustine says (De Civ. Dei xix, 1): "That is the end
   of our good, for the sake of which we love other things, whereas we
   love it for its own sake."

   I answer that, Man must, of necessity, desire all, whatsoever he
   desires, for the last end. This is evident for two reasons. First,
   because whatever man desires, he desires it under the aspect of good.
   And if he desire it, not as his perfect good, which is the last end, he
   must, of necessity, desire it as tending to the perfect good, because
   the beginning of anything is always ordained to its completion; as is
   clearly the case in effects both of nature and of art. Wherefore every
   beginning of perfection is ordained to complete perfection which is
   achieved through the last end. Secondly, because the last end stands in
   the same relation in moving the appetite, as the first mover in other
   movements. Now it is clear that secondary moving causes do not move
   save inasmuch as they are moved by the first mover. Therefore secondary
   objects of the appetite do not move the appetite, except as ordained to
   the first object of the appetite, which is the last end.

   Reply to Objection 1: Actions done jestingly are not directed to any
   external end; but merely to the good of the jester, in so far as they
   afford him pleasure or relaxation. But man's consummate good is his
   last end.

   Reply to Objection 2: The same applies to speculative science; which is
   desired as the scientist's good, included in complete and perfect good,
   which is the ultimate end.

   Reply to Objection 3: One need not always be thinking of the last end,
   whenever one desires or does something: but the virtue of the first
   intention, which was in respect of the last end, remains in every
   desire directed to any object whatever, even though one's thoughts be
   not actually directed to the last end. Thus while walking along the
   road one needs not to be thinking of the end at every step.
     __________________________________________________________________

    Whether all men have the same last end?

   Objection 1: It would seem that all men have not the same last end. For
   before all else the unchangeable good seems to be the last end of man.
   But some turn away from the unchangeable good, by sinning. Therefore
   all men have not the same last end.

   Objection 2: Further, man's entire life is ruled according to his last
   end. If, therefore, all men had the same last end, they would not have
   various pursuits in life. Which is evidently false.

   Objection 3: Further, the end is the term of action. But actions are of
   individuals. Now although men agree in their specific nature, yet they
   differ in things pertaining to individuals. Therefore all men have not
   the same last end.

   On the contrary, Augustine says (De Trin. xiii, 3) that all men agree
   in desiring the last end, which is happiness.

   I answer that, We can speak of the last end in two ways: first,
   considering only the aspect of last end; secondly, considering the
   thing in which the aspect of last end is realized. So, then, as to the
   aspect of last end, all agree in desiring the last end: since all
   desire the fulfilment of their perfection, and it is precisely this
   fulfilment in which the last end consists, as stated above [995](A[5]).
   But as to the thing in which this aspect is realized, all men are not
   agreed as to their last end: since some desire riches as their
   consummate good; some, pleasure; others, something else. Thus to every
   taste the sweet is pleasant but to some, the sweetness of wine is most
   pleasant, to others, the sweetness of honey, or of something similar.
   Yet that sweet is absolutely the best of all pleasant things, in which
   he who has the best taste takes most pleasure. In like manner that good
   is most complete which the man with well disposed affections desires
   for his last end.

   Reply to Objection 1: Those who sin turn from that in which their last
   end really consists: but they do not turn away from the intention of
   the last end, which intention they mistakenly seek in other things.

   Reply to Objection 2: Various pursuits in life are found among men by
   reason of the various things in which men seek to find their last end.

   Reply to Objection 3: Although actions are of individuals, yet their
   first principle of action is nature, which tends to one thing, as
   stated above [996](A[5]).
     __________________________________________________________________

    Whether other creatures concur in that last end?

   Objection 1: It would seem that all other creatures concur in man's
   last end. For the end corresponds to the beginning. But man's
   beginning---i.e. God---is also the beginning of all else. Therefore all
   other things concur in man's last end.

   Objection 2: Further, Dionysius says (Div. Nom. iv) that "God turns all
   things to Himself as to their last end." But He is also man's last end;
   because He alone is to be enjoyed by man, as Augustine says (De Doctr.
   Christ. i, 5,22). Therefore other things, too, concur in man's last
   end.

   Objection 3: Further, man's last end is the object of the will. But the
   object of the will is the universal good, which is the end of all.
   Therefore other things, too, concur in man's last end.

   On the contrary, man's last end is happiness; which all men desire, as
   Augustine says (De Trin. xiii, 3,4). But "happiness is not possible for
   animals bereft of reason," as Augustine says (QQ. 83, qu. 5). Therefore
   other things do not concur in man's last end.

   I answer that, As the Philosopher says (Phys. ii, 2), the end is
   twofold---the end "for which" and the end "by which"; viz. the thing
   itself in which is found the aspect of good, and the use or acquisition
   of that thing. Thus we say that the end of the movement of a weighty
   body is either a lower place as "thing," or to be in a lower place, as
   "use"; and the end of the miser is money as "thing," or possession of
   money as "use."

   If, therefore, we speak of man's last end as of the thing which is the
   end, thus all other things concur in man's last end, since God is the
   last end of man and of all other things. If, however, we speak of man's
   last end, as of the acquisition of the end, then irrational creatures
   do not concur with man in this end. For man and other rational
   creatures attain to their last end by knowing and loving God: this is
   not possible to other creatures, which acquire their last end, in so
   far as they share in the Divine likeness, inasmuch as they are, or
   live, or even know.

   Hence it is evident how the objections are solved: since happiness
   means the acquisition of the last end.
     __________________________________________________________________

  OF THOSE THINGS IN WHICH MAN'S HAPPINESS CONSISTS (EIGHT ARTICLES)

   We have now to consider happiness: and (1) in what it consists; (2)
   what it is; (3) how we can obtain it.

   Concerning the first there are eight points of inquiry:

   (1) Whether happiness consists in wealth?

   (2) Whether in honor?

   (3) Whether in fame or glory?

   (4) Whether in power?

   (5) Whether in any good of the body?

   (6) Whether in pleasure?

   (7) Whether in any good of the soul?

   (8) Whether in any created good?
     __________________________________________________________________

    Whether man's happiness consists in wealth?

   Objection 1: It would seem that man's happiness consists in wealth. For
   since happiness is man's last end, it must consist in that which has
   the greatest hold on man's affections. Now this is wealth: for it is
   written (Eccles. 10:19): "All things obey money." Therefore man's
   happiness consists in wealth.

   Objection 2: Further, according to Boethius (De Consol. iii), happiness
   is "a state of life made perfect by the aggregate of all good things."
   Now money seems to be the means of possessing all things: for, as the
   Philosopher says (Ethic. v, 5), money was invented, that it might be a
   sort of guarantee for the acquisition of whatever man desires.
   Therefore happiness consists in wealth.

   Objection 3: Further, since the desire for the sovereign good never
   fails, it seems to be infinite. But this is the case with riches more
   than anything else; since "a covetous man shall not be satisfied with
   riches" (Eccles. 5:9). Therefore happiness consists in wealth.

   On the contrary, Man's good consists in retaining happiness rather than
   in spreading it. But as Boethius says (De Consol. ii), "wealth shines
   in giving rather than in hoarding: for the miser is hateful, whereas
   the generous man is applauded." Therefore man's happiness does not
   consist in wealth.

   I answer that, It is impossible for man's happiness to consist in
   wealth. For wealth is twofold, as the Philosopher says (Polit. i, 3),
   viz. natural and artificial. Natural wealth is that which serves man as
   a remedy for his natural wants: such as food, drink, clothing, cars,
   dwellings, and such like, while artificial wealth is that which is not
   a direct help to nature, as money, but is invented by the art of man,
   for the convenience of exchange, and as a measure of things salable.

   Now it is evident that man's happiness cannot consist in natural
   wealth. For wealth of this kind is sought for the sake of something
   else, viz. as a support of human nature: consequently it cannot be
   man's last end, rather is it ordained to man as to its end. Wherefore
   in the order of nature, all such things are below man, and made for
   him, according to Ps. 8:8: "Thou hast subjected all things under his
   feet."

   And as to artificial wealth, it is not sought save for the sake of
   natural wealth; since man would not seek it except because, by its
   means, he procures for himself the necessaries of life. Consequently
   much less can it be considered in the light of the last end. Therefore
   it is impossible for happiness, which is the last end of man, to
   consist in wealth.

   Reply to Objection 1: All material things obey money, so far as the
   multitude of fools is concerned, who know no other than material goods,
   which can be obtained for money. But we should take our estimation of
   human goods not from the foolish but from the wise: just as it is for a
   person whose sense of taste is in good order, to judge whether a thing
   is palatable.

   Reply to Objection 2: All things salable can be had for money: not so
   spiritual things, which cannot be sold. Hence it is written (Prov.
   17:16): "What doth it avail a fool to have riches, seeing he cannot buy
   wisdom."

   Reply to Objection 3: The desire for natural riches is not infinite:
   because they suffice for nature in a certain measure. But the desire
   for artificial wealth is infinite, for it is the servant of disordered
   concupiscence, which is not curbed, as the Philosopher makes clear
   (Polit. i, 3). Yet this desire for wealth is infinite otherwise than
   the desire for the sovereign good. For the more perfectly the sovereign
   good is possessed, the more it is loved, and other things despised:
   because the more we possess it, the more we know it. Hence it is
   written (Ecclus. 24:29): "They that eat me shall yet hunger." Whereas
   in the desire for wealth and for whatsoever temporal goods, the
   contrary is the case: for when we already possess them, we despise
   them, and seek others: which is the sense of Our Lord's words (Jn.
   4:13): "Whosoever drinketh of this water," by which temporal goods are
   signified, "shall thirst again." The reason of this is that we realize
   more their insufficiency when we possess them: and this very fact shows
   that they are imperfect, and the sovereign good does not consist
   therein.
     __________________________________________________________________

    Whether man's happiness consists in honors?

   Objection 1: It would seem that man's happiness consists in honors. For
   happiness or bliss is "the reward of virtue," as the Philosopher says
   (Ethic. i, 9). But honor more than anything else seems to be that by
   which virtue is rewarded, as the Philosopher says (Ethic. iv, 3).
   Therefore happiness consists especially in honor.

   Objection 2: Further, that which belongs to God and to persons of great
   excellence seems especially to be happiness, which is the perfect good.
   But that is honor, as the Philosopher says (Ethic. iv, 3). Moreover,
   the Apostle says (1 Tim. 1:17): "To . . . the only God be honor and
   glory." Therefore happiness consists in honor.

   Objection 3: Further, that which man desires above all is happiness.
   But nothing seems more desirable to man than honor: since man suffers
   loss in all other things, lest he should suffer loss of honor.
   Therefore happiness consists in honor.

   On the contrary, Happiness is in the happy. But honor is not in the
   honored, but rather in him who honors, and who offers deference to the
   person honored, as the Philosopher says (Ethic. i, 5). Therefore
   happiness does not consist in honor.

   I answer that, It is impossible for happiness to consist in honor. For
   honor is given to a man on account of some excellence in him; and
   consequently it is a sign and attestation of the excellence that is in
   the person honored. Now a man's excellence is in proportion, especially
   to his happiness, which is man's perfect good; and to its parts, i.e.
   those goods by which he has a certain share of happiness. And therefore
   honor can result from happiness, but happiness cannot principally
   consist therein.

   Reply to Objection 1: As the Philosopher says (Ethic. i, 5), honor is
   not that reward of virtue, for which the virtuous work: but they
   receive honor from men by way of reward, "as from those who have
   nothing greater to offer." But virtue's true reward is happiness
   itself, for which the virtuous work: whereas if they worked for honor,
   it would no longer be a virtue, but ambition.

   Reply to Objection 2: Honor is due to God and to persons of great
   excellence as a sign of attestation of excellence already existing: not
   that honor makes them excellent.

   Reply to Objection 3: That man desires honor above all else, arises
   from his natural desire for happiness, from which honor results, as
   stated above. Wherefore man seeks to be honored especially by the wise,
   on whose judgment he believes himself to be excellent or happy.
     __________________________________________________________________

    Whether man's happiness consists in fame or glory?

   Objection 1: It would seem that man's happiness consists in glory. For
   happiness seems to consist in that which is paid to the saints for the
   trials they have undergone in the world. But this is glory: for the
   Apostle says (Rom. 8:18): "The sufferings of this time are not worthy
   to be compared with the glory to come, that shall be revealed in us."
   Therefore happiness consists in glory.

   Objection 2: Further, good is diffusive of itself, as stated by
   Dionysius (Div. Nom. iv). But man's good is spread abroad in the
   knowledge of others by glory more than by anything else: since,
   according to Ambrose [*Augustine, Contra Maxim. Arian. ii. 13], glory
   consists "in being well known and praised." Therefore man's happiness
   consists in glory.

   Objection 3: Further, happiness is the most enduring good. Now this
   seems to be fame or glory; because by this men attain to eternity after
   a fashion. Hence Boethius says (De Consol. ii): "You seem to beget unto
   yourselves eternity, when you think of your fame in future time."
   Therefore man's happiness consists in fame or glory.

   On the contrary, Happiness is man's true good. But it happens that fame
   or glory is false: for as Boethius says (De Consol. iii), "many owe
   their renown to the lying reports spread among the people. Can anything
   be more shameful? For those who receive false fame, must needs blush at
   their own praise." Therefore man's happiness does not consist in fame
   or glory.

   I answer that, Man's happiness cannot consist in human fame or glory.
   For glory consists "in being well known and praised," as Ambrose
   [*Augustine, Contra Maxim. Arian. ii, 13] says. Now the thing known is
   related to human knowledge otherwise than to God's knowledge: for human
   knowledge is caused by the things known, whereas God's knowledge is the
   cause of the things known. Wherefore the perfection of human good,
   which is called happiness, cannot be caused by human knowledge: but
   rather human knowledge of another's happiness proceeds from, and, in a
   fashion, is caused by, human happiness itself, inchoate or perfect.
   Consequently man's happiness cannot consist in fame or glory. On the
   other hand, man's good depends on God's knowledge as its cause. And
   therefore man's beatitude depends, as on its cause, on the glory which
   man has with God; according to Ps. 90:15,16: "I will deliver him, and I
   will glorify him; I will fill him with length of days, and I will show
   him my salvation."

   Furthermore, we must observe that human knowledge often fails,
   especially in contingent singulars, such as are human acts. For this
   reason human glory is frequently deceptive. But since God cannot be
   deceived, His glory is always true; hence it is written (2 Cor. 10:18):
   "He . . . is approved . . . whom God commendeth."

   Reply to Objection 1: The Apostle speaks, then, not of the glory which
   is with men, but of the glory which is from God, with His Angels. Hence
   it is written (Mk. 8:38): "The Son of Man shall confess him in the
   glory of His Father, before His angels" [*St. Thomas joins Mk. 8:38
   with Lk. 12:8 owing to a possible variant in his text, or to the fact
   that he was quoting from memory].

   Reply to Objection 2: A man's good which, through fame or glory, is in
   the knowledge of many, if this knowledge be true, must needs be derived
   from good existing in the man himself: and hence it presupposes perfect
   or inchoate happiness. But if the knowledge be false, it does not
   harmonize with the thing: and thus good does not exist in him who is
   looked upon as famous. Hence it follows that fame can nowise make man
   happy.

   Reply to Objection 3: Fame has no stability; in fact, it is easily
   ruined by false report. And if sometimes it endures, this is by
   accident. But happiness endures of itself, and for ever.
     __________________________________________________________________

    Whether man's happiness consists in power?

   Objection 1: It would seem that happiness consists in power. For all
   things desire to become like to God, as to their last end and first
   beginning. But men who are in power, seem, on account of the similarity
   of power, to be most like to God: hence also in Scripture they are
   called "gods" (Ex. 22:28), "Thou shalt not speak ill of the gods."
   Therefore happiness consists in power.

   Objection 2: Further, happiness is the perfect good. But the highest
   perfection for man is to be able to rule others; which belongs to those
   who are in power. Therefore happiness consists in power.

   Objection 3: Further, since happiness is supremely desirable, it is
   contrary to that which is before all to be shunned. But, more than
   aught else, men shun servitude, which is contrary to power. Therefore
   happiness consists in power.

   On the contrary, Happiness is the perfect good. But power is most
   imperfect. For as Boethius says (De Consol. iii), "the power of man
   cannot relieve the gnawings of care, nor can it avoid the thorny path
   of anxiety": and further on: "Think you a man is powerful who is
   surrounded by attendants, whom he inspires with fear indeed, but whom
   he fears still more?"

   I answer that, It is impossible for happiness to consist in power; and
   this for two reasons. First because power has the nature of principle,
   as is stated in Metaph. v, 12, whereas happiness has the nature of last
   end. Secondly, because power has relation to good and evil: whereas
   happiness is man's proper and perfect good. Wherefore some happiness
   might consist in the good use of power, which is by virtue, rather than
   in power itself.

   Now four general reasons may be given to prove that happiness consists
   in none of the foregoing external goods. First, because, since
   happiness is man's supreme good, it is incompatible with any evil. Now
   all the foregoing can be found both in good and in evil men. Secondly,
   because, since it is the nature of happiness to "satisfy of itself," as
   stated in Ethic. i, 7, having gained happiness, man cannot lack any
   needful good. But after acquiring any one of the foregoing, man may
   still lack many goods that are necessary to him; for instance, wisdom,
   bodily health, and such like. Thirdly, because, since happiness is the
   perfect good, no evil can accrue to anyone therefrom. This cannot be
   said of the foregoing: for it is written (Eccles. 5:12) that "riches"
   are sometimes "kept to the hurt of the owner"; and the same may be said
   of the other three. Fourthly, because man is ordained to happiness
   through principles that are in him; since he is ordained thereto
   naturally. Now the four goods mentioned above are due rather to
   external causes, and in most cases to fortune; for which reason they
   are called goods of fortune. Therefore it is evident that happiness
   nowise consists in the foregoing.

   Reply to Objection 1: God's power is His goodness: hence He cannot use
   His power otherwise than well. But it is not so with men. Consequently
   it is not enough for man's happiness, that he become like God in power,
   unless he become like Him in goodness also.

   Reply to Objection 2: Just as it is a very good thing for a man to make
   good use of power in ruling many, so is it a very bad thing if he makes
   a bad use of it. And so it is that power is towards good and evil.

   Reply to Objection 3: Servitude is a hindrance to the good use of
   power: therefore is it that men naturally shun it; not because man's
   supreme good consists in power.
     __________________________________________________________________

    Whether man's happiness consists in any bodily good?

   Objection 1: It would seem that man's happiness consists in bodily
   goods. For it is written (Ecclus. 30:16): "There is no riches above the
   riches of the health of the body." But happiness consists in that which
   is best. Therefore it consists in the health of the body.

   Objection 2: Further, Dionysius says (Div. Nom. v), that "to be" is
   better than "to live," and "to live" is better than all that follows.
   But for man's being and living, the health of the body is necessary.
   Since, therefore, happiness is man's supreme good, it seems that health
   of the body belongs more than anything else to happiness.

   Objection 3: Further, the more universal a thing is, the higher the
   principle from which it depends; because the higher a cause is, the
   greater the scope of its power. Now just as the causality of the
   efficient cause consists in its flowing into something, so the
   causality of the end consists in its drawing the appetite. Therefore,
   just as the First Cause is that which flows into all things, so the
   last end is that which attracts the desire of all. But being itself is
   that which is most desired by all. Therefore man's happiness consists
   most of all in things pertaining to his being, such as the health of
   the body.

   On the contrary, Man surpasses all other animals in regard to
   happiness. But in bodily goods he is surpassed by many animals; for
   instance, by the elephant in longevity, by the lion in strength, by the
   stag in fleetness. Therefore man's happiness does not consist in goods
   of the body.

   I answer that, It is impossible for man's happiness to consist in the
   goods of the body; and this for two reasons. First, because, if a thing
   be ordained to another as to its end, its last end cannot consist in
   the preservation of its being. Hence a captain does not intend as a
   last end, the preservation of the ship entrusted to him, since a ship
   is ordained to something else as its end, viz. to navigation. Now just
   as the ship is entrusted to the captain that he may steer its course,
   so man is given over to his will and reason; according to Ecclus.
   15:14: "God made man from the beginning and left him in the hand of his
   own counsel." Now it is evident that man is ordained to something as
   his end: since man is not the supreme good. Therefore the last end of
   man's reason and will cannot be the preservation of man's being.

   Secondly, because, granted that the end of man's will and reason be the
   preservation of man's being, it could not be said that the end of man
   is some good of the body. For man's being consists in soul and body;
   and though the being of the body depends on the soul, yet the being of
   the human soul depends not on the body, as shown above ([997]FP, Q[75],
   A[2]); and the very body is for the soul, as matter for its form, and
   the instruments for the man that puts them into motion, that by their
   means he may do his work. Wherefore all goods of the body are ordained
   to the goods of the soul, as to their end. Consequently happiness,
   which is man's last end, cannot consist in goods of the body.

   Reply to Objection 1: Just as the body is ordained to the soul, as its
   end, so are external goods ordained to the body itself. And therefore
   it is with reason that the good of the body is preferred to external
   goods, which are signified by "riches," just as the good of the soul is
   preferred to all bodily goods.

   Reply to Objection 2: Being taken simply, as including all perfection
   of being, surpasses life and all that follows it; for thus being itself
   includes all these. And in this sense Dionysius speaks. But if we
   consider being itself as participated in this or that thing, which does
   not possess the whole perfection of being, but has imperfect being,
   such as the being of any creature; then it is evident that being itself
   together with an additional perfection is more excellent. Hence in the
   same passage Dionysius says that things that live are better than
   things that exist, and intelligent better than living things.

   Reply to Objection 3: Since the end corresponds to the beginning; this
   argument proves that the last end is the first beginning of being, in
   Whom every perfection of being is: Whose likeness, according to their
   proportion, some desire as to being only, some as to living being, some
   as to being which is living, intelligent and happy. And this belongs to
   few.
     __________________________________________________________________

    Whether man's happiness consists in pleasure?

   Objection 1: It would seem that man's happiness consists in pleasure.
   For since happiness is the last end, it is not desired for something
   else, but other things for it. But this answers to pleasure more than
   to anything else: "for it is absurd to ask anyone what is his motive in
   wishing to be pleased" (Ethic. x, 2). Therefore happiness consists
   principally in pleasure and delight.

   Objection 2: Further, "the first cause goes more deeply into the effect
   than the second cause" (De Causis i). Now the causality of the end
   consists in its attracting the appetite. Therefore, seemingly that
   which moves most the appetite, answers to the notion of the last end.
   Now this is pleasure: and a sign of this is that delight so far absorbs
   man's will and reason, that it causes him to despise other goods.
   Therefore it seems that man's last end, which is happiness, consists
   principally in pleasure.

   Objection 3: Further, since desire is for good, it seems that what all
   desire is best. But all desire delight; both wise and foolish, and even
   irrational creatures. Therefore delight is the best of all. Therefore
   happiness, which is the supreme good, consists in pleasure.

   On the contrary, Boethius says (De Consol. iii): "Any one that chooses
   to look back on his past excesses, will perceive that pleasures had a
   sad ending: and if they can render a man happy, there is no reason why
   we should not say that the very beasts are happy too."

   I answer that, Because bodily delights are more generally known, "the
   name of pleasure has been appropriated to them" (Ethic. vii, 13),
   although other delights excel them: and yet happiness does not consist
   in them. Because in every thing, that which pertains to its essence is
   distinct from its proper accident: thus in man it is one thing that he
   is a mortal rational animal, and another that he is a risible animal.
   We must therefore consider that every delight is a proper accident
   resulting from happiness, or from some part of happiness; since the
   reason that a man is delighted is that he has some fitting good, either
   in reality, or in hope, or at least in memory. Now a fitting good, if
   indeed it be the perfect good, is precisely man's happiness: and if it
   is imperfect, it is a share of happiness, either proximate, or remote,
   or at least apparent. Therefore it is evident that neither is delight,
   which results from the perfect good, the very essence of happiness, but
   something resulting therefrom as its proper accident.

   But bodily pleasure cannot result from the perfect good even in that
   way. For it results from a good apprehended by sense, which is a power
   of the soul, which power makes use of the body. Now good pertaining to
   the body, and apprehended by sense, cannot be man's perfect good. For
   since the rational soul excels the capacity of corporeal matter, that
   part of the soul which is independent of a corporeal organ, has a
   certain infinity in regard to the body and those parts of the soul
   which are tied down to the body: just as immaterial things are in a way
   infinite as compared to material things, since a form is, after a
   fashion, contracted and bounded by matter, so that a form which is
   independent of matter is, in a way, infinite. Therefore sense, which is
   a power of the body, knows the singular, which is determinate through
   matter: whereas the intellect, which is a power independent of matter,
   knows the universal, which is abstracted from matter, and contains an
   infinite number of singulars. Consequently it is evident that good
   which is fitting to the body, and which causes bodily delight through
   being apprehended by sense, is not man's perfect good, but is quite a
   trifle as compared with the good of the soul. Hence it is written (Wis.
   7:9) that "all gold in comparison of her, is as a little sand." And
   therefore bodily pleasure is neither happiness itself, nor a proper
   accident of happiness.

   Reply to Objection 1: It comes to the same whether we desire good, or
   desire delight, which is nothing else than the appetite's rest in good:
   thus it is owing to the same natural force that a weighty body is borne
   downwards and that it rests there. Consequently just as good is desired
   for itself, so delight is desired for itself and not for anything else,
   if the preposition "for" denote the final cause. But if it denote the
   formal or rather the motive cause, thus delight is desirable for
   something else, i.e. for the good, which is the object of that delight,
   and consequently is its principle, and gives it its form: for the
   reason that delight is desired is that it is rest in the thing desired.

   Reply to Objection 2: The vehemence of desire for sensible delight
   arises from the fact that operations of the senses, through being the
   principles of our knowledge, are more perceptible. And so it is that
   sensible pleasures are desired by the majority.

   Reply to Objection 3: All desire delight in the same way as they desire
   good: and yet they desire delight by reason of the good and not
   conversely, as stated above (ad 1). Consequently it does not follow
   that delight is the supreme and essential good, but that every delight
   results from some good, and that some delight results from that which
   is the essential and supreme good.
     __________________________________________________________________

    Whether some good of the soul constitutes man's happiness?

   Objection 1: It would seem that some good of the soul constitutes man's
   happiness. For happiness is man's good. Now this is threefold: external
   goods, goods of the body, and goods of the soul. But happiness does not
   consist in external goods, nor in goods of the body, as shown above
   ([998]AA[4],5). Therefore it consists in goods of the soul.

   Objection 2: Further, we love that for which we desire good, more than
   the good that we desire for it: thus we love a friend for whom we
   desire money, more than we love money. But whatever good a man desires,
   he desires it for himself. Therefore he loves himself more than all
   other goods. Now happiness is what is loved above all: which is evident
   from the fact that for its sake all else is loved and desired.
   Therefore happiness consists in some good of man himself: not, however,
   in goods of the body; therefore, in goods of the soul.

   Objection 3: Further, perfection is something belonging to that which
   is perfected. But happiness is a perfection of man. Therefore happiness
   is something belonging to man. But it is not something belonging to the
   body, as shown above [999](A[5]). Therefore it is something belonging
   to the soul; and thus it consists in goods of the soul.

   On the contrary, As Augustine says (De Doctr. Christ. i, 22), "that
   which constitutes the life of happiness is to be loved for its own
   sake." But man is not to be loved for his own sake, but whatever is in
   man is to be loved for God's sake. Therefore happiness consists in no
   good of the soul.

   I answer that, As stated above ([1000]Q[1], A[8]), the end is twofold:
   namely, the thing itself, which we desire to attain, and the use,
   namely, the attainment or possession of that thing. If, then, we speak
   of man's last end, it is impossible for man's last end to be the soul
   itself or something belonging to it. Because the soul, considered in
   itself, is as something existing in potentiality: for it becomes
   knowing actually, from being potentially knowing; and actually
   virtuous, from being potentially virtuous. Now since potentiality is
   for the sake of act as for its fulfilment, that which in itself is in
   potentiality cannot be the last end. Therefore the soul itself cannot
   be its own last end.

   In like manner neither can anything belonging to it, whether power,
   habit, or act. For that good which is the last end, is the perfect good
   fulfilling the desire. Now man's appetite, otherwise the will, is for
   the universal good. And any good inherent to the soul is a participated
   good, and consequently a portioned good. Therefore none of them can be
   man's last end.

   But if we speak of man's last end, as to the attainment or possession
   thereof, or as to any use whatever of the thing itself desired as an
   end, thus does something of man, in respect of his soul, belong to his
   last end: since man attains happiness through his soul. Therefore the
   thing itself which is desired as end, is that which constitutes
   happiness, and makes man happy; but the attainment of this thing is
   called happiness. Consequently we must say that happiness is something
   belonging to the soul; but that which constitutes happiness is
   something outside the soul.

   Reply to Objection 1: Inasmuch as this division includes all goods that
   man can desire, thus the good of the soul is not only power, habit, or
   act, but also the object of these, which is something outside. And in
   this way nothing hinders us from saying that what constitutes happiness
   is a good of the soul.

   Reply to Objection 2: As far as the proposed objection is concerned,
   happiness is loved above all, as the good desired; whereas a friend is
   loved as that for which good is desired; and thus, too, man loves
   himself. Consequently it is not the same kind of love in both cases. As
   to whether man loves anything more than himself with the love of
   friendship there will be occasion to inquire when we treat of Charity.

   Reply to Objection 3: Happiness, itself, since it is a perfection of
   the soul, is an inherent good of the soul; but that which constitutes
   happiness, viz. which makes man happy, is something outside his soul,
   as stated above.
     __________________________________________________________________

    Whether any created good constitutes man's happiness?

   Objection 1: It would seem that some created good constitutes man's
   happiness. For Dionysius says (Div. Nom. vii) that Divine wisdom
   "unites the ends of first things to the beginnings of second things,"
   from which we may gather that the summit of a lower nature touches the
   base of the higher nature. But man's highest good is happiness. Since
   then the angel is above man in the order of nature, as stated in
   [1001]FP, Q[111], A[1], it seems that man's happiness consists in man
   somehow reaching the angel.

   Objection 2: Further, the last end of each thing is that which, in
   relation to it, is perfect: hence the part is for the whole, as for its
   end. But the universe of creatures which is called the macrocosm, is
   compared to man who is called the microcosm (Phys. viii, 2), as perfect
   to imperfect. Therefore man's happiness consists in the whole universe
   of creatures.

   Objection 3: Further, man is made happy by that which lulls his natural
   desire. But man's natural desire does not reach out to a good
   surpassing his capacity. Since then man's capacity does not include
   that good which surpasses the limits of all creation, it seems that man
   can be made happy by some created good. Consequently some created good
   constitutes man's happiness.

   On the contrary, Augustine says (De Civ. Dei xix, 26): "As the soul is
   the life of the body, so God is man's life of happiness: of Whom it is
   written: 'Happy is that people whose God is the Lord' (Ps. 143:15)."

   I answer that, It is impossible for any created good to constitute
   man's happiness. For happiness is the perfect good, which lulls the
   appetite altogether; else it would not be the last end, if something
   yet remained to be desired. Now the object of the will, i.e. of man's
   appetite, is the universal good; just as the object of the intellect is
   the universal true. Hence it is evident that naught can lull man's
   will, save the universal good. This is to be found, not in any
   creature, but in God alone; because every creature has goodness by
   participation. Wherefore God alone can satisfy the will of man,
   according to the words of Ps. 102:5: "Who satisfieth thy desire with
   good things." Therefore God alone constitutes man's happiness.

   Reply to Objection 1: The summit of man does indeed touch the base of
   the angelic nature, by a kind of likeness; but man does not rest there
   as in his last end, but reaches out to the universal fount itself of
   good, which is the common object of happiness of all the blessed, as
   being the infinite and perfect good.

   Reply to Objection 2: If a whole be not the last end, but ordained to a
   further end, then the last end of a part thereof is not the whole
   itself, but something else. Now the universe of creatures, to which man
   is compared as part to whole, is not the last end, but is ordained to
   God, as to its last end. Therefore the last end of man is not the good
   of the universe, but God himself.

   Reply to Objection 3: Created good is not less than that good of which
   man is capable, as of something intrinsic and inherent to him: but it
   is less than the good of which he is capable, as of an object, and
   which is infinite. And the participated good which is in an angel, and
   in the whole universe, is a finite and restricted good.
     __________________________________________________________________

  WHAT IS HAPPINESS (EIGHT ARTICLES)

   We have now to consider (1) what happiness is, and (2) what things are
   required for it.

   Concerning the first there are eight points of inquiry:

   (1) Whether happiness is something uncreated?

   (2) If it be something created, whether it is an operation?

   (3) Whether it is an operation of the sensitive, or only of the
   intellectual part?

   (4) If it be an operation of the intellectual part, whether it is an
   operation of the intellect, or of the will?

   (5) If it be an operation of the intellect, whether it is an operation
   of the speculative or of the practical intellect?

   (6) If it be an operation of the speculative intellect, whether it
   consists in the consideration of speculative sciences?

   (7) Whether it consists in the consideration of separate substances
   viz. angels?

   (8) Whether it consists in the sole contemplation of God seen in His
   Essence?
     __________________________________________________________________

    Whether happiness is something uncreated?

   Objection 1: It would seem that happiness is something uncreated. For
   Boethius says (De Consol. iii): "We must needs confess that God is
   happiness itself."

   Objection 2: Further, happiness is the supreme good. But it belongs to
   God to be the supreme good. Since, then, there are not several supreme
   goods, it seems that happiness is the same as God.

   Objection 3: Further, happiness is the last end, to which man's will
   tends naturally. But man's will should tend to nothing else as an end,
   but to God, Who alone is to be enjoyed, as Augustine says (De Doctr.
   Christ. i, 5,22). Therefore happiness is the same as God.

   On the contrary, Nothing made is uncreated. But man's happiness is
   something made; because according to Augustine (De Doctr. Christ. i,
   3): "Those things are to be enjoyed which make us happy." Therefore
   happiness is not something uncreated.

   I answer that, As stated above ([1002]Q[1], A[8];[1003] Q[2], A[7]),
   our end is twofold. First, there is the thing itself which we desire to
   attain: thus for the miser, the end is money. Secondly there is the
   attainment or possession, the use or enjoyment of the thing desired;
   thus we may say that the end of the miser is the possession of money;
   and the end of the intemperate man is to enjoy something pleasurable.
   In the first sense, then, man's last end is the uncreated good, namely,
   God, Who alone by His infinite goodness can perfectly satisfy man's
   will. But in the second way, man's last end is something created,
   existing in him, and this is nothing else than the attainment or
   enjoyment of the last end. Now the last end is called happiness. If,
   therefore, we consider man's happiness in its cause or object, then it
   is something uncreated; but if we consider it as to the very essence of
   happiness, then it is something created.

   Reply to Objection 1: God is happiness by His Essence: for He is happy
   not by acquisition or participation of something else, but by His
   Essence. On the other hand, men are happy, as Boethius says (De Consol.
   iii), by participation; just as they are called "gods," by
   participation. And this participation of happiness, in respect of which
   man is said to be happy, is something created.

   Reply to Objection 2: Happiness is called man's supreme good, because
   it is the attainment or enjoyment of the supreme good.

   Reply to Objection 3: Happiness is said to be the last end, in the same
   way as the attainment of the end is called the end.
     __________________________________________________________________

    Whether happiness is an operation?

   Objection 1: It would seem that happiness is not an operation. For the
   Apostle says (Rom. 6:22): "You have your fruit unto sanctification, and
   the end, life everlasting." But life is not an operation, but the very
   being of living things. Therefore the last end, which is happiness, is
   not an operation.

   Objection 2: Further, Boethius says (De Consol. iii) that happiness is
   "a state made perfect by the aggregate of all good things." But state
   does not indicate operation. Therefore happiness is not an operation.

   Objection 3: Further, happiness signifies something existing in the
   happy one: since it is man's final perfection. But the meaning of
   operation does not imply anything existing in the operator, but rather
   something proceeding therefrom. Therefore happiness is not an
   operation.

   Objection 4: Further, happiness remains in the happy one. Now operation
   does not remain, but passes. Therefore happiness is not an operation.

   Objection 5: Further, to one man there is one happiness. But operations
   are many. Therefore happiness is not an operation.

   Objection 6: Further, happiness is in the happy one uninterruptedly.
   But human operation is often interrupted; for instance, by sleep, or
   some other occupation, or by cessation. Therefore happiness is not an
   operation.

   On the contrary, The Philosopher says (Ethic. i, 13) that "happiness is
   an operation according to perfect virtue."

   I answer that, In so far as man's happiness is something created,
   existing in him, we must needs say that it is an operation. For
   happiness is man's supreme perfection. Now each thing is perfect in so
   far as it is actual; since potentiality without act is imperfect.
   Consequently happiness must consist in man's last act. But it is
   evident that operation is the last act of the operator, wherefore the
   Philosopher calls it "second act" (De Anima ii, 1): because that which
   has a form can be potentially operating, just as he who knows is
   potentially considering. And hence it is that in other things, too,
   each one is said to be "for its operation" (De Coel ii, 3). Therefore
   man's happiness must of necessity consist in an operation.

   Reply to Objection 1: Life is taken in two senses. First for the very
   being of the living. And thus happiness is not life: since it has been
   shown ([1004]Q[2] , A[5]) that the being of a man, no matter in what it
   may consist, is not that man's happiness; for of God alone is it true
   that His Being is His Happiness. Secondly, life means the operation of
   the living, by which operation the principle of life is made actual:
   thus we speak of active and contemplative life, or of a life of
   pleasure. And in this sense eternal life is said to be the last end, as
   is clear from Jn. 17:3: "This is eternal life, that they may know Thee,
   the only true God."

   Reply to Objection 2: Boethius, in defining happiness, considered
   happiness in general: for considered thus it is the perfect common
   good; and he signified this by saying that happiness is "a state made
   perfect by the aggregate of all good things," thus implying that the
   state of a happy man consists in possessing the perfect good. But
   Aristotle expressed the very essence of happiness, showing by what man
   is established in this state, and that it is by some kind of operation.
   And so it is that he proves happiness to be "the perfect good" (Ethic.
   i, 7).

   Reply to Objection 3: As stated in Metaph. ix, 7 action is twofold. One
   proceeds from the agent into outward matter, such as "to burn" and "to
   cut." And such an operation cannot be happiness: for such an operation
   is an action and a perfection, not of the agent, but rather of the
   patient, as is stated in the same passage. The other is an action that
   remains in the agent, such as to feel, to understand, and to will: and
   such an action is a perfection and an act of the agent. And such an
   operation can be happiness.

   Reply to Objection 4: Since happiness signifies some final perfection;
   according as various things capable of happiness can attain to various
   degrees of perfection, so must there be various meanings applied to
   happiness. For in God there is happiness essentially; since His very
   Being is His operation, whereby He enjoys no other than Himself. In the
   happy angels, the final perfection is in respect of some operation, by
   which they are united to the Uncreated Good: and this operation of
   theirs is one only and everlasting. But in men, according to their
   present state of life, the final perfection is in respect of an
   operation whereby man is united to God: but this operation neither can
   be continual, nor, consequently, is it one only, because operation is
   multiplied by being discontinued. And for this reason in the present
   state of life, perfect happiness cannot be attained by man. Wherefore
   the Philosopher, in placing man's happiness in this life (Ethic. i,
   10), says that it is imperfect, and after a long discussion, concludes:
   "We call men happy, but only as men." But God has promised us perfect
   happiness, when we shall be "as the angels . . . in heaven" (Mat.
   22:30).

   Consequently in regard to this perfect happiness, the objection fails:
   because in that state of happiness, man's mind will be united to God by
   one, continual, everlasting operation. But in the present life, in as
   far as we fall short of the unity and continuity of that operation so
   do we fall short of perfect happiness. Nevertheless it is a
   participation of happiness: and so much the greater, as the operation
   can be more continuous and more one. Consequently the active life,
   which is busy with many things, has less of happiness than the
   contemplative life, which is busied with one thing, i.e. the
   contemplation of truth. And if at any time man is not actually engaged
   in this operation, yet since he can always easily turn to it, and since
   he ordains the very cessation, by sleeping or occupying himself
   otherwise, to the aforesaid occupation, the latter seems, as it were,
   continuous. From these remarks the replies to Objections 5 and 6 are
   evident.
     __________________________________________________________________

    Whether happiness is an operation of the sensitive part, or of the
    intellective part only?

   Objection 1: It would seem that happiness consists in an operation of
   the senses also. For there is no more excellent operation in man than
   that of the senses, except the intellective operation. But in us the
   intellective operation depends on the sensitive: since "we cannot
   understand without a phantasm" (De Anima iii, 7). Therefore happiness
   consists in an operation of the senses also.

   Objection 2: Further, Boethius says (De Consol. iii) that happiness is
   "a state made perfect by the aggregate of all good things." But some
   goods are sensible, which we attain by the operation of the senses.
   Therefore it seems that the operation of the senses is needed for
   happiness.

   Objection 3: Further, happiness is the perfect good, as we find proved
   in Ethic. i, 7: which would not be true, were not man perfected thereby
   in all his parts. But some parts of the soul are perfected by sensitive
   operations. Therefore sensitive operation is required for happiness.

   On the contrary, Irrational animals have the sensitive operation in
   common with us: but they have not happiness in common with us.
   Therefore happiness does not consist in a sensitive operation.

   I answer that, A thing may belong to happiness in three ways: (1)
   essentially, (2) antecedently, (3) consequently. Now the operation of
   sense cannot belong to happiness essentially. For man's happiness
   consists essentially in his being united to the Uncreated Good, Which
   is his last end, as shown above [1005](A[1]): to Which man cannot be
   united by an operation of his senses. Again, in like manner, because,
   as shown above (Q[2], A[5]), man's happiness does not consist in goods
   of the body, which goods alone, however, we attain through the
   operation of the senses.

   Nevertheless the operations of the senses can belong to happiness, both
   antecedently and consequently: antecedently, in respect of imperfect
   happiness, such as can be had in this life, since the operation of the
   intellect demands a previous operation of the sense; consequently, in
   that perfect happiness which we await in heaven; because at the
   resurrection, "from the very happiness of the soul," as Augustine says
   (Ep. ad Dioscor.) "the body and the bodily senses will receive a
   certain overflow, so as to be perfected in their operations"; a point
   which will be explained further on when we treat of the resurrection
   (SS, QQ[82] -85). But then the operation whereby man's mind is united
   to God will not depend on the senses.

   Reply to Objection 1: This objection proves that the operation of the
   senses is required antecedently for imperfect happiness, such as can be
   had in this life.

   Reply to Objection 2: Perfect happiness, such as the angels have,
   includes the aggregate of all good things, by being united to the
   universal source of all good; not that it requires each individual
   good. But in this imperfect happiness, we need the aggregate of those
   goods that suffice for the most perfect operation of this life.

   Reply to Objection 3: In perfect happiness the entire man is perfected,
   in the lower part of his nature, by an overflow from the higher. But in
   the imperfect happiness of this life, it is otherwise; we advance from
   the perfection of the lower part to the perfection of the higher part.
     __________________________________________________________________

    Whether, if happiness is in the intellective part, it is an operation of the
    intellect or of the will?

   Objection 1: It would seem that happiness consists in an act of the
   will. For Augustine says (De Civ. Dei xix, 10,11), that man's happiness
   consists in peace; wherefore it is written (Ps. 147:3): "Who hath
   placed peace in thy end [Douay: 'borders']". But peace pertains to the
   will. Therefore man's happiness is in the will.

   Objection 2: Further, happiness is the supreme good. But good is the
   object of the will. Therefore happiness consists in an operation of the
   will.

   Objection 3: Further, the last end corresponds to the first mover: thus
   the last end of the whole army is victory, which is the end of the
   general, who moves all the men. But the first mover in regard to
   operations is the will: because it moves the other powers, as we shall
   state further on ([1006]Q[9], AA[1],3). Therefore happiness regards the
   will.

   Objection 4: Further, if happiness be an operation, it must needs be
   man's most excellent operation. But the love of God, which is an act of
   the will, is a more excellent operation than knowledge, which is an
   operation of the intellect, as the Apostle declares (1 Cor. 13).
   Therefore it seems that happiness consists in an act of the will.

   Objection 5: Further, Augustine says (De Trin. xiii, 5) that "happy is
   he who has whatever he desires, and desires nothing amiss." And a
   little further on (6) he adds: "He is most happy who desires well,
   whatever he desires: for good things make a man happy, and such a man
   already possesses some good---i.e. a good will." Therefore happiness
   consists in an act of the will.

   On the contrary, Our Lord said (Jn. 17:3): "This is eternal life: that
   they may know Thee, the only true God." Now eternal life is the last
   end, as stated above (A[2], ad 1). Therefore man's happiness consists
   in the knowledge of God, which is an act of the intellect.

   I answer that, As stated above (Q[2], A[6]) two things are needed for
   happiness: one, which is the essence of happiness: the other, that is,
   as it were, its proper accident, i.e. the delight connected with it. I
   say, then, that as to the very essence of happiness, it is impossible
   for it to consist in an act of the will. For it is evident from what
   has been said ([1007]AA[1],2; Q[2], A[7]) that happiness is the
   attainment of the last end. But the attainment of the end does not
   consist in the very act of the will. For the will is directed to the
   end, both absent, when it desires it; and present, when it is delighted
   by resting therein. Now it is evident that the desire itself of the end
   is not the attainment of the end, but is a movement towards the end:
   while delight comes to the will from the end being present; and not
   conversely, is a thing made present, by the fact that the will delights
   in it. Therefore, that the end be present to him who desires it, must
   be due to something else than an act of the will.

   This is evidently the case in regard to sensible ends. For if the
   acquisition of money were through an act of the will, the covetous man
   would have it from the very moment that he wished for it. But at the
   moment it is far from him; and he attains it, by grasping it in his
   hand, or in some like manner; and then he delights in the money got.
   And so it is with an intelligible end. For at first we desire to attain
   an intelligible end; we attain it, through its being made present to us
   by an act of the intellect; and then the delighted will rests in the
   end when attained.

   So, therefore, the essence of happiness consists in an act of the
   intellect: but the delight that results from happiness pertains to the
   will. In this sense Augustine says (Confess. x, 23) that happiness is
   "joy in truth," because, to wit, joy itself is the consummation of
   happiness.

   Reply to Objection 1: Peace pertains to man's last end, not as though
   it were the very essence of happiness; but because it is antecedent and
   consequent thereto: antecedent, in so far as all those things are
   removed which disturb and hinder man in attaining the last end:
   consequent inasmuch as when man has attained his last end, he remains
   at peace, his desire being at rest.

   Reply to Objection 2: The will's first object is not its act: just as
   neither is the first object of the sight, vision, but a visible thing.
   Wherefore, from the very fact that happiness belongs to the will, as
   the will's first object, it follows that it does not belong to it as
   its act.

   Reply to Objection 3: The intellect apprehends the end before the will
   does: yet motion towards the end begins in the will. And therefore to
   the will belongs that which last of all follows the attainment of the
   end, viz. delight or enjoyment.

   Reply to Objection 4: Love ranks above knowledge in moving, but
   knowledge precedes love in attaining: for "naught is loved save what is
   known," as Augustine says (De Trin. x, 1). Consequently we first attain
   an intelligible end by an act of the intellect; just as we first attain
   a sensible end by an act of sense.

   Reply to Objection 5: He who has whatever he desires, is happy, because
   he has what he desires: and this indeed is by something other than the
   act of his will. But to desire nothing amiss is needed for happiness,
   as a necessary disposition thereto. And a good will is reckoned among
   the good things which make a man happy, forasmuch as it is an
   inclination of the will: just as a movement is reduced to the genus of
   its terminus, for instance, "alteration" to the genus "quality."
     __________________________________________________________________

    Whether happiness is an operation of the speculative, or of the practical
    intellect?

   Objection 1: It would seem that happiness is an operation of the
   practical intellect. For the end of every creature consists in becoming
   like God. But man is like God, by his practical intellect, which is the
   cause of things understood, rather than by his speculative intellect,
   which derives its knowledge from things. Therefore man's happiness
   consists in an operation of the practical intellect rather than of the
   speculative.

   Objection 2: Further, happiness is man's perfect good. But the
   practical intellect is ordained to the good rather than the speculative
   intellect, which is ordained to the true. Hence we are said to be good,
   in reference to the perfection of the practical intellect, but not in
   reference to the perfection of the speculative intellect, according to
   which we are said to be knowing or understanding. Therefore man's
   happiness consists in an act of the practical intellect rather than of
   the speculative.

   Objection 3: Further, happiness is a good of man himself. But the
   speculative intellect is more concerned with things outside man;
   whereas the practical intellect is concerned with things belonging to
   man himself, viz. his operations and passions. Therefore man's
   happiness consists in an operation of the practical intellect rather
   than of the speculative.

   On the contrary, Augustine says (De Trin. i, 8) that "contemplation is
   promised us, as being the goal of all our actions, and the everlasting
   perfection of our joys."

   I answer that, Happiness consists in an operation of the speculative
   rather than of the practical intellect. This is evident for three
   reasons. First because if man's happiness is an operation, it must
   needs be man's highest operation. Now man's highest operation is that
   of his highest power in respect of its highest object: and his highest
   power is the intellect, whose highest object is the Divine Good, which
   is the object, not of the practical but of the speculative intellect.
   Consequently happiness consists principally in such an operation, viz.
   in the contemplation of Divine things. And since that "seems to be each
   man's self, which is best in him," according to Ethic. ix, 8, and x, 7,
   therefore such an operation is most proper to man and most delightful
   to him.

   Secondly, it is evident from the fact that contemplation is sought
   principally for its own sake. But the act of the practical intellect is
   not sought for its own sake but for the sake of action: and these very
   actions are ordained to some end. Consequently it is evident that the
   last end cannot consist in the active life, which pertains to the
   practical intellect.

   Thirdly, it is again evident, from the fact that in the contemplative
   life man has something in common with things above him, viz. with God
   and the angels, to whom he is made like by happiness. But in things
   pertaining to the active life, other animals also have something in
   common with man, although imperfectly.

   Therefore the last and perfect happiness, which we await in the life to
   come, consists entirely in contemplation. But imperfect happiness, such
   as can be had here, consists first and principally, in an operation of
   the practical intellect directing human actions and passions, as stated
   in Ethic. x, 7,8.

   Reply to Objection 1: The asserted likeness of the practical intellect
   to God is one of proportion; that is to say, by reason of its standing
   in relation to what it knows, as God does to what He knows. But the
   likeness of the speculative intellect to God is one of union and
   "information"; which is a much greater likeness. And yet it may be
   answered that, in regard to the principal thing known, which is His
   Essence, God has not practical but merely speculative knowledge.

   Reply to Objection 2: The practical intellect is ordained to good which
   is outside of it: but the speculative intellect has good within it,
   viz. the contemplation of truth. And if this good be perfect, the whole
   man is perfected and made good thereby: such a good the practical
   intellect has not; but it directs man thereto.

   Reply to Objection 3: This argument would hold, if man himself were his
   own last end; for then the consideration and direction of his actions
   and passions would be his happiness. But since man's last end is
   something outside of him, to wit, God, to Whom we reach out by an
   operation of the speculative intellect; therefore, man's happiness
   consists in an operation of the speculative intellect rather than of
   the practical intellect.
     __________________________________________________________________

    Whether happiness consists in the consideration of speculative sciences?

   Objection 1: It would seem that man's happiness consists in the
   consideration of speculative sciences. For the Philosopher says (Ethic.
   i, 13) that "happiness is an operation according to perfect virtue."
   And in distinguishing the virtues, he gives no more than three
   speculative virtues---"knowledge," "wisdom" and "understanding," which
   all belong to the consideration of speculative sciences. Therefore
   man's final happiness consists in the consideration of speculative
   sciences.

   Objection 2: Further, that which all desire for its own sake, seems to
   be man's final happiness. Now such is the consideration of speculative
   sciences; because, as stated in Metaph. i, 1, "all men naturally desire
   to know"; and, a little farther on (2), it is stated that speculative
   sciences are sought for their own sakes. Therefore happiness consists
   in the consideration of speculative sciences.

   Objection 3: Further, happiness is man's final perfection. Now
   everything is perfected, according as it is reduced from potentiality
   to act. But the human intellect is reduced to act by the consideration
   of speculative sciences. Therefore it seems that in the consideration
   of these sciences, man's final happiness consists.

   On the contrary, It is written (Jer. 9:23): "Let not the wise man glory
   in his wisdom": and this is said in reference to speculative sciences.
   Therefore man's final happiness does not consist in the consideration
   of these.

   I answer that, As stated above (A[2], ad 4), man's happiness is
   twofold, one perfect, the other imperfect. And by perfect happiness we
   are to understand that which attains to the true notion of happiness;
   and by imperfect happiness that which does not attain thereto, but
   partakes of some particular likeness of happiness. Thus perfect
   prudence is in man, with whom is the idea of things to be done; while
   imperfect prudence is in certain irrational animals, who are possessed
   of certain particular instincts in respect of works similar to works of
   prudence.

   Accordingly perfect happiness cannot consist essentially in the
   consideration of speculative sciences. To prove this, we must observe
   that the consideration of a speculative science does not extend beyond
   the scope of the principles of that science: since the entire science
   is virtually contained in its principles. Now the first principles of
   speculative sciences are received through the senses, as the
   Philosopher clearly states at the beginning of the Metaphysics (i, 1),
   and at the end of the Posterior Analytics (ii, 15). Wherefore the
   entire consideration of speculative sciences cannot extend farther than
   knowledge of sensibles can lead. Now man's final happiness, which is
   his final perfection cannot consist in the knowledge of sensibles. For
   a thing is not perfected by something lower, except in so far as the
   lower partakes of something higher. Now it is evident that the form of
   a stone or of any sensible, is lower than man. Consequently the
   intellect is not perfected by the form of a stone, as such, but
   inasmuch as it partakes of a certain likeness to that which is above
   the human intellect, viz. the intelligible light, or something of the
   kind. Now whatever is by something else is reduced to that which is of
   itself. Therefore man's final perfection must needs be through
   knowledge of something above the human intellect. But it has been shown
   ([1008]FP, Q[88], A[2]), that man cannot acquire through sensibles, the
   knowledge of separate substances, which are above the human intellect.
   Consequently it follows that man's happiness cannot consist in the
   consideration of speculative sciences. However, just as in sensible
   forms there is a participation of the higher substances, so the
   consideration of speculative sciences is a certain participation of
   true and perfect happiness.

   Reply to Objection 1: In his book on Ethics the Philosopher treats of
   imperfect happiness, such as can be had in this life, as stated above
   (A[2], ad 4).

   Reply to Objection 2: Not only is perfect happiness naturally desired,
   but also any likeness or participation thereof.

   Reply to Objection 3: Our intellect is reduced to act, in a fashion, by
   the consideration of speculative sciences, but not to its final and
   perfect act.
     __________________________________________________________________

    Whether happiness consists in the knowledge of separate substances, namely,
    angels?

   Objection 1: It would seem that man's happiness consists in the
   knowledge of separate substances, namely, angels. For Gregory says in a
   homily (xxvi in Evang.): "It avails nothing to take part in the feasts
   of men, if we fail to take part in the feasts of angels"; by which he
   means final happiness. But we can take part in the feasts of the angels
   by contemplating them. Therefore it seems that man's final happiness
   consists in contemplating the angels.

   Objection 2: Further, the final perfection of each thing is for it to
   be united to its principle: wherefore a circle is said to be a perfect
   figure, because its beginning and end coincide. But the beginning of
   human knowledge is from the angels, by whom men are enlightened, as
   Dionysius says (Coel. Hier. iv). Therefore the perfection of the human
   intellect consists in contemplating the angels.

   Objection 3: Further, each nature is perfect, when united to a higher
   nature; just as the final perfection of a body is to be united to the
   spiritual nature. But above the human intellect, in the natural order,
   are the angels. Therefore the final perfection of the human intellect
   is to be united to the angels by contemplation.

   On the contrary, It is written (Jer. 9:24): "Let him that glorieth,
   glory in this, that he understandeth and knoweth Me." Therefore man's
   final glory or happiness consists only in the knowledge of God.

   I answer that, As stated above [1009](A[6]), man's perfect happiness
   consists not in that which perfects the intellect by some
   participation, but in that which is so by its essence. Now it is
   evident that whatever is the perfection of a power is so in so far as
   the proper formal object of that power belongs to it. Now the proper
   object of the intellect is the true. Therefore the contemplation of
   whatever has participated truth, does not perfect the intellect with
   its final perfection. Since, therefore, the order of things is the same
   in being and in truth (Metaph ii, 1); whatever are beings by
   participation, are true by participation. Now angels have being by
   participation: because in God alone is His Being His Essence, as shown
   in the [1010]FP, Q[44], A[1]. It follows that contemplation of Him
   makes man perfectly happy. However, there is no reason why we should
   not admit a certain imperfect happiness in the contemplation of the
   angels; and higher indeed than in the consideration of speculative
   science.

   Reply to Objection 1: We shall take part in the feasts of the angels,
   by contemplating not only the angels, but, together with them, also God
   Himself.

   Reply to Objection 2: According to those that hold human souls to be
   created by the angels, it seems fitting enough, that man's happiness
   should consist in the contemplation of the angels, in the union, as it
   were, of man with his beginning. But this is erroneous, as stated in
   [1011]FP, Q[90], A[3]. Wherefore the final perfection of the human
   intellect is by union with God, Who is the first principle both of the
   creation of the soul and of its enlightenment. Whereas the angel
   enlightens as a minister, as stated in the [1012]FP, Q[111], A[2], ad
   2. Consequently, by his ministration he helps man to attain to
   happiness; but he is not the object of man's happiness.

   Reply to Objection 3: The lower nature may reach the higher in two
   ways. First, according to a degree of the participating power: and thus
   man's final perfection will consist in his attaining to a contemplation
   such as that of the angels. Secondly, as the object is attained by the
   power: and thus the final perfection of each power is to attain that in
   which is found the fulness of its formal object.
     __________________________________________________________________

    Whether man's happiness consists in the vision of the divine essence?

   Objection 1: It would seem that man's happiness does not consist in the
   vision of the Divine Essence. For Dionysius says (Myst. Theol. i) that
   by that which is highest in his intellect, man is united to God as to
   something altogether unknown. But that which is seen in its essence is
   not altogether unknown. Therefore the final perfection of the
   intellect, namely, happiness, does not consist in God being seen in His
   Essence.

   Objection 2: Further, the higher the perfection belongs to the higher
   nature. But to see His own Essence is the perfection proper to the
   Divine intellect. Therefore the final perfection of the human intellect
   does not reach to this, but consists in something less.

   On the contrary, It is written (1 Jn. 3:2): "When He shall appear, we
   shall be like to Him; and [Vulg.: 'because'] we shall see Him as He
   is."

   I answer that, Final and perfect happiness can consist in nothing else
   than the vision of the Divine Essence. To make this clear, two points
   must be observed. First, that man is not perfectly happy, so long as
   something remains for him to desire and seek: secondly, that the
   perfection of any power is determined by the nature of its object. Now
   the object of the intellect is "what a thing is," i.e. the essence of a
   thing, according to De Anima iii, 6. Wherefore the intellect attains
   perfection, in so far as it knows the essence of a thing. If therefore
   an intellect knows the essence of some effect, whereby it is not
   possible to know the essence of the cause, i.e. to know of the cause
   "what it is"; that intellect cannot be said to reach that cause simply,
   although it may be able to gather from the effect the knowledge of that
   the cause is. Consequently, when man knows an effect, and knows that it
   has a cause, there naturally remains in the man the desire to know
   about the cause, "what it is." And this desire is one of wonder, and
   causes inquiry, as is stated in the beginning of the Metaphysics (i,
   2). For instance, if a man, knowing the eclipse of the sun, consider
   that it must be due to some cause, and know not what that cause is, he
   wonders about it, and from wondering proceeds to inquire. Nor does this
   inquiry cease until he arrive at a knowledge of the essence of the
   cause.

   If therefore the human intellect, knowing the essence of some created
   effect, knows no more of God than "that He is"; the perfection of that
   intellect does not yet reach simply the First Cause, but there remains
   in it the natural desire to seek the cause. Wherefore it is not yet
   perfectly happy. Consequently, for perfect happiness the intellect
   needs to reach the very Essence of the First Cause. And thus it will
   have its perfection through union with God as with that object, in
   which alone man's happiness consists, as stated above ([1013]AA[1],7;
   Q[2], A[8]).

   Reply to Objection 1: Dionysius speaks of the knowledge of wayfarers
   journeying towards happiness.

   Reply to Objection 2: As stated above ([1014]Q[1], A[8]), the end has a
   twofold acceptation. First, as to the thing itself which is desired:
   and in this way, the same thing is the end of the higher and of the
   lower nature, and indeed of all things, as stated above ([1015]Q[1],
   A[8]). Secondly, as to the attainment of this thing; and thus the end
   of the higher nature is different from that of the lower, according to
   their respective habitudes to that thing. So then in the happiness of
   God, Who, in understanding his Essence, comprehends It, is higher than
   that of a man or angel who sees It indeed, but comprehends It not.
     __________________________________________________________________

  OF THOSE THINGS THAT ARE REQUIRED FOR HAPPINESS (EIGHT ARTICLES)

   We have now to consider those things that are required for happiness:
   and concerning this there are eight points of inquiry:

   (1) Whether delight is required for happiness?

   (2) Which is of greater account in happiness, delight or vision?

   (3) Whether comprehension is required?

   (4) Whether rectitude of the will is required?

   (5) Whether the body is necessary for man's happiness?

   (6) Whether any perfection of the body is necessary?

   (7) Whether any external goods are necessary?

   (8) Whether the fellowship of friends is necessary?
     __________________________________________________________________

    Whether delight is required for happiness?

   Objection 1: It would seem that delight is not required for happiness.
   For Augustine says (De Trin. i, 8) that "vision is the entire reward of
   faith." But the prize or reward of virtue is happiness, as the
   Philosopher clearly states (Ethic. i, 9). Therefore nothing besides
   vision is required for happiness.

   Objection 2: Further, happiness is "the most self-sufficient of all
   goods," as the Philosopher declares (Ethic. i, 7). But that which needs
   something else is not self-sufficient. Since then the essence of
   happiness consists in seeing God, as stated above ([1016]Q[3], A[8]);
   it seems that delight is not necessary for happiness.

   Objection 3: Further, the "operation of bliss or happiness should be
   unhindered" (Ethic. vii, 13). But delight hinders the operation of the
   intellect: since it destroys the estimate of prudence (Ethic. vi, 5).
   Therefore delight is not necessary for happiness.

   On the contrary, Augustine says (Confess. x, 23) that happiness is "joy
   in truth."

   I answer that, One thing may be necessary for another in four ways.
   First, as a preamble and preparation to it: thus instruction is
   necessary for science. Secondly, as perfecting it: thus the soul is
   necessary for the life of the body. Thirdly, as helping it from
   without: thus friends are necessary for some undertaking. Fourthly, as
   something attendant on it: thus we might say that heat is necessary for
   fire. And in this way delight is necessary for happiness. For it is
   caused by the appetite being at rest in the good attained. Wherefore,
   since happiness is nothing else but the attainment of the Sovereign
   Good, it cannot be without concomitant delight.

   Reply to Objection 1: From the very fact that a reward is given to
   anyone, the will of him who deserves it is at rest, and in this
   consists delight. Consequently, delight is included in the very notion
   of reward.

   Reply to Objection 2: The very sight of God causes delight.
   Consequently, he who sees God cannot need delight.

   Reply to Objection 3: Delight that is attendant upon the operation of
   the intellect does not hinder it, rather does it perfect it, as stated
   in Ethic. x, 4: since what we do with delight, we do with greater care
   and perseverance. On the other hand, delight which is extraneous to the
   operation is a hindrance thereto: sometimes by distracting the
   attention because, as already observed, we are more attentive to those
   things that delight us; and when we are very attentive to one thing, we
   must needs be less attentive to another: sometimes on account of
   opposition; thus a sensual delight that is contrary to reason, hinders
   the estimate of prudence more than it hinders the estimate of the
   speculative intellect.
     __________________________________________________________________

    Whether in happiness vision ranks before delight?

   Objection 1: It would seem that in happiness, delight ranks before
   vision. For "delight is the perfection of operation" (Ethic. x, 4). But
   perfection ranks before the thing perfected. Therefore delight ranks
   before the operation of the intellect, i.e. vision.

   Objection 2: Further, that by reason of which a thing is desirable, is
   yet more desirable. But operations are desired on account of the
   delight they afford: hence, too, nature has adjusted delight to those
   operations which are necessary for the preservation of the individual
   and of the species, lest animals should disregard such operations.
   Therefore, in happiness, delight ranks before the operation of the
   intellect, which is vision.

   Objection 3: Further, vision corresponds to faith; while delight or
   enjoyment corresponds to charity. But charity ranks before faith, as
   the Apostle says (1 Cor. 13:13). Therefore delight or enjoyment ranks
   before vision.

   On the contrary, The cause is greater than its effect. But vision is
   the cause of delight. Therefore vision ranks before delight.

   I answer that, The Philosopher discusses this question (Ethic. x, 4),
   and leaves it unsolved. But if one consider the matter carefully, the
   operation of the intellect which is vision, must needs rank before
   delight. For delight consists in a certain repose of the will. Now that
   the will finds rest in anything, can only be on account of the goodness
   of that thing in which it reposes. If therefore the will reposes in an
   operation, the will's repose is caused by the goodness of the
   operation. Nor does the will seek good for the sake of repose; for thus
   the very act of the will would be the end, which has been disproved
   above ([1017]Q[1], A[1], ad 2;[1018] Q[3], A[4]): but it seeks to be at
   rest in the operation, because that operation is its good. Consequently
   it is evident that the operation in which the will reposes ranks before
   the resting of the will therein.

   Reply to Objection 1: As the Philosopher says (Ethic. x, 4) "delight
   perfects operation as vigor perfects youth," because it is a result of
   youth. Consequently delight is a perfection attendant upon vision; but
   not a perfection whereby vision is made perfect in its own species.

   Reply to Objection 2: The apprehension of the senses does not attain to
   the universal good, but to some particular good which is delightful.
   And consequently, according to the sensitive appetite which is in
   animals, operations are sought for the sake of delight. But the
   intellect apprehends the universal good, the attainment of which
   results in delight: wherefore its purpose is directed to good rather
   than to delight. Hence it is that the Divine intellect, which is the
   Author of nature, adjusted delights to operations on account of the
   operations. And we should form our estimate of things not simply
   according to the order of the sensitive appetite, but rather according
   to the order of the intellectual appetite.

   Reply to Objection 3: Charity does not seem the beloved good for the
   sake of delight: it is for charity a consequence that it delights in
   the good gained which it loves. Thus delight does not answer to charity
   as its end, but vision does, whereby the end is first made present to
   charity.
     __________________________________________________________________

    Whether comprehension is necessary for happiness?

   Objection 1: It would seem that comprehension is not necessary for
   happiness. For Augustine says (Ad Paulinam de Videndo Deum; [*Cf. Serm.
   xxxciii De Verb. Dom.]): "To reach God with the mind is happiness, to
   comprehend Him is impossible." Therefore happiness is without
   comprehension.

   Objection 2: Further, happiness is the perfection of man as to his
   intellective part, wherein there are no other powers than the intellect
   and will, as stated in the FP, QQ[79] and following. But the intellect
   is sufficiently perfected by seeing God, and the will by enjoying Him.
   Therefore there is no need for comprehension as a third.

   Objection 3: Further, happiness consists in an operation. But
   operations are determined by their objects: and there are two universal
   objects, the true and the good: of which the true corresponds to
   vision, and good to delight. Therefore there is no need for
   comprehension as a third.

   On the contrary, The Apostle says (1 Cor. 9:24): "So run that you may
   comprehend [Douay: 'obtain']." But happiness is the goal of the
   spiritual race: hence he says (2 Tim. 4:7,8): "I have fought a good
   fight, I have finished my course, I have kept the faith; as to the rest
   there is laid up for me a crown of justice." Therefore comprehension is
   necessary for Happiness.

   I answer that, Since Happiness consists in gaining the last end, those
   things that are required for Happiness must be gathered from the way in
   which man is ordered to an end. Now man is ordered to an intelligible
   end partly through his intellect, and partly through his will: through
   his intellect, in so far as a certain imperfect knowledge of the end
   pre-exists in the intellect: through the will, first by love which is
   the will's first movement towards anything; secondly, by a real
   relation of the lover to the thing beloved, which relation may be
   threefold. For sometimes the thing beloved is present to the lover: and
   then it is no longer sought for. Sometimes it is not present, and it is
   impossible to attain it: and then, too, it is not sought for. But
   sometimes it is possible to attain it, yet it is raised above the
   capability of the attainer, so that he cannot have it forthwith; and
   this is the relation of one that hopes, to that which he hopes for, and
   this relation alone causes a search for the end. To these three, there
   are a corresponding three in Happiness itself. For perfect knowledge of
   the end corresponds to imperfect knowledge; presence of the end
   corresponds to the relation of hope; but delight in the end now present
   results from love, as already stated (A[2], ad 3). And therefore these
   three must concur with Happiness; to wit, vision, which is perfect
   knowledge of the intelligible end; comprehension, which implies
   presence of the end; and delight or enjoyment, which implies repose of
   the lover in the object beloved.

   Reply to Objection 1: Comprehension is twofold. First, inclusion of the
   comprehended in the comprehensor; and thus whatever is comprehended by
   the finite, is itself finite. Wherefore God cannot be thus comprehended
   by a created intellect. Secondly, comprehension means nothing but the
   holding of something already present and possessed: thus one who runs
   after another is said to comprehend [*In English we should say
   'catch.'] him when he lays hold on him. And in this sense comprehension
   is necessary for Happiness.

   Reply to Objection 2: Just as hope and love pertain to the will,
   because it is the same one that loves a thing, and that tends towards
   it while not possessed, so, too, comprehension and delight belong to
   the will, since it is the same that possesses a thing and reposes
   therein.

   Reply to Objection 3: Comprehension is not a distinct operation from
   vision; but a certain relation to the end already gained. Wherefore
   even vision itself, or the thing seen, inasmuch as it is present, is
   the object of comprehension.
     __________________________________________________________________

    Whether rectitude of the will is necessary for happiness?

   Objection 1: It would seem that rectitude of the will is not necessary
   for Happiness. For Happiness consists essentially in an operation of
   the intellect, as stated above ([1019]Q[3], A[4]). But rectitude of the
   will, by reason of which men are said to be clean of heart, is not
   necessary for the perfect operation of the intellect: for Augustine
   says (Retract. i, 4) "I do not approve of what I said in a prayer: O
   God, Who didst will none but the clean of heart to know the truth. For
   it can be answered that many who are not clean of heart, know many
   truths." Therefore rectitude of the will is not necessary for
   Happiness.

   Objection 2: Further, what precedes does not depend on what follows.
   But the operation of the intellect precedes the operation of the will.
   Therefore Happiness, which is the perfect operation of the intellect,
   does not depend on rectitude of the will.

   Objection 3: Further, that which is ordained to another as its end, is
   not necessary, when the end is already gained; as a ship, for instance,
   after arrival in port. But rectitude of will, which is by reason of
   virtue, is ordained to Happiness as to its end. Therefore, Happiness
   once obtained, rectitude of the will is no longer necessary.

   On the contrary, It is written (Mat. 5:8): "Blessed are the clean of
   heart; for they shall see God": and (Heb. 12:14): "Follow peace with
   all men, and holiness; without which no man shall see God."

   I answer that, Rectitude of will is necessary for Happiness both
   antecedently and concomitantly. Antecedently, because rectitude of the
   will consists in being duly ordered to the last end. Now the end in
   comparison to what is ordained to the end is as form compared to
   matter. Wherefore, just as matter cannot receive a form, unless it be
   duly disposed thereto, so nothing gains an end, except it be duly
   ordained thereto. And therefore none can obtain Happiness, without
   rectitude of the will. Concomitantly, because as stated above
   ([1020]Q[3], A[8]), final Happiness consists in the vision of the
   Divine Essence, Which is the very essence of goodness. So that the will
   of him who sees the Essence of God, of necessity, loves, whatever he
   loves, in subordination to God; just as the will of him who sees not
   God's Essence, of necessity, loves whatever he loves, under the common
   notion of good which he knows. And this is precisely what makes the
   will right. Wherefore it is evident that Happiness cannot be without a
   right will.

   Reply to Objection 2: Every act of the will is preceded by an act of
   the intellect: but a certain act of the will precedes a certain act of
   the intellect. For the will tends to the final act of the intellect
   which is happiness. And consequently right inclination of the will is
   required antecedently for happiness, just as the arrow must take a
   right course in order to strike the target.

   Reply to Objection 3: Not everything that is ordained to the end,
   ceases with the getting of the end: but only that which involves
   imperfection, such as movement. Hence the instruments of movement are
   no longer necessary when the end has been gained: but the due order to
   the end is necessary.
     __________________________________________________________________

    Whether the body is necessary for man's happiness?

   Objection 1: It would seem that the body is necessary for Happiness.
   For the perfection of virtue and grace presupposes the perfection of
   nature. But Happiness is the perfection of virtue and grace. Now the
   soul, without the body, has not the perfection of nature; since it is
   naturally a part of human nature, and every part is imperfect while
   separated from its whole. Therefore the soul cannot be happy without
   the body.

   Objection 2: Further, Happiness is a perfect operation, as stated above
   ([1021]Q[3], AA[2],5). But perfect operation follows perfect being:
   since nothing operates except in so far as it is an actual being.
   Since, therefore, the soul has not perfect being, while it is separated
   from the body, just as neither has a part, while separate from its
   whole; it seems that the soul cannot be happy without the body.

   Objection 3: Further, Happiness is the perfection of man. But the soul,
   without the body, is not man. Therefore Happiness cannot be in the soul
   separated from the body.

   Objection 4: Further, according to the Philosopher (Ethic. vii, 13)
   "the operation of bliss," in which operation happiness consists, is
   "not hindered." But the operation of the separate soul is hindered;
   because, as Augustine says (Gen. ad lit. xii, 35), the soul "has a
   natural desire to rule the body, the result of which is that it is held
   back, so to speak, from tending with all its might to the heavenward
   journey," i.e. to the vision of the Divine Essence. Therefore the soul
   cannot be happy without the body.

   Objection 5: Further, Happiness is the sufficient good and lulls
   desire. But this cannot be said of the separated soul; for it yet
   desires to be united to the body, as Augustine says (Gen. ad lit. xii,
   35). Therefore the soul is not happy while separated from the body.

   Objection 6: Further, in Happiness man is equal to the angels. But the
   soul without the body is not equal to the angels, as Augustine says
   (Gen. ad lit. xii, 35). Therefore it is not happy.

   On the contrary, It is written (Apoc. 14:13): "Happy [Douay: 'blessed']
   are the dead who die in the Lord."

   I answer that, Happiness is twofold; the one is imperfect and is had in
   this life; the other is perfect, consisting in the vision of God. Now
   it is evident that the body is necessary for the happiness of this
   life. For the happiness of this life consists in an operation of the
   intellect, either speculative or practical. And the operation of the
   intellect in this life cannot be without a phantasm, which is only in a
   bodily organ, as was shown in the [1022]FP, Q[84], AA[6],7.
   Consequently that happiness which can be had in this life, depends, in
   a way, on the body. But as to perfect Happiness, which consists in the
   vision of God, some have maintained that it is not possible to the soul
   separated from the body; and have said that the souls of saints, when
   separated from their bodies, do not attain to that Happiness until the
   Day of Judgment, when they will receive their bodies back again. And
   this is shown to be false, both by authority and by reason. By
   authority, since the Apostle says (2 Cor. 5:6): "While we are in the
   body, we are absent from the Lord"; and he points out the reason of
   this absence, saying: "For we walk by faith and not by sight." Now from
   this it is clear that so long as we walk by faith and not by sight,
   bereft of the vision of the Divine Essence, we are not present to the
   Lord. But the souls of the saints, separated from their bodies, are in
   God's presence; wherefore the text continues: "But we are confident and
   have a good will to be absent . . . from the body, and to be present
   with the Lord." Whence it is evident that the souls of the saints,
   separated from their bodies, "walk by sight," seeing the Essence of
   God, wherein is true Happiness.

   Again this is made clear by reason. For the intellect needs not the
   body, for its operation, save on account of the phantasms, wherein it
   looks on the intelligible truth, as stated in the [1023]FP, Q[84],
   A[7]. Now it is evident that the Divine Essence cannot be seen by means
   of phantasms, as stated in the [1024]FP, Q[12], A[3]. Wherefore, since
   man's perfect Happiness consists in the vision of the Divine Essence,
   it does not depend on the body. Consequently, without the body the soul
   can be happy.

   We must, however, notice that something may belong to a thing's
   perfection in two ways. First, as constituting the essence thereof;
   thus the soul is necessary for man's perfection. Secondly, as necessary
   for its well-being: thus, beauty of body and keenness of perfection
   belong to man's perfection. Wherefore though the body does not belong
   in the first way to the perfection of human Happiness, yet it does in
   the second way. For since operation depends on a thing's nature, the
   more perfect is the soul in its nature, the more perfectly it has its
   proper operation, wherein its happiness consists. Hence, Augustine,
   after inquiring (Gen. ad lit. xii, 35) "whether that perfect Happiness
   can be ascribed to the souls of the dead separated from their bodies,"
   answers "that they cannot see the Unchangeable Substance, as the
   blessed angels see It; either for some other more hidden reason, or
   because they have a natural desire to rule the body."

   Reply to Objection 1: Happiness is the perfection of the soul on the
   part of the intellect, in respect of which the soul transcends the
   organs of the body; but not according as the soul is the natural form
   of the body. Wherefore the soul retains that natural perfection in
   respect of which happiness is due to it, though it does not retain that
   natural perfection in respect of which it is the form of the body.

   Reply to Objection 2: The relation of the soul to being is not the same
   as that of other parts: for the being of the whole is not that of any
   individual part: wherefore, either the part ceases altogether to be,
   when the whole is destroyed, just as the parts of an animal, when the
   animal is destroyed; or, if they remain, they have another actual
   being, just as a part of a line has another being from that of the
   whole line. But the human soul retains the being of the composite after
   the destruction of the body: and this because the being of the form is
   the same as that of its matter, and this is the being of the composite.
   Now the soul subsists in its own being, as stated in the [1025]FP,
   Q[75], A[2]. It follows, therefore, that after being separated from the
   body it has perfect being and that consequently it can have a perfect
   operation; although it has not the perfect specific nature.

   Reply to Objection 3: Happiness belongs to man in respect of his
   intellect: and, therefore, since the intellect remains, it can have
   Happiness. Thus the teeth of an Ethiopian, in respect of which he is
   said to be white, can retain their whiteness, even after extraction.

   Reply to Objection 4: One thing is hindered by another in two ways.
   First, by way of opposition; thus cold hinders the action of heat: and
   such a hindrance to operation is repugnant to Happiness. Secondly, by
   way of some kind of defect, because, to wit, that which is hindered has
   not all that is necessary to make it perfect in every way: and such a
   hindrance to operation is not incompatible with Happiness, but prevents
   it from being perfect in every way. And thus it is that separation from
   the body is said to hold the soul back from tending with all its might
   to the vision of the Divine Essence. For the soul desires to enjoy God
   in such a way that the enjoyment also may overflow into the body, as
   far as possible. And therefore, as long as it enjoys God, without the
   fellowship of the body, its appetite is at rest in that which it has,
   in such a way, that it would still wish the body to attain to its
   share.

   Reply to Objection 5: The desire of the separated soul is entirely at
   rest, as regards the thing desired; since, to wit, it has that which
   suffices its appetite. But it is not wholly at rest, as regards the
   desirer, since it does not possess that good in every way that it would
   wish to possess it. Consequently, after the body has been resumed,
   Happiness increases not in intensity, but in extent.

   Reply to Objection 6: The statement made (Gen. ad lit. xii, 35) to the
   effect that "the souls of the departed see not God as the angels do,"
   is not to be understood as referring to inequality of quantity; because
   even now some souls of the Blessed are raised to the higher orders of
   the angels, thus seeing God more clearly than the lower angels. But it
   refers to inequality of proportion: because the angels, even the
   lowest, have every perfection of Happiness that they ever will have,
   whereas the separated souls of the saints have not.
     __________________________________________________________________

    Whether perfection of the body is necessary for happiness?

   Objection 1: It would seem that perfection of the body is not necessary
   for man's perfect Happiness. For perfection of the body is a bodily
   good. But it has been shown above ([1026]Q[2]) that Happiness does not
   consist in bodily goods. Therefore no perfect disposition of the body
   is necessary for man's Happiness.

   Objection 2: Further, man's Happiness consists in the vision of the
   Divine Essence, as shown above (Q[3], A[8]). But the body has not part
   in this operation, as shown above [1027](A[5]). Therefore no
   disposition of the body is necessary for Happiness.

   Objection 3: Further, the more the intellect is abstracted from the
   body, the more perfectly it understands. But Happiness consists in the
   most perfect operation of the intellect. Therefore the soul should be
   abstracted from the body in every way. Therefore, in no way is a
   disposition of the body necessary for Happiness.

   On the contrary, Happiness is the reward of virtue; wherefore it is
   written (Jn. 13:17): "You shall be blessed, if you do them." But the
   reward promised to the saints is not only that they shall see and enjoy
   God, but also that their bodies shall be well-disposed; for it is
   written (Is. 66:14): "You shall see and your heart shall rejoice, and
   your bones shall flourish like a herb." Therefore good disposition of
   the body is necessary for Happiness.

   I answer that, If we speak of that happiness which man can acquire in
   this life, it is evident that a well-disposed body is of necessity
   required for it. For this happiness consists, according to the
   Philosopher (Ethic. i, 13) in "an operation according to perfect
   virtue"; and it is clear that man can be hindered, by indisposition of
   the body, from every operation of virtue.

   But speaking of perfect Happiness, some have maintained that no
   disposition of body is necessary for Happiness; indeed, that it is
   necessary for the soul to be entirely separated from the body. Hence
   Augustine (De Civ. Dei xxii, 26) quotes the words of Porphyry who said
   that "for the soul to be happy, it must be severed from everything
   corporeal." But this is unreasonable. For since it is natural to the
   soul to be united to the body; it is not possible for the perfection of
   the soul to exclude its natural perfection.

   Consequently, we must say that perfect disposition of the body is
   necessary, both antecedently and consequently, for that Happiness which
   is in all ways perfect. Antecedently, because, as Augustine says (Gen.
   ad lit. xii, 35), "if body be such, that the governance thereof is
   difficult and burdensome, like unto flesh which is corruptible and
   weighs upon the soul, the mind is turned away from that vision of the
   highest heaven." Whence he concludes that, "when this body will no
   longer be 'natural,' but 'spiritual,' then will it be equalled to the
   angels, and that will be its glory, which erstwhile was its burden."
   Consequently, because from the Happiness of the soul there will be an
   overflow on to the body, so that this too will obtain its perfection.
   Hence Augustine says (Ep. ad Dioscor.) that "God gave the soul such a
   powerful nature that from its exceeding fulness of happiness the vigor
   of incorruption overflows into the lower nature."

   Reply to Objection 1: Happiness does not consist in bodily good as its
   object: but bodily good can add a certain charm and perfection to
   Happiness.

   Reply to Objection 2: Although the body has not part in that operation
   of the intellect whereby the Essence of God is seen, yet it might prove
   a hindrance thereto. Consequently, perfection of the body is necessary,
   lest it hinder the mind from being lifted up.

   Reply to Objection 3: The perfect operation of the intellect requires
   indeed that the intellect be abstracted from this corruptible body
   which weighs upon the soul; but not from the spiritual body, which will
   be wholly subject to the spirit. On this point we shall treat in the
   Third Part of this work (SS, Q[82], seqq.).
     __________________________________________________________________

    Whether any external goods are necessary for happiness?

   Objection 1: It would seem that external goods also are necessary for
   Happiness. For that which is promised the saints for reward, belongs to
   Happiness. But external goods are promised the saints; for instance,
   food and drink, wealth and a kingdom: for it is said (Lk. 22:30): "That
   you may eat and drink at My table in My kingdom": and (Mat. 6:20): "Lay
   up to yourselves treasures in heaven": and (Mat. 25:34): "Come, ye
   blessed of My Father, possess you the kingdom." Therefore external
   goods are necessary for Happiness.

   Objection 2: Further, according to Boethius (De Consol. iii): happiness
   is "a state made perfect by the aggregate of all good things." But some
   of man's goods are external, although they be of least account, as
   Augustine says (De Lib. Arb. ii, 19). Therefore they too are necessary
   for Happiness.

   Objection 3: Further, Our Lord said (Mat. 5:12): "Your reward is very
   great in heaven." But to be in heaven implies being in a place.
   Therefore at least external place is necessary for Happiness.

   On the contrary, It is written (Ps. 72:25): "For what have I in heaven?
   and besides Thee what do I desire upon earth?" As though to say: "I
   desire nothing but this,"---"It is good for me to adhere to my God."
   Therefore nothing further external is necessary for Happiness.

   I answer that, For imperfect happiness, such as can be had in this
   life, external goods are necessary, not as belonging to the essence of
   happiness, but by serving as instruments to happiness, which consists
   in an operation of virtue, as stated in Ethic. i, 13. For man needs in
   this life, the necessaries of the body, both for the operation of
   contemplative virtue, and for the operation of active virtue, for which
   latter he needs also many other things by means of which to perform its
   operations.

   On the other hand, such goods as these are nowise necessary for perfect
   Happiness, which consists in seeing God. The reason of this is that all
   suchlike external goods are requisite either for the support of the
   animal body; or for certain operations which belong to human life,
   which we perform by means of the animal body: whereas that perfect
   Happiness which consists in seeing God, will be either in the soul
   separated from the body, or in the soul united to the body then no
   longer animal but spiritual. Consequently these external goods are
   nowise necessary for that Happiness, since they are ordained to the
   animal life. And since, in this life, the felicity of contemplation, as
   being more Godlike, approaches nearer than that of action to the
   likeness of that perfect Happiness, therefore it stands in less need of
   these goods of the body as stated in Ethic. x, 8.

   Reply to Objection 1: All those material promises contained in Holy
   Scripture, are to be understood metaphorically, inasmuch as Scripture
   is wont to express spiritual things under the form of things corporeal,
   in order "that from things we know, we may rise to the desire of things
   unknown," as Gregory says (Hom. xi in Evang.). Thus food and drink
   signify the delight of Happiness; wealth, the sufficiency of God for
   man; the kingdom, the lifting up of man to union of God.

   Reply to Objection 2: These goods that serve for the animal life, are
   incompatible with that spiritual life wherein perfect Happiness
   consists. Nevertheless in that Happiness there will be the aggregate of
   all good things, because whatever good there be in these things, we
   shall possess it all in the Supreme Fount of goodness.

   Reply to Objection 3: According to Augustine (De Serm. Dom. in Monte i,
   5), it is not material heaven that is described as the reward of the
   saints, but a heaven raised on the height of spiritual goods.
   Nevertheless a bodily place, viz. the empyrean heaven, will be
   appointed to the Blessed, not as a need of Happiness, but by reason of
   a certain fitness and adornment.
     __________________________________________________________________

    Whether the fellowship of friend is necessary for happiness?

   Objection 1: It would seem that friends are necessary for Happiness.
   For future Happiness is frequently designated by Scripture under the
   name of "glory." But glory consists in man's good being brought to the
   notice of many. Therefore the fellowship of friends is necessary for
   Happiness.

   Objection 2: Further, Boethius [*Seneca, Ep. 6] says that "there is no
   delight in possessing any good whatever, without someone to share it
   with us." But delight is necessary for Happiness. Therefore fellowship
   of friends is also necessary.

   Objection 3: Further, charity is perfected in Happiness. But charity
   includes the love of God and of our neighbor. Therefore it seems that
   fellowship of friends is necessary for Happiness.

   On the contrary, It is written (Wis. 7:11): "All good things came to me
   together with her," i.e. with divine wisdom, which consists in
   contemplating God. Consequently nothing else is necessary for
   Happiness.

   I answer that, If we speak of the happiness of this life, the happy man
   needs friends, as the Philosopher says (Ethic. ix, 9), not, indeed, to
   make use of them, since he suffices himself; nor to delight in them,
   since he possesses perfect delight in the operation of virtue; but for
   the purpose of a good operation, viz. that he may do good to them; that
   he may delight in seeing them do good; and again that he may be helped
   by them in his good work. For in order that man may do well, whether in
   the works of the active life, or in those of the contemplative life, he
   needs the fellowship of friends.

   But if we speak of perfect Happiness which will be in our heavenly
   Fatherland, the fellowship of friends is not essential to Happiness;
   since man has the entire fulness of his perfection in God. But the
   fellowship of friends conduces to the well-being of Happiness. Hence
   Augustine says (Gen. ad lit. viii, 25) that "the spiritual creatures
   receive no other interior aid to happiness than the eternity, truth,
   and charity of the Creator. But if they can be said to be helped from
   without, perhaps it is only by this that they see one another and
   rejoice in God, at their fellowship."

   Reply to Objection 1: That glory which is essential to Happiness, is
   that which man has, not with man but with God.

   Reply to Objection 2: This saying is to be understood of the possession
   of good that does not fully satisfy. This does not apply to the
   question under consideration; because man possesses in God a
   sufficiency of every good.

   Reply to Objection 3: Perfection of charity is essential to Happiness,
   as to the love of God, but not as to the love of our neighbor.
   Wherefore if there were but one soul enjoying God, it would be happy,
   though having no neighbor to love. But supposing one neighbor to be
   there, love of him results from perfect love of God. Consequently,
   friendship is, as it were, concomitant with perfect Happiness.
     __________________________________________________________________

  OF THE ATTAINMENT OF HAPPINESS (EIGHT ARTICLES)

   We must now consider the attainment of Happiness. Under this heading
   there are eight points of inquiry:

   (1) Whether man can attain Happiness?

   (2) Whether one man can be happier than another?

   (3) Whether any man can be happy in this life?

   (4) Whether Happiness once had can be lost?

   (5) Whether man can attain Happiness by means of his natural powers?

   (6) Whether man attains Happiness through the action of some higher
   creature?

   (7) Whether any actions of man are necessary in order that man may
   obtain Happiness of God?

   (8) Whether every man desires Happiness?
     __________________________________________________________________

    Whether man can attain happiness?

   Objection 1: It would seem that man cannot attain happiness. For just
   as the rational is above the sensible nature, so the intellectual is
   above the rational, as Dionysius declares (Div. Nom. iv, vi, vii) in
   several passages. But irrational animals that have the sensitive nature
   only, cannot attain the end of the rational nature. Therefore neither
   can man, who is of rational nature, attain the end of the intellectual
   nature, which is Happiness.

   Objection 2: Further, True Happiness consists in seeing God, Who is
   pure Truth. But from his very nature, man considers truth in material
   things: wherefore "he understands the intelligible species in the
   phantasm" (De Anima iii, 7). Therefore he cannot attain Happiness.

   Objection 3: Further, Happiness consists in attaining the Sovereign
   Good. But we cannot arrive at the top without surmounting the middle.
   Since, therefore, the angelic nature through which man cannot mount is
   midway between God and human nature; it seems that he cannot attain
   Happiness.

   On the contrary, It is written (Ps. 93:12): "Blessed is the man whom
   Thou shalt instruct, O Lord."

   I answer that, Happiness is the attainment of the Perfect Good.
   Whoever, therefore, is capable of the Perfect Good can attain
   Happiness. Now, that man is capable of the Perfect Good, is proved both
   because his intellect can apprehend the universal and perfect good, and
   because his will can desire it. And therefore man can attain Happiness.
   This can be proved again from the fact that man is capable of seeing
   God, as stated in [1028]FP, Q[12], A[1]: in which vision, as we stated
   above (Q[3], A[8]) man's perfect Happiness consists.

   Reply to Objection 1: The rational exceeds the sensitive nature,
   otherwise than the intellectual surpasses the rational. For the
   rational exceeds the sensitive nature in respect of the object of its
   knowledge: since the senses have no knowledge whatever of the
   universal, whereas the reason has knowledge thereof. But the
   intellectual surpasses the rational nature, as to the mode of knowing
   the same intelligible truth: for the intellectual nature grasps
   forthwith the truth which the rational nature reaches by the inquiry of
   reason, as was made clear in the [1029]FP, Q[58], A[3]; [1030]FP,
   Q[79], A[8]. Therefore reason arrives by a kind of movement at that
   which the intellect grasps. Consequently the rational nature can attain
   Happiness, which is the perfection of the intellectual nature: but
   otherwise than the angels. Because the angels attained it forthwith
   after the beginning of their creation: whereas man attains if after a
   time. But the sensitive nature can nowise attain this end.

   Reply to Objection 2: To man in the present state of life the natural
   way of knowing intelligible truth is by means of phantasms. But after
   this state of life, he has another natural way, as was stated in the
   [1031]FP, Q[84], A[7] ; [1032]FP, Q[89], A[1].

   Reply to Objection 3: Man cannot surmount the angels in the degree of
   nature so as to be above them naturally. But he can surmount them by an
   operation of the intellect, by understanding that there is above the
   angels something that makes men happy; and when he has attained it, he
   will be perfectly happy.
     __________________________________________________________________

    Whether one man can be happier than another?

   Objection 1: It would seem that one man cannot be happier than another.
   For Happiness is "the reward of virtue," as the Philosopher says
   (Ethic. i, 9). But equal reward is given for all the works of virtue;
   because it is written (Mat. 20:10) that all who labor in the vineyard
   "received every man a penny"; for, as Gregory says (Hom. xix in
   Evang.), "each was equally rewarded with eternal life." Therefore one
   man cannot be happier than another.

   Objection 2: Further, Happiness is the supreme good. But nothing can
   surpass the supreme. Therefore one man's Happiness cannot be surpassed
   by another's.

   Objection 3: Further, since Happiness is "the perfect and sufficient
   good" (Ethic. i, 7) it brings rest to man's desire. But his desire is
   not at rest, if he yet lacks some good that can be got. And if he lack
   nothing that he can get, there can be no still greater good. Therefore
   either man is not happy; or, if he be happy, no other Happiness can be
   greater.

   On the contrary, It is written (Jn. 14:2): "In My Father's house there
   are many mansions"; which, according to Augustine (Tract. lxvii in
   Joan.) signify "the diverse dignities of merits in the one eternal
   life." But the dignity of eternal life which is given according to
   merit, is Happiness itself. Therefore there are diverse degrees of
   Happiness, and Happiness is not equally in all.

   I answer that, As stated above ([1033]Q[1], A[8];[1034] Q[2], A[7]),
   Happiness implies two things, to wit, the last end itself, i.e. the
   Sovereign Good; and the attainment or enjoyment of that same Good. As
   to that Good itself, Which is the object and cause of Happiness, one
   Happiness cannot be greater than another, since there is but one
   Sovereign Good, namely, God, by enjoying Whom, men are made happy. But
   as to the attainment or enjoyment of this Good, one man can be happier
   than another; because the more a man enjoys this Good the happier he
   is. Now, that one man enjoys God more than another, happens through his
   being better disposed or ordered to the enjoyment of Him. And in this
   sense one man can be happier than another.

   Reply to Objection 1: The one penny signifies that Happiness is one in
   its object. But the many mansions signify the manifold Happiness in the
   divers degrees of enjoyment.

   Reply to Objection 2: Happiness is said to be the supreme good,
   inasmuch as it is the perfect possession or enjoyment of the Supreme
   Good.

   Reply to Objection 3: None of the Blessed lacks any desirable good;
   since they have the Infinite Good Itself, Which is "the good of all
   good," as Augustine says (Enarr. in Ps. 134). But one is said to be
   happier than another, by reason of diverse participation of the same
   good. And the addition of other goods does not increase Happiness,
   since Augustine says (Confess. v, 4): "He who knows Thee, and others
   besides, is not the happier for knowing them, but is happy for knowing
   Thee alone."
     __________________________________________________________________

    Whether one can be happy in this life?

   Objection 1: It would seem that Happiness can be had in this life. For
   it is written (Ps. 118:1): "Blessed are the undefiled in the way, who
   walk in the law of the Lord." But this happens in this life. Therefore
   one can be happy in this life.

   Objection 2: Further, imperfect participation in the Sovereign Good
   does not destroy the nature of Happiness, otherwise one would not be
   happier than another. But men can participate in the Sovereign Good in
   this life, by knowing and loving God, albeit imperfectly. Therefore man
   can be happy in this life.

   Objection 3: Further, what is said by many cannot be altogether false:
   since what is in many, comes, apparently, from nature; and nature does
   not fail altogether. Now many say that Happiness can be had in this
   life, as appears from Ps. 143:15: "They have called the people happy
   that hath these things," to wit, the good things in this life.
   Therefore one can be happy in this life.

   On the contrary, It is written (Job 14:1): "Man born of a woman, living
   for a short time, is filled with many miseries." But Happiness excludes
   misery. Therefore man cannot be happy in this life.

   I answer that, A certain participation of Happiness can be had in this
   life: but perfect and true Happiness cannot be had in this life. This
   may be seen from a twofold consideration.

   First, from the general notion of happiness. For since happiness is a
   "perfect and sufficient good," it excludes every evil, and fulfils
   every desire. But in this life every evil cannot be excluded. For this
   present life is subject to many unavoidable evils; to ignorance on the
   part of the intellect; to inordinate affection on the part of the
   appetite, and to many penalties on the part of the body; as Augustine
   sets forth in De Civ. Dei xix, 4. Likewise neither can the desire for
   good be satiated in this life. For man naturally desires the good,
   which he has, to be abiding. Now the goods of the present life pass
   away; since life itself passes away, which we naturally desire to have,
   and would wish to hold abidingly, for man naturally shrinks from death.
   Wherefore it is impossible to have true Happiness in this life.

   Secondly, from a consideration of the specific nature of Happiness,
   viz. the vision of the Divine Essence, which man cannot obtain in this
   life, as was shown in the [1035]FP, Q[12], A[11]. Hence it is evident
   that none can attain true and perfect Happiness in this life.

   Reply to Objection 1: Some are said to be happy in this life, either on
   account of the hope of obtaining Happiness in the life to come,
   according to Rom. 8:24: "We are saved by hope"; or on account of a
   certain participation of Happiness, by reason of a kind of enjoyment of
   the Sovereign Good.

   Reply to Objection 2: The imperfection of participated Happiness is due
   to one of two causes. First, on the part of the object of Happiness,
   which is not seen in Its Essence: and this imperfection destroys the
   nature of true Happiness. Secondly, the imperfection may be on the part
   of the participator, who indeed attains the object of Happiness, in
   itself, namely, God: imperfectly, however, in comparison with the way
   in which God enjoys Himself. This imperfection does not destroy the
   true nature of Happiness; because, since Happiness is an operation, as
   stated above ([1036]Q[3], A[2]), the true nature of Happiness is taken
   from the object, which specifies the act, and not from the subject.

   Reply to Objection 3: Men esteem that there is some kind of happiness
   to be had in this life, on account of a certain likeness to true
   Happiness. And thus they do not fail altogether in their estimate.
     __________________________________________________________________

    Whether happiness once had can be lost?

   Objection 1: It would seem that Happiness can be lost. For Happiness is
   a perfection. But every perfection is in the thing perfected according
   to the mode of the latter. Since then man is, by his nature,
   changeable, it seems that Happiness is participated by man in a
   changeable manner. And consequently it seems that man can lose
   Happiness.

   Objection 2: Further, Happiness consists in an act of the intellect;
   and the intellect is subject to the will. But the will can be directed
   to opposites. Therefore it seems that it can desist from the operation
   whereby man is made happy: and thus man will cease to be happy.

   Objection 3: Further, the end corresponds to the beginning. But man's
   Happiness has a beginning, since man was not always happy. Therefore it
   seems that it has an end.

   On the contrary, It is written (Mat. 25:46) of the righteous that "they
   shall god . . . into life everlasting," which, as above stated
   [1037](A[2]), is the Happiness of the saints. Now what is eternal
   ceases not. Therefore Happiness cannot be lost.

   I answer that, If we speak of imperfect happiness, such as can be had
   in this life, in this sense it can be lost. This is clear of
   contemplative happiness, which is lost either by forgetfulness, for
   instance, when knowledge is lost through sickness; or again by certain
   occupations, whereby a man is altogether withdrawn from contemplation.

   This is also clear of active happiness: since man's will can be changed
   so as to fall to vice from the virtue, in whose act that happiness
   principally consists. If, however, the virtue remain unimpaired,
   outward changes can indeed disturb such like happiness, in so far as
   they hinder many acts of virtue; but they cannot take it away
   altogether because there still remains an act of virtue, whereby man
   bears these trials in a praiseworthy manner. And since the happiness of
   this life can be lost, a circumstance that appears to be contrary to
   the nature of happiness, therefore did the Philosopher state (Ethic. i,
   10) that some are happy in this life, not simply, but "as men," whose
   nature is subject to change.

   But if we speak of that perfect Happiness which we await after this
   life, it must be observed that Origen (Peri Archon. ii, 3), following
   the error of certain Platonists, held that man can become unhappy after
   the final Happiness.

   This, however, is evidently false, for two reasons. First, from the
   general notion of happiness. For since happiness is the "perfect and
   sufficient good," it must needs set man's desire at rest and exclude
   every evil. Now man naturally desires to hold to the good that he has,
   and to have the surety of his holding: else he must of necessity be
   troubled with the fear of losing it, or with the sorrow of knowing that
   he will lose it. Therefore it is necessary for true Happiness that man
   have the assured opinion of never losing the good that he possesses. If
   this opinion be true, it follows that he never will lose happiness: but
   if it be false, it is in itself an evil that he should have a false
   opinion: because the false is the evil of the intellect, just as the
   true is its good, as stated in Ethic. vi, 2. Consequently he will no
   longer be truly happy, if evil be in him.

   Secondly, it is again evident if we consider the specific nature of
   Happiness. For it has been shown above ([1038]Q[3], A[8]) that man's
   perfect Happiness consists in the vision of the Divine Essence. Now it
   is impossible for anyone seeing the Divine Essence, to wish not to see
   It. Because every good that one possesses and yet wishes to be without,
   is either insufficient, something more sufficing being desired in its
   stead; or else has some inconvenience attached to it, by reason of
   which it becomes wearisome. But the vision of the Divine Essence fills
   the soul with all good things, since it unites it to the source of all
   goodness; hence it is written (Ps. 16:15): "I shall be satisfied when
   Thy glory shall appear"; and (Wis. 7:11): "All good things came to me
   together with her," i.e. with the contemplation of wisdom. In like
   manner neither has it any inconvenience attached to it; because it is
   written of the contemplation of wisdom (Wis. 8:16): "Her conversation
   hath no bitterness, nor her company any tediousness." It is thus
   evident that the happy man cannot forsake Happiness of his own accord.
   Moreover, neither can he lose Happiness, through God taking it away
   from him. Because, since the withdrawal of Happiness is a punishment,
   it cannot be enforced by God, the just Judge, except for some fault;
   and he that sees God cannot fall into a fault, since rectitude of the
   will, of necessity, results from that vision as was shown above
   ([1039]Q[4], A[4]). Nor again can it be withdrawn by any other agent.
   Because the mind that is united to God is raised above all other
   things: and consequently no other agent can sever the mind from that
   union. Therefore it seems unreasonable that as time goes on, man should
   pass from happiness to misery, and vice versa; because such like
   vicissitudes of time can only be for such things as are subject to time
   and movement.

   Reply to Objection 1: Happiness is consummate perfection, which
   excludes every defect from the happy. And therefore whoever has
   happiness has it altogether unchangeably: this is done by the Divine
   power, which raises man to the participation of eternity which
   transcends all change.

   Reply to Objection 2: The will can be directed to opposites, in things
   which are ordained to the end; but it is ordained, of natural
   necessity, to the last end. This is evident from the fact that man is
   unable not to wish to be happy.

   Reply to Objection 3: Happiness has a beginning owing to the condition
   of the participator: but it has no end by reason of the condition of
   the good, the participation of which makes man happy. Hence the
   beginning of happiness is from one cause, its endlessness is from
   another.
     __________________________________________________________________

    Whether man can attain happiness by his natural powers?

   Objection 1: It would seem that man can attain Happiness by his natural
   powers. For nature does not fail in necessary things. But nothing is so
   necessary to man as that by which he attains the last end. Therefore
   this is not lacking to human nature. Therefore man can attain Happiness
   by his natural powers.

   Objection 2: Further, since man is more noble than irrational
   creatures, it seems that he must be better equipped than they. But
   irrational creatures can attain their end by their natural powers. Much
   more therefore can man attain Happiness by his natural powers.

   Objection 3: Further, Happiness is a "perfect operation," according to
   the Philosopher (Ethic. vii, 13). Now the beginning of a thing belongs
   to the same principle as the perfecting thereof. Since, therefore, the
   imperfect operation, which is as the beginning in human operations, is
   subject to man's natural power, whereby he is master of his own
   actions; it seems that he can attain to perfect operation, i.e.
   Happiness, by his natural powers.

   On the contrary, Man is naturally the principle of his action, by his
   intellect and will. But final Happiness prepared for the saints,
   surpasses the intellect and will of man; for the Apostle says (1 Cor.
   2:9) "Eye hath not seen, nor ear heard, neither hath it entered into
   the heart of man, what things God hath prepared for them that love
   Him." Therefore man cannot attain Happiness by his natural powers.

   I answer that, Imperfect happiness that can be had in this life, can be
   acquired by man by his natural powers, in the same way as virtue, in
   whose operation it consists: on this point we shall speak further on
   (Q[63]). But man's perfect Happiness, as stated above (Q[3], A[8]),
   consists in the vision of the Divine Essence. Now the vision of God's
   Essence surpasses the nature not only of man, but also of every
   creature, as was shown in the [1040]FP, Q[12], A[4]. For the natural
   knowledge of every creature is in keeping with the mode of his
   substance: thus it is said of the intelligence (De Causis; Prop. viii)
   that "it knows things that are above it, and things that are below it,
   according to the mode of its substance." But every knowledge that is
   according to the mode of created substance, falls short of the vision
   of the Divine Essence, which infinitely surpasses all created
   substance. Consequently neither man, nor any creature, can attain final
   Happiness by his natural powers.

   Reply to Objection 1: Just as nature does not fail man in necessaries,
   although it has not provided him with weapons and clothing, as it
   provided other animals, because it gave him reason and hands, with
   which he is able to get these things for himself; so neither did it
   fail man in things necessary, although it gave him not the wherewithal
   to attain Happiness: since this it could not do. But it did give him
   free-will, with which he can turn to God, that He may make him happy.
   "For what we do by means of our friends, is done, in a sense, by
   ourselves" (Ethic. iii, 3).

   Reply to Objection 2: The nature that can attain perfect good, although
   it needs help from without in order to attain it, is of more noble
   condition than a nature which cannot attain perfect good, but attains
   some imperfect good, although it need no help from without in order to
   attain it, as the Philosopher says (De Coel. ii, 12). Thus he is better
   disposed to health who can attain perfect health, albeit by means of
   medicine, than he who can attain but imperfect health, without the help
   of medicine. And therefore the rational creature, which can attain the
   perfect good of happiness, but needs the Divine assistance for the
   purpose, is more perfect than the irrational creature, which is not
   capable of attaining this good, but attains some imperfect good by its
   natural powers.

   Reply to Objection 3: When imperfect and perfect are of the same
   species, they can be caused by the same power. But this does not follow
   of necessity, if they be of different species: for not everything, that
   can cause the disposition of matter, can produce the final perfection.
   Now the imperfect operation, which is subject to man's natural power,
   is not of the same species as that perfect operation which is man's
   happiness: since operation takes its species from its object.
   Consequently the argument does not prove.
     __________________________________________________________________

    Whether man attains happiness through the action of some higher creature?

   Objection 1: It would seem that man can be made happy through the
   action of some higher creature, viz. an angel. For since we observe a
   twofold order in things---one, of the parts of the universe to one
   another, the other, of the whole universe to a good which is outside
   the universe; the former order is ordained to the second as to its end
   (Metaph. xii, 10). Thus the mutual order of the parts of an army is
   dependent on the order of the parts of an army is dependent on the
   order of the whole army to the general. But the mutual order of the
   parts of the universe consists in the higher creatures acting on the
   lower, as stated in the [1041]FP, Q[109], A[2]: while happiness
   consists in the order of man to a good which is outside the universe,
   i.e. God. Therefore man is made happy, through a higher creature, viz.
   an angel, acting on him.

   Objection 2: Further, that which is such in potentiality, can be
   reduced to act, by that which is such actually: thus what is
   potentially hot, is made actually hot, by something that is actually
   hot. But man is potentially happy. Therefore he can be made actually
   happy by an angel who is actually happy.

   Objection 3: Further, Happiness consists in an operation of the
   intellect as stated above (Q[3], A[4]). But an angel can enlighten
   man's intellect as shown in the [1042]FP, Q[111], A[1]. Therefore an
   angel can make a man happy.

   On the contrary, It is written (Ps. 83:12): "The Lord will give grace
   and glory."

   I answer that, Since every creature is subject to the laws of nature,
   from the very fact that its power and action are limited: that which
   surpasses created nature, cannot be done by the power of any creature.
   Consequently if anything need to be done that is above nature, it is
   done by God immediately; such as raising the dead to life, restoring
   sight to the blind, and such like. Now it has been shown above
   [1043](A[5]) that Happiness is a good surpassing created nature.
   Therefore it is impossible that it be bestowed through the action of
   any creature: but by God alone is man made happy, if we speak of
   perfect Happiness. If, however, we speak of imperfect happiness, the
   same is to be said of it as of the virtue, in whose act it consists.

   Reply to Objection 1: It often happens in the case of active powers
   ordained to one another, that it belongs to the highest power to reach
   the last end, while the lower powers contribute to the attainment of
   that last end, by causing a disposition thereto: thus to the art of
   sailing, which commands the art of shipbuilding, it belongs to use a
   ship for the end for which it was made. Thus, too, in the order of the
   universe, man is indeed helped by the angels in the attainment of his
   last end, in respect of certain preliminary dispositions thereto:
   whereas he attains the last end itself through the First Agent, which
   is God.

   Reply to Objection 2: When a form exists perfectly and naturally in
   something, it can be the principle of action on something else: for
   instance a hot thing heats through heat. But if a form exist in
   something imperfectly, and not naturally, it cannot be the principle
   whereby it is communicated to something else: thus the "intention" of
   color which is in the pupil, cannot make a thing white; nor indeed can
   everything enlightened or heated give heat or light to something else;
   for if they could, enlightening and heating would go on to infinity.
   But the light of glory, whereby God is seen, is in God perfectly and
   naturally; whereas in any creature, it is imperfectly and by likeness
   or participation. Consequently no creature can communicate its
   Happiness to another.

   Reply to Objection 3: A happy angel enlightens the intellect of a man
   or of a lower angel, as to certain notions of the Divine works: but not
   as to the vision of the Divine Essence, as was stated in the [1044]FP,
   Q[106], A[1]: since in order to see this, all are immediately
   enlightened by God.
     __________________________________________________________________

    Whether any good works are necessary that man may receive happiness from
    God?

   Objection 1: It would seem that no works of man are necessary that he
   may obtain Happiness from God. For since God is an agent of infinite
   power, He requires before acting, neither matter, nor disposition of
   matter, but can forthwith produce the whole effect. But man's works,
   since they are not required for Happiness, as the efficient cause
   thereof, as stated above [1045](A[6]), can be required only as
   dispositions thereto. Therefore God who does not require dispositions
   before acting, bestows Happiness without any previous works.

   Objection 2: Further, just as God is the immediate cause of Happiness,
   so is He the immediate cause of nature. But when God first established
   nature, He produced creatures without any previous disposition or
   action on the part of the creature, but made each one perfect forthwith
   in its species. Therefore it seems that He bestows Happiness on man
   without any previous works.

   Objection 3: Further, the Apostle says (Rom. 4:6) that Happiness is of
   the man "to whom God reputeth justice without works." Therefore no
   works of man are necessary for attaining Happiness.

   On the contrary, It is written (Jn. 13:17): "If you know these things,
   you shall be blessed if you do them." Therefore Happiness is obtained
   through works.

   I answer that, Rectitude of the will, as stated above (Q[4], A[4]), is
   necessary for Happiness; since it is nothing else than the right order
   of the will to the last end; and it is therefore necessary for
   obtaining the end, just as the right disposition of matter, in order to
   receive the form. But this does not prove that any work of man need
   precede his Happiness: for God could make a will having a right
   tendency to the end, and at the same time attaining the end; just as
   sometimes He disposes matter and at the same time introduces the form.
   But the order of Divine wisdom demands that it should not be thus; for
   as is stated in De Coel. ii, 12, "of those things that have a natural
   capacity for the perfect good, one has it without movement, some by one
   movement, some by several." Now to possess the perfect good without
   movement, belongs to that which has it naturally: and to have Happiness
   naturally belongs to God alone. Therefore it belongs to God alone not
   to be moved towards Happiness by any previous operation. Now since
   Happiness surpasses every created nature, no pure creature can
   becomingly gain Happiness, without the movement of operation, whereby
   it tends thereto. But the angel, who is above man in the natural order,
   obtained it, according to the order of Divine wisdom, by one movement
   of a meritorious work, as was explained in the [1046]FP, Q[62], A[5];
   whereas man obtains it by many movements of works which are called
   merits. Wherefore also according to the Philosopher (Ethic. i, 9),
   happiness is the reward of works of virtue.

   Reply to Objection 1: Works are necessary to man in order to gain
   Happiness; not on account of the insufficiency of the Divine power
   which bestows Happiness, but that the order in things be observed.

   Reply to Objection 2: God produced the first creatures so that they are
   perfect forthwith, without any previous disposition or operation of the
   creature; because He instituted the first individuals of the various
   species, that through them nature might be propagated to their progeny.
   In like manner, because Happiness was to be bestowed on others through
   Christ, who is God and Man, "Who," according to Heb. 2:10, "had brought
   many children into glory"; therefore, from the very beginning of His
   conception, His soul was happy, without any previous meritorious
   operation. But this is peculiar to Him: for Christ's merit avails
   baptized children for the gaining of Happiness, though they have no
   merits of their own; because by Baptism they are made members of
   Christ.

   Reply to Objection 3: The Apostle is speaking of the Happiness of Hope,
   which is bestowed on us by sanctifying grace, which is not given on
   account of previous works. For grace is not a term of movement, as
   Happiness is; rather is it the principle of the movement that tends
   towards Happiness.
     __________________________________________________________________

    Whether every man desires happiness?

   Objection 1: It would seem that not all desire Happiness. For no man
   can desire what he knows not; since the apprehended good is the object
   of the appetite (De Anima iii, 10). But many know not what Happiness
   is. This is evident from the fact that, as Augustine says (De Trin.
   xiii, 4), "some thought that Happiness consists in pleasures of the
   body; some, in a virtue of the soul; some in other things." Therefore
   not all desire Happiness.

   Objection 2: Further, the essence of Happiness is the vision of the
   Divine Essence, as stated above ([1047]Q[3], A[8]). But some consider
   it impossible for man to see the Divine Essence; wherefore they desire
   it not. Therefore all men do not desire Happiness.

   Objection 3: Further, Augustine says (De Trin. xiii, 5) that "happy is
   he who has all he desires, and desires nothing amiss." But all do not
   desire this; for some desire certain things amiss, and yet they wish to
   desire such things. Therefore all do not desire Happiness.

   On the contrary, Augustine says (De Trin. xiii, 3): "If that actor had
   said: 'You all wish to be happy; you do not wish to be unhappy,' he
   would have said that which none would have failed to acknowledge in his
   will." Therefore everyone desires to be happy.

   I answer that, Happiness can be considered in two ways. First according
   to the general notion of happiness: and thus, of necessity, every man
   desires happiness. For the general notion of happiness consists in the
   perfect good, as stated above ([1048]AA[3],4). But since good is the
   object of the will, the perfect good of a man is that which entirely
   satisfies his will. Consequently to desire happiness is nothing else
   than to desire that one's will be satisfied. And this everyone desires.
   Secondly we may speak of Happiness according to its specific notion, as
   to that in which it consists. And thus all do not know Happiness;
   because they know not in what thing the general notion of happiness is
   found. And consequently, in this respect, not all desire it. Wherefore
   the reply to the first Objection is clear.

   Reply to Objection 2: Since the will follows the apprehension of the
   intellect or reason; just as it happens that where there is no real
   distinction, there may be a distinction according to the consideration
   of reason; so does it happen that one and the same thing is desired in
   one way, and not desired in another. So that happiness may be
   considered as the final and perfect good, which is the general notion
   of happiness: and thus the will naturally and of necessity tends
   thereto, as stated above. Again it can be considered under other
   special aspects, either on the part of the operation itself, or on the
   part of the operating power, or on the part of the object; and thus the
   will does not tend thereto of necessity.

   Reply to Objection 3: This definition of Happiness given by
   some---"Happy is the man that has all he desires," or, "whose every
   wish is fulfilled" is a good and adequate definition; but an inadequate
   definition if understood in another. For if we understand it simply of
   all that man desires by his natural appetite, thus it is true that he
   who has all that he desires, is happy: since nothing satisfies man's
   natural desire, except the perfect good which is Happiness. But if we
   understand it of those things that man desires according to the
   apprehension of the reason, thus it does not belong to Happiness, to
   have certain things that man desires; rather does it belong to
   unhappiness, in so far as the possession of such things hinders man
   from having all that he desires naturally; thus it is that reason
   sometimes accepts as true things that are a hindrance to the knowledge
   of truth. And it was through taking this into consideration that
   Augustine added so as to include perfect Happiness---that he "desires
   nothing amiss": although the first part suffices if rightly understood,
   to wit, that "happy is he who has all he desires."
     __________________________________________________________________
}.freeze

TREATISE_WITH_COMPLEX_QUESTION = %{
TREATISE ON THE DISTINCTION OF GOOD AND EVIL (QQ[48]-49)
     __________________________________________________________________

  IRONY* (TWO ARTICLES) [*Irony here must be given the signification of the
  Greek {eironia}, whence it is derived: dissimulation of one's own good
  points.]

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
}.freeze
