{% extends '_layout.swig' %}
{% import '_macro/post-collapse.swig' as post_template with context %}
{% import '_macro/sidebar.swig' as sidebar_template with context %}

{% block title %}{{ page.tag }} | {{ title }} - {{ subtitle }}{% endblock %}

{% block class %}tag{% endblock %}

{% block content %}

  {#################}
  {### TAG BLOCK ###}
  {#################}
  <div class="post-block">
    <div class="posts-collapse">
      <div class="collection-title">
        <h2 class="collection-header">
          {{- page.tag }}
          <small>{{ config.tag_description[page.tag].title }}</small>
        </h2>
      </div>

{################SHUN-ORIGINAL-2020-06-28####################}
<div class="terms-body">
    <div class="terms" id="abstract">
		{%- for abs in config.tag_description[page.tag].abstract %}
		<p class="terms" id="indent">{{ abs }}</p>
		{%- endfor %}
    </div>
    {%- if is_tag() and config.tag_description[page.tag].biblio %}
    {%- for bib in config.tag_description[page.tag].biblio %}
        <div class="terms" id="biblio"><i class="fa fa-book"></i>
		{{ bib }}
    {%- endfor %}
    {%- endif %}
    {%- if is_tag() and config.tag_description[page.tag].confer %}
    {%- for cf in config.tag_description[page.tag].confer %}
		<div class="terms" id="confer"><i class="fa fa-arrow-right"></i><a href="./../{{ cf }}">
		{{ cf }}</a>
		</div>
		{%- endfor %}
    {%- endif %}
    {%- if is_tag() and config.tag_description[page.tag].author %}
    <div class="terms" id="author">
        （{{ config.tag_description[page.tag].author }}）
    </div>
    {%- endif %}
</div>

{################ORIGINAL####################}

      {{ post_template.render(page.posts) }}
    </div>
  </div>
  {#####################}
  {### END TAG BLOCK ###}
  {#####################}

  {% include '_partials/pagination.swig' %}

{% endblock %}

{% block sidebar %}
  {{ sidebar_template.render(false) }}
{% endblock %}



