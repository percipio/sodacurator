User.create!([{
               first_name: 'Joe',
               last_name: 'Hale',
               email: 'jmartyhale@gmail.com',
               username: 'percipio',
               password: '12cartoon',
               password_confirmation: '12cartoon',
               admin: true,
               activated: true
             }])
Bottler.create!([{
                  name: "Henry's",
                  name_url: 'henrys',
                  url: 'http://www.henrys.com',
                  featured: false,
                  description: "<p>Giving your best work away for free gives your customers a valid idea of the quality and value you provide. Those that don't want to pay won't ever become you customers.</p>"
                },
                 {
                   name: 'Jones',
                   name_url: 'jones',
                   url: 'http://www.jonessoda.com',
                   featured: true,
                   description: "<p>Giving your best work away for free gives your customers a valid idea of the quality and value you provide. Those that don't want to pay won't ever become you customers.</p>"
                 }])
Soda.create!([{
               title: 'Root Beer',
               preview: "<p>Giving your best work away for free gives your customers a valid idea of the quality and value you provide. Those that don't want to pay won't ever become you customers.</p>",
               body: "<p>Giving your best work away for free gives your customers a valid idea of the quality and value you provide. Those that don't want to pay won't ever become you customers. They wouldn't have been your customers anyways. Those that are willing to pay will know the quality they will get by doing so. They'll also turn into your most loyal fans because they get to see your work without a gatekeeper.</p>",
               release_date: Time.parse('2016-05-10'),
               title_url: 'jones-root-beer',
               url: '#',
               rating: 4,
               featured: true,
               bottler_id: 1,
               published: true
             },
              {
                title: 'Grape Soda',
                preview: "<p>Giving your best work away for free gives your customers a valid idea of the quality and value you provide. Those that don't want to pay won't ever become you customers.</p>",
                body: "<p>Giving your best work away for free gives your customers a valid idea of the quality and value you provide. Those that don't want to pay won't ever become you customers. They wouldn't have been your customers anyways. Those that are willing to pay will know the quality they will get by doing so. They'll also turn into your most loyal fans because they get to see your work without a gatekeeper.</p>",
                release_date: Time.parse('2016-05-5'),
                title_url: 'jones-grape-soda',
                url: '#',
                rating: 3,
                featured: false,
                bottler_id: 1,
                published: true
              },
              {
                title: 'Birch Beer',
                preview: "<p>Giving your best work away for free gives your customers a valid idea of the quality and value you provide. Those that don't want to pay won't ever become you customers.</p>",
                body: "<p>Giving your best work away for free gives your customers a valid idea of the quality and value you provide. Those that don't want to pay won't ever become you customers. They wouldn't have been your customers anyways. Those that are willing to pay will know the quality they will get by doing so. They'll also turn into your most loyal fans because they get to see your work without a gatekeeper.</p>",
                release_date: Time.parse('2016-05-5'),
                title_url: 'jones-birch-beer',
                url: '#',
                rating: 4,
                featured: true,
                bottler_id: 1,
                published: true
              },
              {
                title: 'Cream Soda',
                preview: "<p>Giving your best work away for free gives your customers a valid idea of the quality and value you provide. Those that don't want to pay won't ever become you customers.</p>",
                body: "<p>Giving your best work away for free gives your customers a valid idea of the quality and value you provide. Those that don't want to pay won't ever become you customers. They wouldn't have been your customers anyways. Those that are willing to pay will know the quality they will get by doing so. They'll also turn into your most loyal fans because they get to see your work without a gatekeeper.</p>",
                release_date: Time.parse('2016-05-5'),
                title_url: 'henrys-cream-soda',
                url: '#',
                rating: 5,
                featured: false,
                bottler_id: 0,
                published: true
              },
              {
                title: 'Root Beer',
                preview: "<p>Giving your best work away for free gives your customers a valid idea of the quality and value you provide. Those that don't want to pay won't ever become you customers.</p>",
                body: "<p>Giving your best work away for free gives your customers a valid idea of the quality and value you provide. Those that don't want to pay won't ever become you customers. They wouldn't have been your customers anyways. Those that are willing to pay will know the quality they will get by doing so. They'll also turn into your most loyal fans because they get to see your work without a gatekeeper.</p>",
                release_date: Time.parse('2016-05-5'),
                title_url: 'henrys-root-beer',
                url: '#',
                rating: 5,
                featured: false,
                bottler_id: 0,
                published: true
              }])
