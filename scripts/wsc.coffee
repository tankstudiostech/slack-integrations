# Description:
#   Get WSC Questions and Answers with proof texts
#
# Dependencies:
#   none
#
# Configuration:
#   None
#
# Commands:
#   hubot wsc list - lists each question with its number
#   hubot wsc q <question_number> - Shows the specified question
#   hubot wsc a <question_number> - Shows the answer to the specified question
#   hubot wsc qa <question_number> - Shows the specified question and answer
#   hubot wsc full <question_number> - Shows the question, answer, and proof texts of the specified question
#   hubot wsc random - gets a random question and answer with proof text
#
# Author:
#   sircharleswatson

wscQuestions = () -> [
    {
      number: 1,
      question: "What is the chief end of man?",
      answer: "Man's chief end is to glorify God, [1] and to enjoy him for ever. [2]",
      proofTexts: {
        "1": ["Ps. 86:9", "Isa. 60:21", "Rom. 11:36", "I Cor. 6:20; 10:31", "Rev. 4:11"], 
        "2": ["Ps. 16:5-11; 144:15", "Isa. 12:2", "Luke 2:10", "Phil. 4:4", "Rev. 21:3-4"],
      },
    },
    {
      number: 2,
      question: "What rule hath God given to direct us how we may glorify and enjoy him?",
      answer: "The Word of God, which is contained in the Scriptures of the Old and New Testaments, [1] is the only rule to direct us how we may glorify and enjoy him. [2]",
      proofTexts: {
        "1": ["Matt. 19:4-5 with Gen. 2:24", "Luke 24:27, 44", "I Cor. 2:13; 14:37", "II Pet.1:20-21; 3:2, 15-16"], 
        "2": ["Deut. 4:2", "Ps. 19:7-11", "Isa. 18:20", "John 15:11; 20:30-31", "Acts 17:11", "II Tim. 3:15-17", "I John 1:4"],
      },
    },
    {
      number: 3,
      question: "What do the Scriptures principally teach?",
      answer: "The Scriptures principally teach what man is to believe concerning God, [1] and what duty God requires of man [2].",
      proofTexts: {
        "1": ["Gen. 1:1", "John 5:39; 20:31", "Rom. 10:17", "II Tim. 3:15"], 
        "2": ["Deut. 10:12-13", "Josh. 1:8", "Ps. 119:105", "Mic. 6:8", "II Tim. 3:16-17"],
      },
    },
    {
      number: 4,
      question: "What is God?",
      answer: "God is a Spirit [1], infinite [2], eternal [3], and unchangeable [4] in his being [5], wisdom [6], power [7], holiness [8], justice [9], goodness [10], and truth [11].",
      proofTexts: {
        "1": ["Deut. 4:15-19", "Luke 24:39", "John 1:18; 4:24", "Acts 17:29"], 
        "2": ["IKings 8:27", "Ps. 139:7-10; 145:3; 147:5", "Jer. 23:24", "Rom. 11:33-36"], 
        "3": ["Deut. 33:27", "Ps. 90:2; 102:12, 24-27", "Rev. 1:4,8"], 
        "4": ["Ps. 33:11", "Mal. 3:6", "Heb. 1:12; 6:17-18; 13:8", "Jas. 1:17"], 
        "5": ["Ex. 3:14", "Ps. 115:2-3", "I Tim. 1:17; 6:15-16"], 
        "6": ["Ps. 104:24", "Rom. 11:33-34", "Heb. 4:13", "I John 3:20"], 
        "7": ["Gen. 17:1", "Ps. 62:11", "Jer. 32:17", "Mat. 19:26", "Rev. 1:8"], 
        "8": ["Heb. 1:13", "I Pet. 1:15-16", "I John 3:3, 5", "Rev. 15:4"], 
        "9": ["Gen. 18:25", "Ex. 34:6-7", "Deut. 32:4", "Ps. 96:13", "Rom. 3:5, 26"], 
        "10": ["Ps. 103:5; 107:8", "Matt. 19:17", "Rom. 2:4"], 
        "11": ["Ex. 34:6", "Deut. 32:4", "Ps. 86:15; 117:2", "Heb. 6:18"],
      },
    },
    {
      number: 5,
      question: "Are there more Gods than one?",
      answer: "There is but one only [1], the living and true God [2].",
      proofTexts: {
        "1": ["Deut. 6:4", "Isa. 44:6; 45:21-22", "I Cor. 8:4-6"], 
        "2": ["Jer. 10:10", "John 17:3", "I Thess. 1:9", "I John 5:20"],
      },
    },
    {
      number: 6,
      question: "How many persons are there in the Godhead?",
      answer: "There are three persons in the Godhead; the Father, the Son, and the Holy Ghost [1]; and these three are one God, the same in substance, equal in power and glory. [2]",
      proofTexts: {
        "1": ["Matt. 3:16-17; 28:19", "II Cor. 13:14", "I Pet. 1:2"], 
        "2": ["Ps. 45:6", "John 1:1; 17:5", "Acts 5:3-4", "Rom. 9:5", "Col. 2:9", "Jude 24-25"],
      },
    },
    {
      number: 7,
      question: "What are the decrees of God?",
      answer: "The decrees of God are, his eternal purpose, according to the counsel of his will, whereby, for his own glory, he hath foreordained whatsoever comes to pass [1].",
      proofTexts: {
        "1": ["Ps. 33:11", "Isa. 14:24", "Acts 2:23", "Eph. 1:11-12"],
      },
    },
    {
      number: 8,
      question: "How doth God execute his decrees?",
      answer: "God executeth his decrees in the works of creation and providence [1].",
      proofTexts: {
        "1": ["Ps. 148:8", "Isa. 40:26", "Dan. 4:35", "Acts 4:24-28", "Rev. 4:11"],
      },
    },
    {
      number: 9,
      question: "What is the work of creation?",
      answer: "The work of creation is, God's making all things of nothing, by the word of his power [1], in the space of six days, and all very good. [2]",
      proofTexts: {
        "1": ["Gen. 1:1", "Ps. 33:6, 9", "Heb. 11:3"], 
        "2": ["Gen. 1:31"],
      },
    },
    {
      number: 10,
      question: "How did God create man?",
      answer: "God created man male and female, after his own image [1], in knowledge [2], righteousness, and holiness [3], with dominion over the creatures [4].",
      proofTexts: {
        "1": ["Gen. 1:27"], 
        "2": ["Col. 3:10"], 
        "3": ["Eph. 4:24"], 
        "4": ["Gen. 1:28", "see Ps. 8"],
      },
    },
    {
      number: 11,
      question: "What are God's works of providence?",
      answer: "God's works of providence are, his most holy [1], wise [2], and powerful [3] preserving [4] and governing [5] all his creatures, and all their actions [6].",
      proofTexts: {
        "1": ["Ps. 145:17"], 
        "2": ["Ps. 104:24"], 
        "3": ["Heb. 1:3"], 
        "4": ["Neh. 9:6"], 
        "5": ["Eph. 1:19-22"], 
        "6": ["Ps. 36:6", "Prov. 16:33", "Matt. 10:30"],
      },
    },
    {
      number: 12,
      question: "What special act of providence did God exercise toward man in the estate wherein he was created?",
      answer: "When God had created man, he entered into a covenant of life with him, upon condition of perfect obedience; forbidding him to eat of the tree of the knowledge of good and evil, upon pain of death. [1]",
      proofTexts: {
        "1": ["Gen. 2:16-17", "Jas. 2:10"],
      },
    },
    {
      number: 13,
      question: "Did our first parents continue in the estate wherein they were created?",
      answer: "Our first parents, being left to the freedom of their own will, fell from the estate wherein they were created, by sinning against God [1].",
      proofTexts: {
        "1": ["Gen. 3:6-8, 13", "II Cor. 11:3"],
      },
    },
    {
      number: 14,
      question: "What is sin?",
      answer: "Sin is any want of conformity unto, or transgression of, the law of God [1].",
      proofTexts: {
        "1": ["Lev. 5:17", "Jas. 4:17", "I John 3:4"],
      },
    },
    {
      number: 15,
      question: "What was the sin whereby our first parents fell from the estate wherein they were created?",
      answer: "The sin whereby our first parents fell from the estate wherein thy were created, was their eating the forbidden fruit [1].",
      proofTexts: {
        "1": ["Gen. 3:6"],
      },
    },
    {
      number: 16,
      question: "Did all mankind fall in Adam's first transgression?",
      answer: "The covenant being made with Adam [1], not only for himself, but for his posterity; all mankind, descending from him by ordinary generation, sinned in him, and fell with him, in his first transgression [2].",
      proofTexts: {
        "1": ["Gen. 2:16-17", "Jas. 2:10"], 
        "2": ["Rom. 5:12-21", "ICor. 15:22"],
      },
    },
    {
      number: 17,
      question: "Into what estate did the fall bring mankind?",
      answer: "The fall brought mankind into an estate of sin and misery [1].",
      proofTexts: {
        "1": ["Gen. 3:16-19, 23", "Rom. 3:16; 5:12", "Eph. 2:1"],
      },
    },
    {
      number: 18,
      question: "Wherein consists the sinfulness of that estate whereinto man fell?",
      answer: "The sinfulness of that estate whereinto man fell, consists in the guilt of Adam's first sin [1], the want of original righteousness [2], and the corruption of his whole nature [3], which is commonly called original sin; together with all actual transgressions which proceed from it [4].",
      proofTexts: {
        "1": ["Rom. 5:12, 19"], 
        "2": ["Rom. 3:10", "Col. 3:10", "Eph. 4:24"], 
        "3": ["Ps. 51:5", "John 3:6", "Rom. 3:18; 8:7-8", "Eph. 2:3"], 
        "4": ["Gen. 6:5", "Ps. 53:1-3", "Matt. 15:19", "Rom. 3:10-18, 23", "Gal. 5:19-21", "Jas. 1:14-15"],
      },
    },
    {
      number: 19,
      question: "What is the misery of that estate whereinto man fell?",
      answer: "All mankind by their fall lost communion with God [1], are under his wrath [2] and curse [3], and so made liable to all miseries in this life [4], to death [5] itself, and to the pains of hell for ever [6].",
      proofTexts: {
        "1": ["Gen. 3:8, 24", "John 8:34, 42, 44", "Eph. 2:12; 4:18"], 
        "2": ["John 3:36", "Rom. 1:18", "Eph. 2:3; 5:6"], 
        "3": ["Gal. 3:10", "Rev. 22:3"], 
        "4": ["Gen. 3:16-19", "Job 5:7", "Ecc. 2:22-23", "Rom. 8:18-23"], 
        "5": ["Ezek. 18:4", "Rom. 5:12; 6:23"], 
        "6": ["Matt. 25:41, 46", "II Thess. 1:9", "Rev. 14:9-11"],
      },
    },
    {
      number: 20,
      question: "Did God leave all mankind to perish in the estate of sin and misery?",
      answer: "God having, out of his mere good pleasure, from all eternity, elected some to everlasting life [a,] did enter into a covenant of grace, to deliver them out of the estate of sin and misery, and to bring them into an estate of salvation by a Redeemer [2].",
      proofTexts: {
        "1": ["Acts 13:48", "Eph. 1:4-5", "II Thess. 2:13-14"], 
        "2": ["Gen. 3:15; 17:7", "Ex. 19:5-6", "Jer. 31:31-34", "Matt. 20:28", "I Cor. 11:25", "Heb. 9:15"],
      },
    },
    {
      number: 21,
      question: "Who is the Redeemer of God's elect?",
      answer: "The only Redeemer of God's elect is the Lord Jesus Christ [1], who, being the eternal Son of God [2], became man [3] and so was, and continueth to be, God and man in two distinct natures, and one person, forever [4].",
      proofTexts: {
        "1": ["John 14:6", "Acts 4:12", "I Tim. 2:5-6"], 
        "2": ["Ps. 2:7", "Matt. 3:17; 17:5", "John 1:18"], 
        "3": ["Isa. 9:6", "Matt. 1:23", "John 1:14", "Gal. 4:4"], 
        "4": ["Acts 1:11", "Heb. 7:24-25"],
      },
    },
    {
      number: 22,
      question: "How did Christ, being the Son of God, become man?",
      answer: "Christ, the Son of God, became man, by taking to himself a true body, and a reasonable soul [1], being conceived by the power of the Holy Ghost, in the womb of the virgin Mary, and born of her [2] yet without sin [3].",
      proofTexts: {
        "1": ["Phil. 2:7", "Heb. 2:14, 17"], 
        "2": ["Luke 1:27, 31, 35"], 
        "3": ["II Cor. 5:21", "Heb. 4:15; 7:26", "I John 3:5"],
      },
    },
    {
      number: 23,
      question: "What offices doth Christ execute as our Redeemer?",
      answer: "Christ, as our Redeemer, executeth the offices of a prophet [1], of a priest [2], and of a king [3], both in his estate of humiliation and exaltation.",
      proofTexts: {
        "1": ["Deut. 18:18", "Acts 2:33; 3:22-23", "Heb. 1:1-2"], 
        "2": ["Heb. 4:14-15; 5:5-6"], 
        "3": ["Isa. 9:6-7", "Luke 1:32-33", "John 18:37", "I Cor. 15:25"],
      },
    },
    {
      number: 24,
      question: "How doth Christ execute the office of a prophet?",
      answer: "Christ executeth the office of a prophet, in revealing to us, by his Word [1] and Spirit [b,] the will of God for our salvation [3].",
      proofTexts: {
        "1": ["Luke 4:18-19, 21", "Acts 1:1-2", "Heb. 2:3"], 
        "2": ["John 15:26-27", "Acts 1:8", "IPet. 1:11"], 
        "3": ["John 4:41-42; 20:30-31"],
      },
    },
    {
      number: 25,
      question: "How doth Christ execute the office of a priest?",
      answer: "Christ executeth the office of a priest, in his once offering up of himself a sacrifice to satisfy divine justice [1], and reconcile us to God [2]; and in making continual intercession for us [3].",
      proofTexts: {
        "1": ["Isa. 53", "Acts 8:32-35", "Heb. 9:26-28; 10:12"], 
        "2": ["Rom. 5:10-11", "II Cor. 5:18", "Col. 1:21-22"], 
        "3": ["Rom. 8:34", "Heb. 7:25; 9:24"],
      },
    },
    {
      number: 26,
      question: "How doth Christ execute the office of a king?",
      answer: "Christ executeth the office of a king, in subduing us to himself, in ruling and defending us [1], and in restraining and conquering all his and our enemies [2].",
      proofTexts: {
        "1": ["Ps. 110:3", "Matt. 28:18-20", "John 17:2", "Col. 1:13"], 
        "2": ["Ps. 2:6-9; 110:1-2", "Matt. 12:28", "ICor. 15:24-26", "Col. 2:15"],
      },
    },
    {
      number: 27,
      question: "Wherein did Christ's humiliation consist?",
      answer: "Christ's humiliation consisted in his being born, and that in a low condition [1], made under the law [2], undergoing the miseries of this life [3], the wrath of God [4], and the cursed death of the cross [5]; in being buried, and continuing under the power of death for a time. [6]",
      proofTexts: {
        "1": ["Luke 2:7", "II Cor. 8:9", "Gal. 4:4"], 
        "2": ["Gal. 4:4"], 
        "3": ["Isa. 53:3", "Luke 9:58", "John 4:6; 11:35", "Heb. 2:18"], 
        "4": ["Ps. 22:1 (Matt. 27:46); Isa. 53:10", "I John 2:2"], 
        "5": ["Gal. 3:13", "Phil. 2:8"], 
        "6": ["Matt. 12:40", "I Cor. 15:3-4"],
      },
    },
    {
      number: 28,
      question: "Wherein consisteth Christ's exaltation?",
      answer: "Christ's exaltation consisteth in his rising again from the dead on the third day [1], in ascending up into heaven [2], in sitting at the right hand [3] of God the Father, and in coming to judge the world at the last day [4].",
      proofTexts: {
        "1": ["I Cor. 15:4"], 
        "2": ["Ps. 68:18", "Acts 1:11", "Eph. 4:8"], 
        "3": ["Ps. 110:1", "Acts 2:33-34", "Heb. 1:3"], 
        "4": ["Matt. 16:27", "Acts 17:31"],
      },
    },
    {
      number: 29,
      question: "How are we made partakers of the redemption purchased by Christ?",
      answer: "We are made partakers of the redemption purchased by Christ, by the effectual application of it to us by his Holy Spirit [1].",
      proofTexts: {
        "1": ["Titus 3:4-7"],
      },
    },
    {
      number: 30,
      question: "How doth the Spirit apply to us the redemption purchased by Christ?",
      answer: "The Spirit applieth to us the redemption purchased by Christ, by working faith in us [1], and thereby uniting us to Christ in our effectual calling [2].",
      proofTexts: {
        "1": ["Rom. 10:17", "ICor. 2:12-16", "Eph. 2:8", "Phil. 1:29"], 
        "2": ["John 15:5", "ICor. 1:9", "Eph. 3:17"],
      },
    },
    {
      number: 31,
      question: "What is effectual calling?",
      answer: "Effectual calling is the work of God's Spirit, whereby, convincing us of our sin and misery, enlightening our minds in the knowledge of Christ [1], and renewing our wills [2], he doth persuade and enable us to embrace Jesus Christ [3], freely offered to us in the gospel [4].",
      proofTexts: {
        "1": ["Acts 26:18", "ICor. 2:10, 12", "II Cor. 4:6", "Eph. 1:17-18"], 
        "2": ["Deut. 30:6", "Ezk. 36:26-27", "John 3:5", "Titus 3:5"], 
        "3": ["John 6:44-45", "Acts 16:14"], 
        "4": ["Isa. 45:22", "Matt. 11:28-30", "Rev. 22:17"],
      },
    },
    {
      number: 32,
      question: "What benefits do they that are effectually called partake of in this life?",
      answer: "They that are effectually called do in this life partake of justification, adoption, and sanctification, and the several benefits which in this life do either accompany or flow from them [1].",
      proofTexts: {
        "1": ["Rom. 8:30", "ICor. 1:30; 6:11", "Eph. 1:5"],
      },
    },
    {
      number: 33,
      question: "What is justification?",
      answer: "Justification is an act of God's free grace [1], wherein he pardoneth all our sins [2], and accepteth us as righteous in his sight [3], only for the righteousness of Christ imputed to us [4], and received by faith alone [5].",
      proofTexts: {
        "1": ["Rom. 3:24"], 
        "2": ["Rom. 4:6-8", "IICor. 5:19"], 
        "3": ["IICor. 5:21"], 
        "4": ["Rom. 4:6, 11; 5:19"], 
        "5": ["Gal. 2:16", "Phil. 3:9"],
      },
    },
    {
      number: 34,
      question: "What is adoption?",
      answer: "Adoption is an act of God's free grace [1], whereby we are received into the number, and have a right to all the privileges, of the sons of God [2].",
      proofTexts: {
        "1": ["I John 3:1"], 
        "2": ["John 1:12", "Rom. 8:17"],
      },
    },
    {
      number: 35,
      question: "What is sanctification?",
      answer: "Sanctification is the work of God's free grace [1], whereby we are renewed in the whole man after the image of God [2], and are enabled more and more to die unto sin, and live unto righteousness [3].",
      proofTexts: {
        "1": ["Ezk. 36:27", "Phil. 2:13", "II Thess. 2:13"], 
        "2": ["II Cor. 5:17", "Eph. 4:23-24", "I Thess. 5:23"], 
        "3": ["Ezek. 36:25-27", "Rom. 6:4, 6, 12-14", "II Cor. 7:1", "IPet. 2:24"],
      },
    },
    {
      number: 36,
      question: "What are the benefits which in this life do accompany or flow from justification, adoption, and sanctification?",
      answer: "The benefits which in this life do accompany or flow from justification, adoption, and sanctification, are, assurance of God's love [1], peace of conscience [2], joy in the Holy Ghost [3], increase of grace [4], and perseverance therein to the end [5].",
      proofTexts: {
        "1": ["Rom. 5:5"], 
        "2": ["Rom. 5:1"], 
        "3": ["Rom. 14:17"], 
        "4": ["II Pet. 3:18"], 
        "5": ["Phil. 1:6", "I Pet. 1:5"],
      },
    },
    {
      number: 37,
      question: "What benefits do believers receive from Christ at death?",
      answer: "The souls of believers are at their death made perfect in holiness [1], and do immediately pass into glory [2]; and their bodies, being still united to Christ [3], do rest in their graves till the resurrection [4].",
      proofTexts: {
        "1": ["Heb. 12:23"], 
        "2": ["Luke 23:43", "II Cor. 5:6, 8", "Phil. 1:23"], 
        "3": ["I Thess. 4:14"], 
        "4": ["Dan. 12:2", "John 5:28-29", "Acts 24:15"],
      },
    },
    {
      number: 38,
      question: "What benefits do believers receive from Christ at the resurrection?",
      answer: "At the resurrection, believers being raised up in glory [1], shall be openly acknowledged and acquitted in the day of judgment [2], and made perfectly blessed in the full enjoying of God [3] to all eternity [4].",
      proofTexts: {
        "1": ["I Cor. 15:42-43"], 
        "2": ["Matt. 25:33-34, 46"], 
        "3": ["Rom. 8:29", "I John 3:2"], 
        "4": ["Ps. 16:11", "I Thess. 4:17"],
      },
    },
    {
      number: 39,
      question: "What is the duty which God requireth of man?",
      answer: "The duty which God requireth of man, is obedience to his revealed will [1].",
      proofTexts: {
        "1": ["Deut. 29:29", "Mic. 6:8", "I John 5:2-3"],
      },
    },
    {
      number: 40,
      question: "What did God at first reveal to man for the rule of his obedience?",
      answer: "The rule which God at first revealed to man for his obedience, was the moral law [1].",
      proofTexts: {
        "1": ["Rom. 2:14-15; 10:5"],
      },
    },
    {
      number: 41,
      question: "Wherein is the moral law summarily comprehended?",
      answer: "The moral law is summarily comprehended in the ten commandments [1].",
      proofTexts: {
        "1": ["Deut. 4:13", "Matt. 19:17-19"],
      },
    },
    {
      number: 42,
      question: "What is the sum of the ten commandments?",
      answer: "The sum of the ten commandments is, To love the Lord our God with all our heart, with all our soul, with all our strength, and with all our mind; and our neighbour as ourselves [1].",
      proofTexts: {
        "1": ["Matt. 22:37-40"],
      },
    },
    {
      number: 43,
      question: "What is the preface to the ten commandments?",
      answer: "The preface to the ten commandments is in these words, I am the Lord thy God, which have brought thee out of the land of Egypt, out of the house of bondage. [1]",
      proofTexts: {
        "1": ["Ex. 20:2", "Deut. 5:6"],
      },
    },
    {
      number: 44,
      question: "What doth the preface to the ten commandments teach us?",
      answer: "The preface to the ten commandments teacheth us, That because God is the Lord, and our God, and Redeemer, therefore we are bound to keep all his commandments [1].",
      proofTexts: {
        "1": ["Luke 1:74-75", "I Pet. 1:14-19"],
      },
    },
    {
      number: 45,
      question: "Which is the first commandment?",
      answer: "The first commandment is, Thou shalt have no other gods before me. [1]",
      proofTexts: {
        "1": ["Ex. 20:3", "Deut. 5:7"],
      },
    },
    {
      number: 46,
      question: "What is required in the first commandment?",
      answer: "The first commandment requireth us to know and acknowledge God to be the only true God, and our God; and to worship and glorify him accordingly [1].",
      proofTexts: {
        "1": ["I Chron. 28:9", "Isa. 45:20-25", "Matt. 4:10"],
      },
    },
    {
      number: 47,
      question: "What is forbidden in the first commandment?",
      answer: "The first commandment forbiddeth the denying [1], or not worshipping and glorifying the true God as God [2], and our God [3]; and the giving of that worship and glory to any other, which is due to him alone [4].",
      proofTexts: {
        "1": ["Ps. 14:1"], 
        "2": ["Rom. 1:20-21"], 
        "3": ["Ps. 81:10-11"], 
        "4": ["Ezek. 8:16-18", "Rom. 1:25"],
      },
    },
    {
      number: 48,
      question: "What are we specially taught by these words, 'before me', in the first commandment?",
      answer: "These words, before me, in the first commandment teach us, that God, who seeth all things, taketh notice of, and is much displeased with, the sin of having any other God [1].",
      proofTexts: {
        "1": ["Deut. 30:17-18", "Ps. 44:20-21", "Ezek. 8:12"],
      },
    },
    {
      number: 49,
      question: "Which is the second commandment?",
      answer: "The second commandment is, Thou shalt not make unto thee any graven image, or any likeness of anything that is in heaven above, or that is in the earth beneath, or that is in the water under the earth: thou shalt not bow down thy self to them, nor serve them: for I the Lord thy God am a jealous God, visiting the iniquity of the fathers upon the children unto the third and fourth generation of them that hate me; and showing mercy unto thousands of them that love me, and keep my commandments. [1]",
      proofTexts: {
        "1": ["Ex. 20:4-6", "Deut. 5:8-10"],
      },
    },
    {
      number: 50,
      question: "What is required in the second commandment?",
      answer: "The second commandment requireth the receiving, observing, and keeping pure and entire, all such religious worship and ordinances as God hath appointed in his Word [1].",
      proofTexts: {
        "1": ["Deut. 12:32", "Matt. 28:20"],
      },
    },
    {
      number: 51,
      question: "What is forbidden in the second commandment?",
      answer: "The second commandment forbiddeth the worshipping of God by images [1], or any other way not appointed in his Word [2].",
      proofTexts: {
        "1": ["Deut. 4:15-19", "Rom. 1:22-23"], 
        "2": ["Lev. 10:1-2", "Jer. 19:4-5", "Col. 2:18-23"],
      },
    },
    {
      number: 52,
      question: "What are the reasons annexed to the second commandment?",
      answer: "The reasons annexed to the second commandment are, God's sovereignty over us [1], his propriety in us [2], and the zeal he hath to his own worship [3].",
      proofTexts: {
        "1": ["Ps. 95:2-3, 6-7; 96:9-10"], 
        "2": ["Ex. 19:5", "Ps. 45:11", "Isa. 54:5"], 
        "3": ["Ex. 34:14", "ICor. 10:22"],
      },
    },
    {
      number: 53,
      question: "Which is the third commandment?",
      answer: "The third commandment is, Thou shalt not take the name of the Lord thy God in vain; for the Lord will not hold him guiltless that taketh his name in vain. [1]",
      proofTexts: {
        "1": ["Ex. 20:7", "Deut. 5:11"],
      },
    },
    {
      number: 54,
      question: "What is required in the third commandment?",
      answer: "The third commandment requireth the holy and reverend use of God's names, titles [1], attributes [2], ordinances [3], Word [4], and works [5].",
      proofTexts: {
        "1": ["Deut. 10:20", "Ps. 29:2", "Matt. 6:9"], 
        "2": ["I Chron. 29:10-13", "Rev. 15:3-4"], 
        "3": ["Acts 2:42", "I Cor. 11:27-28"], 
        "4": ["Ps. 138:2", "Rev. 22:18-19"], 
        "5": ["Ps. 107:21-22", "Rev. 4:11"],
      },
    },
    {
      number: 55,
      question: "What is forbidden in the third commandment?",
      answer: "The third commandment forbiddeth all profaning or abusing of anything whereby God maketh himself known [1].",
      proofTexts: {
        "1": ["Lev. 19:12", "Matt. 5:33-37", "Jas. 5:12"],
      },
    },
    {
      number: 56,
      question: "What is the reason annexed to the third commandment?",
      answer: "The reason annexed to the third commandment is, that however the breakers of this commandment may escape punishment from men, yet the Lord our God will not suffer them to escape his righteous judgment [1].",
      proofTexts: {
        "1": ["Deut. 28:58-59", "ISam. 3:13; 4:11"],
      },
    },
    {
      number: 57,
      question: "Which is the fourth commandment?",
      answer: "The fourth commandment is, Remember the sabbath day, to keep it holy. Six days shalt thou labor, and do all thy work; but the seventh day is the sabbath of the Lord thy God: in it thou shalt not do any work, thou, nor thy son, nor thy daughter, thy manservant, nor thy maidservant, nor thy cattle, nor thy stranger that is within thy gates. For in six days the Lord made heaven and earth, the sea, and all that in them is, and rested the seventh day: wherefore the Lord blessed the sabbath day, and hallowed it. [1]",
      proofTexts: {
        "1": ["Ex. 20:8-11", "Deut. 5:12-15"],
      },
    },
    {
      number: 58,
      question: "What is required in the fourth commandment?",
      answer: "The fourth commandment requireth the keeping holy to God such set times as he hath appointed in his Word; expressly one whole day in seven, to be a holy sabbath to himself [1].",
      proofTexts: {
        "1": ["Ex. 31:13, 16-17"],
      },
    },
    {
      number: 59,
      question: "Which day of the seven hath God appointed to be the weekly sabbath?",
      answer: "From the beginning of the world to the resurrection of Christ, God appointed the seventh day of the week to be the weekly sabbath [1]; and the first day of the week ever since, to continue to the end of the world, which is the Christian sabbath [2].",
      proofTexts: {
        "1": ["Gen. 2:2-3", "Ex. 20:11"], 
        "2": ["Mark 2:27-28", "Acts 20:7", "ICor. 16:2", "Rev. 1:10"],
      },
    },
    {
      number: 60,
      question: "How is the sabbath to be sanctified?",
      answer: "The sabbath is to be sanctified by a holy resting all that day, even from such worldly employments and recreations as are lawful on other days [1]; and spending the whole time in the public and private exercises of God's worship [2], except so much as is to be taken up in the works of necessity and mercy [3].",
      proofTexts: {
        "1": ["Ex. 20:10", "Neh. 13:15-22", "Isa. 58:13-14"], 
        "2": ["Ex. 20:8", "Lev. 23:3", "Luke 4:16", "Acts 20:7"], 
        "3": ["Matt. 12:1-13"],
      },
    },
    {
      number: 61,
      question: "What is forbidden in the fourth commandment?",
      answer: "The fourth commandment forbiddeth the omission or careless performance of the duties required, and the profaning the day by idleness, or doing that which is in itself sinful, or by unnecessary thoughts, words, or works, about our worldly employments or recreations [1].",
      proofTexts: {
        "1": ["Neh. 13:15-22", "Isa. 58:13-14", "Amos 8:4-6"],
      },
    },
    {
      number: 62,
      question: "What are the reasons annexed to the fourth commandment?",
      answer: "The reasons annexed to the fourth commandment are, God's allowing us six days of the week for our own employments [1], his challenging a special propriety in the seventh, his own example, and his blessing the sabbath day [2].",
      proofTexts: {
        "1": ["Ex. 20:9; 31:15", "Lev. 23:3"], 
        "2": ["Gen. 2:2-3", "Ex. 20:11; 31:17"],
      },
    },
    {
      number: 63,
      question: "Which is the fifth commandment?",
      answer: "The fifth commandment is, Honour thy father and thy mother; that thy days may be long upon the land which the Lord thy God giveth thee. [1]",
      proofTexts: {
        "1": ["Ex. 20:12", "Deut. 5:16"],
      },
    },
    {
      number: 64,
      question: "What is required in the fifth commandment?",
      answer: "The fifth commandment requireth the preserving the honor, and performing the duties, belonging to everyone in their several places and relations, as superiors, inferiors, or equals [1].",
      proofTexts: {
        "1": ["Rom. 13:1, 7", "Eph. 5:21-22, 24; 6:1, 4-5, 9", "I Pet. 2:17"],
      },
    },
    {
      number: 65,
      question: "What is forbidden in the fifth commandment?",
      answer: "The fifth commandment forbiddeth the neglecting of, or doing anything against, the honor and duty which belongeth to everyone in their several places and relations [1].",
      proofTexts: {
        "1": ["Matt. 15:4-6", "Rom. 13:8"],
      },
    },
    {
      number: 66,
      question: "What is the reason annexed to the fifth commandment?",
      answer: "The reason annexed to the fifth commandment is, a promise of long life and prosperity (as far as it shall serve for God's glory and their own good) to all such as keep this commandment [1].",
      proofTexts: {
        "1": ["Ex. 20:12", "Deut. 5:16", "Eph. 6:2-3"],
      },
    },
    {
      number: 67,
      question: "Which is the sixth commandment?",
      answer: "The sixth commandment is, Thou shalt not kill. [1]",
      proofTexts: {
        "1": ["Ex. 20:13", "Deut. 5:17"],
      },
    },
    {
      number: 68,
      question: "What is required in the sixth commandment?",
      answer: "The sixth commandment requireth all lawful endeavors to preserve our own life, and the life of others [1].",
      proofTexts: {
        "1": ["Eph. 5:28-29"],
      },
    },
    {
      number: 69,
      question: "What is forbidden in the sixth commandment?",
      answer: "The sixth commandment forbiddeth the taking away of our own life, or the life of our neighbour, unjustly, or whatsoever tendeth thereunto [1].",
      proofTexts: {
        "1": ["Gen. 9:6", "Matt. 5:22", "I John 3:15"],
      },
    },
    {
      number: 70,
      question: "Which is the seventh commandment?",
      answer: "The seventh commandment is, Thou shalt not commit adultery. [1]",
      proofTexts: {
        "1": ["Ex. 20:14", "Deut. 5:18"],
      },
    },
    {
      number: 71,
      question: "What is required in the seventh commandment?",
      answer: "The seventh commandment requireth the preservation of our own and our neighbour's chastity, in heart, speech, and behavior [1].",
      proofTexts: {
        "1": ["I Cor. 7:2-3, 5", "I Thess. 4:3-5"],
      },
    },
    {
      number: 72,
      question: "What is forbidden in the seventh commandment?",
      answer: "The seventh commandment forbiddeth all unchaste thoughts, words, and actions [1].",
      proofTexts: {
        "1": ["Matt. 5:28", "Eph. 5:3-4"],
      },
    },
    {
      number: 73,
      question: "Which is the eighth commandment?",
      answer: "The eighth commandment is, Thou shalt not steal. [1]",
      proofTexts: {
        "1": ["Ex. 20:15", "Deut. 5:19"],
      },
    },
    {
      number: 74,
      question: "What is required in the eighth commandment?",
      answer: "The eighth commandment requireth the lawful procuring and furthering the wealth and outward estate of ourselves and others [1].",
      proofTexts: {
        "1": ["Lev. 25:35", "Eph. 4:28b; Phil. 2:4"],
      },
    },
    {
      number: 75,
      question: "What is forbidden in the eighth commandment?",
      answer: "The eighth commandment forbiddeth whatsoever doth, or may, unjustly hinder our own, or our neighbour's, wealth or outward estate [1].",
      proofTexts: {
        "1": ["Prov. 28:19ff; Eph. 4:28a; II Thess. 3:10", "I Tim. 5:8"],
      },
    },
    {
      number: 76,
      question: "Which is the ninth commandment?",
      answer: "The ninth commandment is, Thou shalt not bear false witness against thy neighbour. [1]",
      proofTexts: {
        "1": ["Ex. 20:16", "Deut. 5:20"],
      },
    },
    {
      number: 77,
      question: "What is required in the ninth commandment?",
      answer: "The ninth commandment requireth the maintaining and promoting of truth between man and man, and of our own and our neighbour's good name [1], especially in witness bearing [2].",
      proofTexts: {
        "1": ["Zech. 8:16", "Acts 25:10", "III John 12"], 
        "2": ["Prov. 14:5, 25"],
      },
    },
    {
      number: 78,
      question: "What is forbidden in the ninth commandment?",
      answer: "The ninth commandment forbiddeth whatsoever is prejudicial to truth, or injurious to our own, or our neighbour's, good name [1].",
      proofTexts: {
        "1": ["Lev. 19:16", "Ps. 15:3", "Prov. 6:16-19", "Luke 3:14"],
      },
    },
    {
      number: 79,
      question: "Which is the tenth commandment?",
      answer: "The tenth commandment is, Thou shalt not covet thy neighbour's house, thou shalt not covet thy neighbour's wife, nor his manservant, nor his maidservant, nor his ox, nor his ass, nor anything that is thy neighbour's. [1]",
      proofTexts: {
        "1": ["Ex. 20:17", "Deut. 5:21"],
      },
    },
    {
      number: 80,
      question: "What is required in the tenth commandment?",
      answer: "The tenth commandment requireth full contentment with our own condition [1], with a right and charitable frame of spirit toward our neighbour, and all that is his [2].",
      proofTexts: {
        "1": ["Ps. 34:1", "Phil. 4:11", "ITim. 6:6", "Heb. 13:5"], 
        "2": ["Luke 15:6, 9, 11-32", "Rom. 12:15", "Phil. 2:4"],
      },
    },
    {
      number: 81,
      question: "What is forbidden in the tenth commandment?",
      answer: "The tenth commandment forbiddeth all discontentment with our own estate [1], envying or grieving at the good of our neighbour, and all inordinate motions and affections to anything that is his [2].",
      proofTexts: {
        "1": ["I Cor. 10:10", "Jas. 3:14-16"], 
        "2": ["Gal. 5:26", "Col. 3:5"],
      },
    },
    {
      number: 82,
      question: "Is any man able perfectly to keep the commandments of God?",
      answer: "No mere man, since the fall, is able in this life perfectly to keep the commandments of God, but doth daily break them in thought, word, and deed [1].",
      proofTexts: {
        "1": ["Gen. 8:21", "Rom. 3:9ff, 23"],
      },
    },
    {
      number: 83,
      question: "Are all transgressions of the law equally heinous?",
      answer: "Some sins in themselves, and by reason of several aggravations, are more heinous in the sight of God than others [1].",
      proofTexts: {
        "1": ["Ezek. 8:6, 13, 15", "Matt. 11:20-24", "John 19:11"],
      },
    },
    {
      number: 84,
      question: "What doth every sin deserve?",
      answer: "Every sin deserveth God's wrath and curse, both in this life, and that which is to come [1].",
      proofTexts: {
        "1": ["Matt. 25:41", "Gal. 3:10", "Eph. 5:6", "Jas. 2:10"],
      },
    },
    {
      number: 85,
      question: "What doth God require of us, that we may escape his wrath and curse, due to us for sin?",
      answer: "To escape the wrath and curse of God, due to us for sin, God requireth of us faith in Jesus Christ, repentance unto life [1], with the diligent use of all the outward means whereby Christ communi]cateth to us the benefits of redemption [2].",
      proofTexts: {
        "1": ["Mark 1:15", "Acts 20:21"],
        "2": ["Acts 2:38", "I Cor. 11:24-25", "Col. 3:16"],
      },
    },
    {
      number: 86,
      question: "What is faith in Jesus Christ?",
      answer: "Faith in Jesus Christ is a saving grace [1], whereby we receive and rest upon him alone for salvation, as he is offered to us in the gospel [2].",
      proofTexts: {
        "1": ["Eph. 2:8-9", "cf. Rom. 4:16"], 
        "2": ["John 20:30-31", "Gal. 2:15-16", "Phil. 3:3-11"],
      },
    },
    {
      number: 87,
      question: "What is repentance unto life?",
      answer: "Repentance unto life is a saving grace [1], whereby a sinner, out of a true sense of his sin, and apprehension of the mercy of God in Christ [2], doth, with grief and hatred of his sin, turn from it unto God [3], with full purpose of, and endeavour after, new obedience [4].",
      proofTexts: {
        "1": ["Acts 11:18", "II Tim. 2:25"], 
        "2": ["Ps. 51:1-4", "Joel 2:13", "Luke 15:7, 10", "Acts 2:37"], 
        "3": ["Jer. 31:18-19", "Luke 1:16-17", "I Thess. 1:9"], 
        "4": ["II Chron. 7:14", "Ps. 119:57-64", "Matt. 3:8", "II Cor. 7:10"],
      },
    },
    {
      number: 88,
      question: "What are the outward and ordinary means whereby Christ communicateth to us the benefits of redemption?",
      answer: "The outward and ordinary means whereby Christ communicateth to us the benefits of redemption are, his ordinances, especially the Word, sacraments, and prayer; all which are made effectual to the elect for salvation [1].",
      proofTexts: {
        "1": ["Matt. 28:18-20", "Acts 21:41, 42"],
      },
    },
    {
      number: 89,
      question: "How is the Word made effectual to salvation?",
      answer: "The Spirit of God maketh the reading, but especially the preaching of the Word, an effectual means of convincing and converting sinners, and of building them up in holiness and comfort, through faith, unto salvation [1].",
      proofTexts: {
        "1": ["Neh. 8:8-9", "Acts 20:32", "Rom. 10:14-17", "II Tim. 3:15-17"],
      },
    },
    {
      number: 90,
      question: "How is the Word to be read and heard, that it may become effectual to salvation?",
      answer: "That the Word may become effectual to salvation, we must attend thereunto with diligence, preparation, and prayer [1]; receive it with faith and love, lay it up in our hearts, and practice it in our lives [2].",
      proofTexts: {
        "1": ["Deut. 6:6ff; Ps. 119:18", "I Pet. 2:1-2"], 
        "2": ["Ps. 119:11", "II Thess. 2:10", "Heb. 4:2", "Jas. 1:22-25"],
      },
    },
    {
      number: 91,
      question: "How do the sacraments become effectual means of salvation?",
      answer: "The sacraments become effectual means of salvation, not from any virtue in them, or in him that doth administer them; but only by the blessing of Christ, and the working of his Spirit in them that by faith receive them [1].",
      proofTexts: {
        "1": ["I Cor. 3:7", "cf. I Cor. 1:12-17"],
      },
    },
    {
      number: 92,
      question: "What is a sacrament?",
      answer: "A sacrament is an holy ordinance instituted by Christ [1]; wherein, by sensible signs, Christ, and the benefits of the new covenant, are represented, sealed, and applied to believers [2].",
      proofTexts: {
        "1": ["Matt. 28:19; 26:26-28", "Mark 14:22-25", "Luke 22:19-20", "I Cor. 1:22-26"], 
        "2": ["Gal. 3:27", "I Cor. 10:16-17"],
      },
    },
    {
      number: 93,
      question: "Which are the sacraments of the New Testament?",
      answer: "The sacraments of the New Testament are, Baptism [1], and the Lord's Supper [2].",
      proofTexts: {
        "1": ["Matt. 28:19"], 
        "2": ["ICor 11:23-26"],
      },
    },
    {
      number: 94,
      question: "What is Baptism?",
      answer: "Baptism is a sacrament, wherein the washing with water in the name of the Father, and of the Son, and of the Holy Ghost [1], doth signify and seal our ingrafting into Christ, and partaking of the benefits of the covenant of grace, and our engagement to be the Lord's [2].",
      proofTexts: {
        "1": ["Matt. 28:19"], 
        "2": ["Acts 2:38-42; 22:16", "Rom. 6:3-4", "Gal. 3:26-27", "I Pet. 3:21"],
      },
    },
    {
      number: 95,
      question: "To whom is Baptism to be administered?",
      answer: "Baptism is not to be administered to any that are out of the visible church, till they profess their faith in Christ, and obedience to him [1]; but the infants of such as are members of the visible church are to be baptized [2].",
      proofTexts: {
        "1": ["Acts. 2:41; 8:12, 36, 38; 18:8"], 
        "2": ["Gen. 17:7, 9-11", "Acts 2:38-39; 16:32-33", "Col. 2:11-12"],
      },
    },
    {
      number: 96,
      question: "What is the Lord's Supper?",
      answer: "The Lord's Supper is a sacrament, wherein, by giving and receiving bread and wine, according to Christ's appointment, his death is showed forth [1]; and the worthy receivers are, not after a corporal and carnal manner, but by faith, made partakers of his body and blood, with all his benefits, to their spiritual nourishment, and growth in grace [2].",
      proofTexts: {
        "1": ["Luke 22:19-20", "I Cor. 11:23-26"], 
        "2": ["I Cor. 10:16-17"],
      },
    },
    {
      number: 97,
      question: "What is required for the worthy receiving of the Lord's Supper?",
      answer: "It is required of them that would worthily partake of the Lord's Supper, that they examine themselves of their knowledge to discern the Lord's body, of their faith to feed upon him, of their repentance, love, and new obedience; lest, coming unworthily, they eat and drink judgment to themselves [1].",
      proofTexts: {
        "1": ["I Cor. 11:27-32"],
      },
    },
    {
      number: 98,
      question: "What is prayer?",
      answer: "Prayer is an offering up of our desires unto God [1], for things agreeable to his will [2], in the name of Christ [3], with confession of our sins [4], and thankful acknowledgement of his mercies. [5]",
      proofTexts: {
        "1": ["Ps. 10:17; 62:8", "Matt. 7:7-8"], 
        "2": ["I John 5:14"], 
        "3": ["John 16:23-24"], 
        "4": ["Ps. 32:5-6", "Dan. 9:4-19", "I John 1:9"], 
        "5": ["Ps. 103:1-5; 136", "Phil. 4:6"],
      },
    },
    {
      number: 99,
      question: "What rule hath God given for our direction in prayer?",
      answer: "The whole Word of God is of use to direct us in prayer [1]; but the special rule of direction is that form of prayer which Christ taught his disciples, commonly called The Lord's Prayer. [2]",
      proofTexts: {
        "1": ["I John 5:14"], 
        "2": ["Matt. 6:9-13"],
      },
    },
    {
      number: 100,
      question: "What doth the preface of the Lord's Prayer teach us?",
      answer: "The preface of the Lord's Prayer, which is, Our Father which art in heaven, teacheth us to draw near to God with all holy reverence [1] and confidence [2], as children to a father [3], able and ready to help us [4]; and that we should pray with and for others [5].",
      proofTexts: {
        "1": ["Ps. 95:6"], 
        "2": ["Eph. 3:12"], 
        "3": ["Matt. 7:9-11, cf. Luke 11:11-13", "Rom. 8:15"], 
        "4": ["Eph. 3:20"], 
        "5": ["Eph. 6:18", "I Tim. 2:1-2"],
      },
    },
    {
      number: 101,
      question: "What do we pray for in the first petition?",
      answer: "In the first petition, which is, Hallowed be thy name, we pray, that God would enable us, and others, to glorify him in all that whereby he maketh himself known [1]; and that he would dispose all things to his own glory [2].",
      proofTexts: {
        "1": ["Ps. 67:1-3; 99:3; 100:3-4"], 
        "2": ["Rom. 11:33-36", "Rev. 4:11"],
      },
    },
    {
      number: 102,
      question: "What do we pray for in the second petition?",
      answer: "In the second petition, which is, Thy kingdom come, we pray, that Satan's kingdom may be destroyed [1]; and that the kingdom of grace may be advanced [2], ourselves and others brought into it, and kept in it [3]; and that the kingdom of glory may be hastened [4].",
      proofTexts: {
        "1": ["Matt. 12:25-28", "Rom. 16:20", "I John 3:8"], 
        "2": ["Ps. 72:8-11", "Matt. 24:14", "I Cor. 15:24-25"], 
        "3": ["Ps. 119:5", "Luke 22:32", "II Thess. 3:1-5"], 
        "4": ["Rev. 22:20"],
      },
    },
    {
      number: 103,
      question: "What do we pray for in the third petition?",
      answer: "In the third petition, which is, Thy will be done in earth, as it is in heaven, we pray, that God, by his grace, would make us able and willing to know, obey, and submit to his will in all things [1], as the angels do in heaven [2].",
      proofTexts: {
        "1": ["Ps. 19:14; 119", "I Thess. 5:23", "Heb. 13:20-21"], 
        "2": ["Ps. 103:20-21", "Heb. 1:14"],
      },
    },
    {
      number: 104,
      question: "What do we pray for in the fourth petition?",
      answer: "In the fourth petition, which is, Give us this day our daily bread, we pray that of God's free gift we may receive a competent portion of the good things of this life, and enjoy his blessing with them [1].",
      proofTexts: {
        "1": ["Prov. 30:8-9", "Matt. 6:31-34", "Phil. 4:11, 19", "I Tim. 6:6-8"],
      },
    },
    {
      number: 105,
      question: "What do we pray for in the fifth petition?",
      answer: "In the fifth petition, which is, And forgive us our debts, as we forgive our debtors, we pray that God, for Christ's sake, would freely pardon all our sins [1]; which we are the rather encouraged to ask, because by his grace we are enabled from the heart to forgive others [2].",
      proofTexts: {
        "1": ["Ps. 51:1-2, 7, 9", "Dan. 9:17-19", "I John 1:7"], 
        "2": ["Matt. 18:21-35", "Eph. 4:32", "Col. 3:13"],
      },
    },
    {
      number: 106,
      question: "What do we pray for in the sixth petition?",
      answer: "In the sixth petition, which is, And lead us not into temptation, but deliver us from evil, we pray, that God would either keep us from being tempted to sin [1], or support and deliver us when we are tempted [2].",
      proofTexts: {
        "1": ["Ps. 19:13", "Matt. 26:41", "John 17:15"], 
        "2": ["Luke 22:31-32", "I Cor. 10:13", "II Cor. 12:7-9", "Heb. 2:18"],
      },
    },
    {
      number: 107,
      question: "What doth the conclusion of the Lord's Prayer teach us?",
      answer: "The conclusion of the Lord's Prayer, which is, For thine is the kingdom, and the power, and the glory, for ever, Amen. teacheth us to take our encouragement in prayer from God only [1], and in our prayers to praise him, ascribing kingdom, power, and glory to him [2]; and, in testimony of our desire, and assurance to be heard, we say, Amen. [3]",
      proofTexts: {
        "1": ["Dan. 9:4, 7-9, 16-19", "Luke 18:1, 7-8"], 
        "2": ["I Chron. 29:10-13", "I Tim. 1:17", "Rev. 5:11-13"], 
        "3": ["I Cor. 14:16", "Rev. 22:20"],
      },
    }
  ]

module.exports = (robot) ->

  robot.respond /wsc list/im, (msg) ->
    questions = wscQuestions().map((val, index) ->
      question = "Q#{val.number} - #{val.question}"
      response = bold(question, robot.adapterName)
      """
      #{response}
      """
    )

    chunkedQuestions = []
    while(questions.length)
      chunkedQuestions.push(questions.splice(0, 30));

    sendChunks(msg, chunkedQuestions)

  robot.respond /wsc q ([1-9]$|[1-9]\d$|10[0-7]$)/im, (msg) ->
    questions = wscQuestions()
    question = findByNumber(questions, msg.match[1])
    question = bold(question.question, robot.adapterName)

    msg.send "#{question}"

  robot.respond /wsc a ([1-9]$|[1-9]\d$|10[0-7]$)/im, (msg) ->
    questions = wscQuestions()
    question = findByNumber(questions, msg.match[1])

    msg.send "#{question.answer}"

  robot.respond /wsc qa ([1-9]$|[1-9]\d$|10[0-7]$)/im, (msg) ->
    msg.send getQuestionAndAnswer(msg.match[1], robot.adapterName)

  robot.respond /wsc proof ([1-9]$|[1-9]\d$|10[0-7]$)/im, (msg) ->
    msg.send getQuestionProofs(msg.match[1], robot.adapterName)

  robot.respond /wsc full ([1-9]$|[1-9]\d$|10[0-7]$)/im, (msg) ->
    number = msg.match[1]
    qa = getQuestionAndAnswer(number, robot.adapterName)
    proofs = getQuestionProofs(number, robot.adapterName)

    msg.send """
    #{qa}
    #{proofs}
    """

  robot.respond /wsc random/im, (msg) ->
    questions = wscQuestions()
    question = questions[Math.floor(Math.random() * questions.length)]

    qa = getQuestionAndAnswer(question.number)
    proofs = getQuestionProofs(question.number)

    msg.send """
    #{bold(question.number, robot.adapterName)}. #{qa}
    #{proofs}
    """

getQuestionAndAnswer = (number, adapter) ->
  questions = wscQuestions()
  question = findByNumber(questions, number)
  boldQuestion = bold(question.question, adapter)

  return """
  #{boldQuestion}
  #{question.answer}
  """

getQuestionProofs = (number, adapter) ->
  questions = wscQuestions()
  q = findByNumber(questions, number)
  proofs = q.proofTexts
  proof = ""
  
  for own key, value of proofs
    key = "#{key}:"
    proofNumber = bold(key, adapter)

    proof += """
    #{proofNumber}
    """

    texts = value.join "\n    "
    texts = "    " + texts + "\n\n"

    proof += texts

  return proof

sendChunks = (msg, chunks) ->
  setTimeout(() ->
    chunk = chunks.shift()
    if chunk == undefined
      return
    else
      msg.send chunk.join("\n")
      sendChunks(msg, chunks)
  , 250)

findByNumber = (source, number) ->
  return source.filter((obj) ->
    return +obj.number == +number;
  )[0];

bold = (text, adapter) ->
  switch adapter
    when "discord"
      "**#{text}**"
    when "slack"
      "*#{text}*"
    else
      "#{text}"