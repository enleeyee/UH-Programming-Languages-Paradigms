import unittest
from parameterized import parameterized
from test_perfect_number import GetPerfectNumberTest
from src.imperative_perfect_number import imperative_perfect_number

class ImperativeGetPerfectNumberTest(unittest.TestCase, GetPerfectNumberTest):

    def test_canary(self):
        self.assertTrue(True)
       
    def get_perfect_number_function(self):
        return imperative_perfect_number
