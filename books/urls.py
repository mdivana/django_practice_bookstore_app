from django.urls import path

from .views import BookListView, BookDetailView, SearchResultsListView, BookListViewAPI, BookDetailViewAPI

urlpatterns = [
    path("", BookListView.as_view(), name="book_list"),
    path("<uuid:pk>/", BookDetailView.as_view(), name="book_detail"),
    path("search/", SearchResultsListView.as_view(), name="search_results"),
    path('api/books/', BookListViewAPI.as_view(), name='book_list_api'),
    path('api/books/<uuid:pk>/', BookDetailViewAPI.as_view(), name='book_detail_api'),
]