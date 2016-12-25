gem 'minitest'
require 'minitest/autorun'
require_relative '../parser/summa_parser'

class TestSummaParser < Minitest::Test
  def setup
    @parser = SummaParser.new(SUMMA)
  end

  def test_verify_correct_number_of_parts_found
    assert_equal(2, @parser.summa.parts.size)
  end

  def test_verify_first_part_title
    expected_title = 'FIRST PART (FP: QQ 1-119)'
    assert_equal(expected_title, @parser.summa.parts[0].title)
  end

  def test_verify_second_part_title
    expected_title = 'FIRST PART OF THE SECOND PART (FS) (QQ[1]-114)'
    assert_equal(expected_title, @parser.summa.parts[1].title)
  end
end

SUMMA = %{
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

                 FIRST PART OF THE SECOND PART (FS) (QQ[1]-114)
     __________________________________________________________________

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
}.freeze
