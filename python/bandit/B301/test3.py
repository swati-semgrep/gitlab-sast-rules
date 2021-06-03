#!/usr/bin/env python

import dill

cube = lambda x: x * x *x
pickle_ans = dill.dumps(cube)
print(pickle_ans)
