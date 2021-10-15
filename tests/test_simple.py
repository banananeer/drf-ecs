from django.test import SimpleTestCase


class TestSimple(SimpleTestCase):
    def test_add(self):
        assert 2 + 2 == 4
