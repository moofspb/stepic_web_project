from django.conf.urls import patterns, include, url
from qa.views import test, question, qa_list_all, /
qa_popular_all, ask_add, answer_add

urlpatterns = patterns('',
    url(r'^$', qa_list_all, name='main'),
    url(r'^\?page=(?P<page>\d+)', qa_list_all, name='main'),
    url(r'^login/', test, name='login'),
    url(r'^signup/', test, name='signup'),
    url(r'^question/(?P<id>\d+)/', question, name='question'),
    url(r'^ask/', ask_add, name='ask'),
    url(r'^answer/', answer_add, name='answer')
    url(r'^popular/', qa_popular_all, name='popular'),
    url(r'^popular/\?page=(?P<page>\d+)', qa_popular_all, name='popular'),
    url(r'^new/', test, name='new'),

)
