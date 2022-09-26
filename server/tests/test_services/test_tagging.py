import pytest

from services.tagging import *

class TestEquations:
    def test_basic_equation(self):
        assert tag_equation("x=y") == True

    def test_basic_equation_with_spaces(self):
        assert tag_equation("x = y") == True

    def test_basic_equation_with_spaces_and_operators(self):
        assert tag_equation("x = y + 3") == True

    def test_basic_statement(self):
        assert tag_equation("x+3-y") == False

    def test_basic_statement_with_spaces(self):
        assert tag_equation("x + 3 - y") == False

    def test_basic_statement_with_spaces_and_operators(self):
        assert tag_equation("x + 3 - y + 3") == False

    def test_advanced_equation(self):
        assert tag_equation("f(x)=x^{3}+x^{2}-10 x+8") == True

    def test_advanced_statement(self):
        assert tag_equation("\\frac{4 x^{6}-12 x^{3}+8 x^{2}}{2 x}") == False

    #edge cases:
    def test_equation_with_nothing_around_equals(self):
        assert tag_equation("=") == False
    
    def test_equation_with_nothing_left_equals(self):
        assert tag_equation("=5x + 3") == False

    def test_equation_with_nothing_right_equals(self):
        assert tag_equation("y+x=") == False

class TestFunctions:
    def test_basic_function(self):
        assert tag_function("f(x)=y") == True

    def test_basic_function_with_spaces(self):
        assert tag_function("f(x) = y") == True

    def test_basic_function_with_spaces_and_operators(self):
        assert tag_function("f(x) = y + 3") == True

    def test_basic_statement(self):
        assert tag_function("x+3-y") == False

    def test_basic_statement_with_spaces(self):
        assert tag_function("x + 3 - y") == False

    def test_basic_statement_with_spaces_and_operators(self):
        assert tag_function("x + 3 - y + 3") == False

    def test_advanced_function(self):
        assert tag_function("f(x)=x^{3}+x^{2}-10 x+8") == True

    def test_advanced_statement(self):
        assert tag_function("\\frac{4 x^{6}-12 x^{3}+8 x^{2}}{2 x}") == False

    #edge cases:
    def test_function_with_differential(self):
        assert tag_function("{r}'(x)=y") == True

    def test_function_with_multiple_differentials(self):
        assert tag_function("{h}'''(x)= 2x + 3") == True

class TestStatement:
    def test_basic_statement(self):
        assert tag_statement("x+3-y") == True

    def test_basic_statement_with_spaces(self):
        assert tag_statement("x + 3 - y") == True

    def test_basic_statement_with_spaces_and_operators(self):
        assert tag_statement("x + 3 - y + 3") == True

    def test_basic_function(self):
        assert tag_statement("f(x)=y") == False

    def test_basic_function_with_spaces(self):
        assert tag_statement("f(x) = y") == False

    def test_basic_function_with_spaces_and_operators(self):
        assert tag_statement("f(x) = y + 3") == False

    def test_advanced_statement(self):
        assert tag_statement("\\frac{4 x^{6}-12 x^{3}+8 x^{2}}{2 x}") == True

    def test_advanced_function(self):
        assert tag_statement("f(x)=x^{3}+x^{2}-10 x+8") == False

class TestInequality:
    def test_basic_statement(self):
        assert tag_inequality("x+3-y") == False

    def test_basic_function(self):
        assert tag_inequality("f(x)=y") == False

    def test_advanced_statement(self):
        assert tag_inequality("\\frac{4 x^{6}-12 x^{3}+8 x^{2}}{2 x}") == False

    def test_advanced_function(self):
        assert tag_inequality("f(x)=x^{3}+x^{2}-10 x+8") == False

    def test_basic_inequality(self):
        assert tag_inequality("x+3 > 7") == True

    def test_basic_inequality2(self):
        assert tag_inequality("x+3 < 7") == True

    def test_basic_inequality3(self):
        assert tag_inequality("x+3 <= 7") == True

    def test_basic_inequality4(self):
        assert tag_inequality("x+3 >= 7") == True

    def test_advanced_inequality(self):
        assert tag_inequality("\\frac{b-3}{2}+1<\\frac{b}{4}-4, b \\in \\mathbb{R}") == True

class TestDifferentation:
    def test_diff1(self):
        assert tag_differentiation("{r}'(x)=y") == True

    def test_diff2(self):
        assert tag_differentiation("{h}'''(x)= 2x + 3") == True

    def test_diff3(self):
        assert tag_differentiation("f(x)=x^{3}+x^{2}-10 x+8") == False

class TestIntegration:
    def test_int1(self):
        assert tag_integration("\\int 4x^2 +3x") == True

    def test_int2(self):
        assert tag_integration("\\int_{a}^{b}5x^2") == True

    def test_int3(self):
        assert tag_integration("{h}'''(x)= 2x + 3") == False

    def test_int4(self):
        assert tag_integration("f(x)=x^{3}+x^{2}-10 x+8") == False

class TestLimits:
    def test_limit1(self):
        assert tag_limits("\\lim _{x \\rightarrow 4} \\frac{x^{3}-2 x^{2}+3 x}{x^{2}-3 x-4}") == True

    def test_limit2(self):
        assert tag_limits("\\lim _{h \\rightarrow 0} \\frac{g(x+h)-g(x)}{h}") == True

    def test_limit3(self):
        assert tag_limits("\\int_{a}^{b}5x^2") == False

class TestQuadraticEquation:
    def test_quad1(self):
        assert tag_quadratic("3 x^{2}+x-7") == True

    def test_quad2(self):
        assert tag_quadratic("T_{\\mathrm{n}}=3 n^{2}-2 n+1") == True

    def test_quad3(self):
        assert tag_quadratic("\\sqrt{(x+y)} \\times \\frac{1}{(x+y)^{\\frac{5}{2}}}=\\frac{1}{x^{2}+2 x y+y^{2}}") == False

    #edge cases:
    def test_quad_function(self):
        assert tag_quadratic("y=3 x^{2}+5 x") == True

    def test_quad_multiple_exponents(self):
        assert tag_quadratic("y=3 x^{2}+5 x+x^{2}") == False

class TestTrig:
    def test_trig1(self):
        assert tag_trigonemtric("y=\\sin 3 \\theta") == True

    def test_trig2(self):
        assert tag_trigonemtric("\\frac{4 \\sin 15^{\\circ} \\cos 15^{\\circ}}{2 \\sin ^{2} 15^{\\circ}-1}") == True

    def test_trig3(self):
        assert tag_trigonemtric("\\lim _{x \\rightarrow 4} \\frac{x^{3}-2 x^{2}+3 x}{x^{2}-3 x-4}") == False

class TestSurds:
    def test_surd1(self):
        assert tag_surds("\\frac{\\sqrt{y}-4}{\\sqrt{y}-2}") == True

    def test_surd2(self):
        assert tag_surds("\\sqrt{(x+y)} \\times \\frac{1}{(x+y)^{\\frac{5}{2}}}=\\frac{1}{x^{2}+2 x y+y^{2}}") == True

    def test_surd3(self):
        assert tag_surds("\\frac{4 \\sin 15^{\\circ} \\cos 15^{\\circ}}{2 \\sin ^{2} 15^{\\circ}-1}") == False