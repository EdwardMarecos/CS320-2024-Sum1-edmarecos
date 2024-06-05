####################################################
import sys
sys.path.append('./../..')
from assign02_lib import *
####################################################
print("[import ./../../assign02_lib.py] is done!")
####################################################
#
# Please implement (10 points)
# mylist_quicksort (see list_quicksort in assign02-lib.sml)
#
####################################################
def mylist_append(xs, ys):
    if mylist_nilq(xs):
        return ys
    elif mylist_consq(xs):
        return mylist_cons(xs.arg1, mylist_append(xs.arg2, ys))
    # i used this below, defined in the file 02-05


def mylist_quicksort(xs):
    if mylist_nilq(xs):                         # empty lists are sorted
        return xs
    elif mylist_consq(xs):                      # has at least one element
        pivot = xs.arg1                         # first element of list
        tail = xs.arg2                          # rest of list after pivot
        (ys, zs) = qpart(tail, pivot)           # partition tail into 2 lists
        sorted_ys = mylist_quicksort(ys)        # ys are <= pivot, sort them
        sorted_zs = mylist_quicksort(zs)        # zs are >= pivot, sort them
        return mylist_append(sorted_ys, mylist_cons(pivot, sorted_zs))  # combine full sorted list, ys + pivot + zs

def qpart(xs, pivot):
    if mylist_nilq(xs):
        return mylist_nil(), mylist_nil()       # returns empty lists if inputted that
    elif mylist_consq(xs):                      # has at least one element
        head = xs.arg1                          # set head of list to first arg
        tail = xs.arg2                          # set tail of list to rest of list after head (like pivot and tail)
        (ys, zs) = qpart(tail, pivot)           # recursively partition again in same way as above function
        if head <= pivot:                       # if the first element is <= pivot
            return mylist_cons(head, ys), zs    # attach to ys list
        else:
            return ys, mylist_cons(head, zs)    # attatch to zs list
