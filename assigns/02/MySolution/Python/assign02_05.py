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
    if mylist_nilq(xs):
        return ys
    elif mylist_consq(xs):
        return mylist_cons(xs.arg1, mylist_append(xs.arg2, ys))

def mylist_rappend(xs, ys):
    if mylist_nilq(xs):
        return ys
    elif mylist_consq(xs):
        return mylist_rappend(xs.arg2, mylist_cons(xs.arg1, ys))

def mylist_reverse(xs):
    return mylist_rappend(xs, mylist_nil())
