from django.shortcuts import render
from django.http import HttpResponse
from django.core.paginator import Paginator, EmptyPage
from qa.models import Question, Answer
from django.http import Http404


def test(request, *args, **kwargs):
    return HttpResponse('OK')


def paginate(request, qs):
    try:
        limit = int(request.GET.get('limit', 10))
    except ValueError:
        limit = 10
    if limit > 100:
        limit = 10
    try:
        page = int(request.GET.get('page', 1))
    except ValueError:
        raise Http404
    paginator = Paginator.page(qs, limit)
    try:
        page = paginator.page(page)
    except EmptyPage:
        page = paginator.page(paginator.num_pages)
    return page


def question(request, id):
    try:
        post = Question.objects.get(pk=id)
    except Question.DoesNotExist:
        raise Http404("Question does not exist")
    return render(request, 'question.html', { 'post': post, })
