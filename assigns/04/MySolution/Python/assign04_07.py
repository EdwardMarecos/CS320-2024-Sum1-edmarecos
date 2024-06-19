####################################################
#!/usr/bin/env python3
####################################################
import sys
sys.path.append('./../..')
####################################################
from assign04_lib import *
####################################################
# """
# HX-2024-06-01: 20 points
# Solving the doublet puzzle
# """
####################################################
# Helper function to check if two words are 1-step doublets
def is_doublet(word1, word2):
    if len(word1) != len(word2):
        return False
    return sum(c1 != c2 for c1, c2 in zip(word1, word2)) == 1

# Generate all possible 1-step doublets of a word
def generate_doublets(word, word_list):
    return [w for w in word_list if is_doublet(word, w)]

# Enumerate all tuples where the first element is the given word and consecutive words are 1-step doublets
def doublet_stream_from(word, word_list):
    def helper(prefix, word):
        doublets = generate_doublets(word, word_list)
        yield prefix
        for d in doublets:
            yield from helper(prefix + [d], d)
    return helper([word], word)

# Example usage
word_list = ["cat", "bat", "rat", "hat", "bad", "had"]
doublet_stream = doublet_stream_from("cat", word_list)

for _ in range(5):
    print(next(doublet_stream))


# """
# ######
# Given a word w1 and another word w2, w1 and w2 are a
# 1-step doublet if w1 and w2 differ at exactly one position.
# For instance, 'water' and 'later' are a 1-step doublet.
# The doublet relation is the reflexive and transitive closure
# of the 1-step doublet relation. In other words, w1 and w2 are
# a doublet if w1 and w2 are the first and last of a sequence of
# words where every two consecutive words form a 1-step doublet.
# Here is a little website where you can use to check if two words
# for a doublet or not:
# http://ats-lang.github.io/EXAMPLE/BUCS320/Doublets/Doublets.html
# ######
# Given a word, the function [doublet_stream_from] returns a stream
# enumerating *all* the tuples such that the first element of the tuple
# is the given word and every two consecutive words in the tuple form a
# 1-step doublet. The enumeration of tuples should be done so that shorter
# tuples are always enumerated ahead of longer ones.
# ######
# """

####################################################
