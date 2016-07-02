module SodasHelper
  def soda_preview
    body = soda.body.html_safe
    # truncate(soda.body, length: 255, separator: ' ', omission: '... Read More').split(">")

    truncate(body, length: 255, separator: ' ', omission: '...', escape: :true) { link_to('Read More', "sodas/#{soda.title_url}") }
  end
end
