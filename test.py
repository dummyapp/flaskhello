import hello
import unittest


class MyTestCase(unittest.TestCase):

    def setUp(self):
        hello.app.testing = True
        self.app = hello.app.test_client()

    def test_home(self):
        result = self.app.get('/')
