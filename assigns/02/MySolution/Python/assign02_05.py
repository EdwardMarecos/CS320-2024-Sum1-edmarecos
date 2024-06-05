####################################################
import sys
sys.path.append('./../..')
from assign02_lib import *
####################################################
print("[import ./../assign02_lib.py] is done!")
####################################################
#
# Please implement (20 points)
# mylist_append (see list_append in assign02-lib.sml)
# mylist_rappend (see list_rappend in assign02-lib.sml)
# mylist_reverse (see list_reverse in assign02-lib.sml)
#
####################################################

def mylist_append(xs, ys):
    if mylist_nilq(xs):         # if arg1 is empty, return arg2
        return ys
    elif mylist_consq(xs):      # else build up combined list by iterating through arg1
        return mylist_cons(xs.arg1, mylist_append(xs.arg2, ys))

def mylist_rappend(xs, ys):
    if mylist_nilq(xs):         # same as above
        return ys
    elif mylist_consq(xs):      # build up combined list but with xs in reverse
        return mylist_rappend(xs.arg2, mylist_cons(xs.arg1, ys))

def mylist_reverse(xs):         # uses the rappend to build xs in reverse, attatched to an empty list
    return mylist_rappend(xs, mylist_nil())
