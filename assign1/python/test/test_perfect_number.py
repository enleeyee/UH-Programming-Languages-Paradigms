from parameterized import parameterized

class GetPerfectNumberTest:
       
    @parameterized.expand([
        (6),
        (28),
        ])
    def test_number_is_perfect_true(self, num):
        self.assertTrue(self.get_perfect_number_function()(num))

    @parameterized.expand([
        (0),
        (1),
        (5),
        (7),
        (12),
        (30)
        ])
    def test_number_is_perfect_false(self, num):
        self.assertFalse(self.get_perfect_number_function()(num))
        
if __name__ == '__main__':
    unittest.main()
