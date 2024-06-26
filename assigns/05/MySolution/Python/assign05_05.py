########################
# HX-2024-06-14: 30 points
########################
# """
# Given a history of wordle hints, this function returns a
# word as the player's guess. THIS GUESS SHOULD NOT CONTRADICT
# ANY ONE OF THE HINTS GIVEN.
# """
########################################################################
def wordle_guess(hints):
# alph = "abcdefghijklmnopqrstuvwxyz"
#     keep = ""
#     hold = ()
#     out = ""
#     count1 = 0
#     for hint in hints:
#         if hint[0] == 1:
#             keep += hint[1]
#             count += 1
#         elif hint[0] == 2:
#             hold.append((hint[1], count))
#             keep += "_"
#             count += 1
#         else:
#             keep += "_"
#             out += hint[1]
#             count += 1
    
#     for letter in range(len(keep)):
#         if keep[letter] == "_":
#             if hold != ():
#                 for held in hold:
#                     if held[1] != letter and held[0] != "_":
#                         keep[letter] = held[0]
#                         held[0] = "_"
#                         break
#             else:
#                 for lt in alph:
#                     if lt not in out:
#                         keep[letter] = lt
#                         break

#         # string_foldleft(hints, "", (acc, (ind, let) =>))
#     return keep
# Initialize the alphabet and variables to hold the state
    alph = "abcdefghijklmnopqrstuvwxyz"
    keep = list("_" * len(hints[0]))  # Start with underscores for the word guess
    hold = []  # Holds letters that are correct but in the wrong position
    out = set()  # Set of letters that are definitely not in the word

    # Process each hint
    for hint in hints:
        for i, (k, c) in enumerate(hint):
            if k == 2:
                keep[i] = c  # Fixed position
            elif k == 1:
                hold.append((c, i))  # Correct letter but wrong position
            elif k == 0:
                out.add(c)  # Letter not in the word

    # Fill in the letters that are correct but in the wrong position
    for letter, wrong_pos in hold:
        for i in range(len(keep)):
            if keep[i] == "_" and i != wrong_pos and letter not in keep:
                keep[i] = letter
                break

    # Fill in the remaining positions with valid letters
    for i in range(len(keep)):
        if keep[i] == "_":
            for letter in alph:
                if letter not in out and letter not in keep:
                    keep[i] = letter
                    break

    return "".join(keep)
########################################################################
