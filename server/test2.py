from distutils.command.config import config
from latex2sympy2 import latex2sympy, latex2latex

tex = r"\frac{d}{dx}(x^{2}+x)"
print(tex)
print(latex2sympy(tex))

from config import *
from db.connect_db import *

print(get_db_host())