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
    from collections import defaultdict

    # Initialize potential characters for each position
    word_length = max(len(hint) for hint in hints)
    potential_chars = [set("abcdefghijklmnopqrstuvwxyz") for _ in range(word_length)]
    fixed_chars = [None] * word_length

    # Apply the hints to the potential characters and fixed characters
    for hint in hints:
        for pos, (k, c) in enumerate(hint):
            if k == 2:
                fixed_chars[pos] = c
                for i in range(word_length):
                    if i != pos:
                        potential_chars[i].discard(c)
            elif k == 0:
                for i in range(word_length):
                    potential_chars[i].discard(c)
            elif k == 1:
                potential_chars[pos].discard(c)

    # Function to find a valid word using backtracking
    def backtrack(position):
        if position == word_length:
            return "".join(fixed_chars)
        if fixed_chars[position] is not None:
            return backtrack(position + 1)
        for c in potential_chars[position]:
            fixed_chars[position] = c
            result = backtrack(position + 1)
            if result:
                return result
        fixed_chars[position] = None
        return None

    return backtrack(0)
########################################################################
