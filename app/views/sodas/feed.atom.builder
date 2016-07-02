# encoding: UTF-8

xml.instruct! :xml, version: '1.0'
xml.rss version: '2.0' do
  xml.channel do
    xml.title 'sodacurator.com'
    xml.author 'Joe Hale'
    xml.description 'Project Management, Software Development, Art, Gaming'
    xml.link 'https://www.sodacurator.com'
    xml.language 'en'

    for soda in @sodas
      xml.item do
        if soda.title
          xml.title soda.title.html_safe
        else
          xml.title ''
        end
        xml.author 'Joe Hale'
        xml.pubDate soda.release_date.to_s(:rfc822)
        xml.link 'https://www.sodacurator.com/sodas/' + soda.title_url
        xml.preview soda.preview.html_safe
      end
    end
  end
end
