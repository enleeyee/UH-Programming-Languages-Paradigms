import unittest
from parameterized import parameterized
from test_perfect_number import GetPerfectNumberTest
from src.functional_perfect_number import functional_perfect_number

class FunctionalGetPerfectNumberTest(unittest.TestCase, GetPerfectNumberTest):
       
    def get_perfect_number_function(self):
        return functional_perfect_number
