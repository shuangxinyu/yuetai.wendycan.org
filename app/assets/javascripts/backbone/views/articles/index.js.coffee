Yuetai.Views.Articles ||= {}

class Yuetai.Views.Articles.IndexView extends Yuetai.Views.Base
  el: $('#main-content')

  render: ->
    # @rm_nav()
    # @clearMsg()
    @render_nav(@opts.section)
    @$el.html(_.template($('#t-articles-index').html())())
    @articles.each(@renderArticle, @)

  renderArticle: (article)->
    snip = @strip(article.get('body'))
    snip = @limit(snip, 300)
    author = @authors.get(article.get('author_id'))
    # article.set('created_at', @handleDate(article.get('created_at')))
    $('#articles-items').append(_.template($('#t-article-item').html())(
      {
        article: article.toJSON(),
        article_snip: snip
        author: author.toJSON()
      }
    ))
