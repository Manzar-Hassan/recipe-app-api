# sample tests

from django.test import SimpleTestCase
from app import calc

class CalcTests(SimpleTestCase):

    def test_add_numbers(self):
        result = calc.add(4,5)
        self.assertEqual(result, 9)

    def test_substract_numbers(self):
        result = calc.sub(10, 10)
        self.assertEqual(result, 0)
    