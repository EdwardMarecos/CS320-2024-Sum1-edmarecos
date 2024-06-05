####################################################
import sys
sys.path.append('./../..')
from assign02_lib import *
####################################################
print("[import ./../../assign02_lib.py] is done!")
####################################################
#
# Please implement (20 points)
# mylist_mergesort (see list_mergesort in assign02-lib.sml)
#
####################################################

# calls split and merge as recursively until its sorted
def mylist_mergesort(xs):
    if mylist_nilq(xs) or mylist_nilq(xs.arg2):         # if its empty, or has one element, then its sorted
        return xs
    else:
        left, right = split(xs)                         # splits the list into two halves
        sorted_left = mylist_mergesort(left)            # recursively sorts left half 
        sorted_right = mylist_mergesort(right)          # recursively sorts right half
        return merge(sorted_left, sorted_right)         # merge the sorted halves

# split list into two halves
def split(xs):
    if mylist_nilq(xs):
        return mylist_nil(), mylist_nil()               # if the input is empty, return two empty lists
    elif mylist_nilq(xs.arg2):
        return xs, mylist_nil()                         # if theres only one element, return the element with an empty list
    else:
        lagging = xs                                    # if theres more than one element, we make two pointers
        leading = xs.arg2                               # lagging is head of list, leading is second element
        while not mylist_nilq(leading) and not mylist_nilq(leading.arg2):
            lagging = lagging.arg2                      # this loop should put lagging at the middle of list
            leading = leading.arg2.arg2                 # and leading at end, 2 jumps for every 1 lagging does
        middle = lagging.arg2                           # middle is set to lagging's last value, the middle
        lagging.arg2 = mylist_nil()                     # ends first half at midpoint, splitting the list
        return xs, middle                               # return the two halves
    
# merge two sorted halves into one larger sorted list
def merge(ys, zs):
    if mylist_nilq(ys):                                 # if arg1 (ys) is empty, we just need arg 2 (zs)
        return zs
    elif mylist_nilq(zs):                               # inverse of above comment
        return ys
    elif ys.arg1 <= zs.arg1:
        return mylist_cons(ys.arg1, merge(ys.arg2, zs)) # if the first element of ys is smaller than the first of zs, build up the merge starting with the smaller
    else:
        return mylist_cons(zs.arg1, merge(ys, zs.arg2)) # imverse of the above comment

