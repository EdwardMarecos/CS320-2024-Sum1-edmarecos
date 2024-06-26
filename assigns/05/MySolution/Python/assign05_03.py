####################################################
#!/usr/bin/env python3
####################################################
# """
# HX-2024-06-14: 10 points
# You are required to implement the following function
# generator_merge2 WITHOUT using streams. A solution that
# uses streams is disqualified.
# """
def generator_merge2(gen1, gen2, lte3):
    # """
    # Given two generators gen1 and gen2 and a comparison
    # function lte3, the function generator_merge2 returns
    # another generator that merges the elements produced by
    # gen1 and gen2 according to the order specified by lte3.
    # The function generator_merge2 is expected to work correctly
    # for both finite and infinite generators.
    # """
    val1 = next(gen1, None)
    val2 = next(gen2, None)
    
    while val1 is not None and val2 is not None:
        if lte3(val1, val2):
            yield val1
            val1 = next(gen1, None)
        else:
            yield val2
            val2 = next(gen2, None)
    
    while val1 is not None:
        yield val1
        val1 = next(gen1, None)
    
    while val2 is not None:
        yield val2
        val2 = next(gen2, None)
####################################################
