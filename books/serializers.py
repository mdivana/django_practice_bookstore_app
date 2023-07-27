from rest_framework import serializers

from .models import Book, Review


class BookSerializer(serializers.ModelSerializer):
    class Meta:
        Model = Book
        fields = "__all__"


class ReviewSerializer(serializers.ModelSerializer):
    class Meta:
        Model = Review
        fields = "__all__"
