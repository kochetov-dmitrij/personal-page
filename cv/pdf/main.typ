#let configuration = yaml("configuration.yaml")
#let settings = yaml("settings.yaml")

#show link: set text(blue)

#set page(
  paper: "a4",
  margin: (
    top: 1.5cm,
    bottom: 1cm,
  )
)

#show heading: h => [
  #set text(
    size: eval(settings.font.size.heading_large),
    font: settings.font.general
  )
  #h
]

#let sidebarSection = {[
  #par(justify: true)[

    #par[
      #set text(
        size: eval(settings.font.size.contacts),
        font: settings.font.minor_highlight,
      )

      Email: #link("mailto:" + configuration.contacts.email) \
      Phone: #link("tel:" + configuration.contacts.phone) \
      LinkedIn: #link(configuration.contacts.linkedin.url)[#configuration.contacts.linkedin.displayText] \
      GitHub: #link(configuration.contacts.github.url)[#configuration.contacts.github.displayText] \
      Website: #link(configuration.contacts.website.url)[#configuration.contacts.website.displayText] \
      Telegram: #link(configuration.contacts.telegram.url)[#configuration.contacts.telegram.displayText] \

      #configuration.contacts.address
    ]
    #line(length: 100%)
  ]

  = Summary

  #par[
    #set text(
        eval(settings.font.size.education_description),
        font: settings.font.minor_highlight,
    )

    #configuration.summary
  ]

  = Education

  #{
    for place in configuration.education [
        #par[
          #set text(
            size: eval(settings.font.size.heading),
            font: settings.font.general
          )
            #{
              if "to" in place and "from" in place [
                #place.from
                – #place.to \
              ] else if "arbitrary_interval" in place [
                #place.arbitrary_interval
              ]
            }
            #link(place.place.link)[#place.place.name]
        ]
        #par[
          #set text(
            eval(settings.font.size.education_description),
            font: settings.font.minor_highlight,
          )
          #{
            let description_items = ()
            if "degree" in place and "major" in place [
              #description_items.push(place.degree + " " + place.major)
            ]
            if "track" in place [
              #description_items.push(place.track + " " + "track")
            ]
            if "note" in place [
              #description_items.push(place.note)
            ]
            if "location" in place [
              #description_items.push(place.location)
            ]
            description_items.join("\n")
          }
        ]
    ]
  }

  = Skills

  #{
    for skill in configuration.skills [
      #par[
        #set text(
          size: eval(settings.font.size.description),
        )
        #set text(
          // size: eval(settings.font.size.tags),
          font: settings.font.minor_highlight,
        )
        *#skill.name*
        #linebreak()
        #skill.items.join(" • ")
      ]
    ]
  }
]}

#let mainSection = {[

  // #par[
  //   #set align(center)
  //   #figure(
  //     image("images/Kodak 20 Zanvoort Lumi.jpg", width: 6em),
  //     placement: top,
  //   )
  // ]

  #par[
    #set text(
      size: eval(settings.font.size.heading_huge),
      font: settings.font.general,
    )
    *#configuration.contacts.name*
  ]

  #par[
    #set text(
      size: eval(settings.font.size.heading),
      font: settings.font.minor_highlight,
      top-edge: 0pt
    )
    #configuration.contacts.title
  ]

  = Experience

  #{
    for job in configuration.jobs [
      #par(justify: false)[
        #set text(
          size: eval(settings.font.size.heading),
          font: settings.font.general
        )
          *#job.position*
          #link(job.company.link)[\@  #job.company.name] \
          #job.from – #job.to
      ]
      #v(-0.5em)
      #par(
        justify: false,
        leading: eval(settings.paragraph.leading)
      )[
        #set text(
          size: eval(settings.font.size.description),
          font: settings.font.general
        )
        #{
          for point in job.description [
            #h(0.1cm) – #point \
          ]
        }
      ]
      #par(
        justify: true,
        leading: eval(settings.paragraph.leading),
      )[
        #set text(
          size: eval(settings.font.size.tags),
          font: settings.font.minor_highlight
        )
        #{
          let tag_line = job.tags.join(" • ")
          tag_line
        }
      ]
    ]
  }

  = Projects

  #{
    for project in configuration.projects [
      #par(
        justify: true,
        leading: eval(settings.paragraph.leading)
      )[
        #v(0.5em)
        #block(spacing: 0.3em)[
          #set text(
            size: eval(settings.font.size.heading),
            font: settings.font.general
          )
          - #{if "year" in project {project.year + " "}}#link(project.project.link)[#project.project.name]
        ]
        #par[
          #set text(
            size: eval(settings.font.size.description),
            font: settings.font.general
          )
          #project.description
        ]
      ]
    ]
  }

  = Hackathons and CTFs

  #{
    for hack in configuration.hackathons [
      #par(
        justify: true,
        leading: eval(settings.paragraph.leading)
      )[
        #v(0.5em)
        #block(spacing: 0.3em)[
          #set text(
            size: eval(settings.font.size.heading),
            font: settings.font.general
          )
          - #hack.year #link(hack.hackathon.link)[#hack.hackathon.name]
        ]
        #par[
          #set text(
            size: eval(settings.font.size.description),
            font: settings.font.general
          )
          #hack.description
        ]
      ]
    ]
  }
]}

#{
  grid(
    columns: (3fr, 5fr),
    column-gutter: 3em,
    sidebarSection,
    mainSection,
  )
}
