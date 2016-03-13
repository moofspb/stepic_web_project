from django.conf.urls import patterns, include, url
from django.contrib import admin

urlpatterns = patterns('',
    # Examples:
    url(r'^$', 'qa.views.test'),
    url(r'^login/', 'qa.views.test'),
    url(r'^signup/', 'qa.views.test'),
    url(r'^question/\d+/', 'qa.views.test'),
    url(r'^ask/', 'qa.views.test'),
    url(r'^popular/', 'qa.views.test'),
    url(r'^new/', 'qa.view.test'),
    # url(r'^$', 'ask.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^admin/', include(admin.site.urls)),
)
