from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse
from django.core.paginator import Paginator, EmptyPage
from qa.models import Question, Answer
from django.http import Http404, HttpResponseRedirect
from qa.forms import AskForm, AnswerForm
from django.core.urlresolvers import reverse


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
    paginator = Paginator(qs, limit)
    try:
        page = paginator.page(page)
    except EmptyPage:
        page = paginator.page(paginator.num_pages)
    return page, paginator


def qa_list_all(request):
    qa = Question.objects.all()
    qa = qa.order_by('-added_at')
    page, paginator = paginate(request, qa)
    return render(request, 'questions_list.html', {
        'questions': page.object_list,
        'paginator': paginator,
        'page': page, }
    )


def qa_popular_all(request):
    qa = Question.objects.all()
    qa = qa.order_by('-rating')
    page, paginator = paginate(request, qa)
    return render(request, 'questions_popular_list.html', {
        'questions': page.object_list,
        'paginator': paginator,
        'page': page, }
    )


def question(request, id):
    question = get_object_or_404(Question, pk=id)
    answers = Answer.objects.filter(question=question)
    form = AnswerForm(initial={'question': str(id)})
    return render(request, 'question.html', {'question': question, 'answers': answers, 'form': form, })


def ask_add(request):
    if request.method == 'POST':
        form = AskForm(request.POST)
        if form.is_valid():
            post = form.save()
            # url = post.get_url()
            return HttpResponseRedirect(reverse('question', args=[post.id]))
    else:
        form = AskForm()
    return render(request, 'ask_add.html', { 'form': form })


def answer_add(request):
    if request.method == 'POST':
        form = AnswerForm(request.POST)
        if form.is_valid():
            post = form.save()
            # url = post.get_url()
            return HttpResponseRedirect(reverse('question', args=[post.question.id]))
    return HttpResponseRedirect('/')
