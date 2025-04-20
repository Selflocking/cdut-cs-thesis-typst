#import "fonts.typ": *
#pagebreak()

#heading(numbering: none)[参考文献]

#v(1em)

#let bibliography_file = "../reference/refs.bib"

#show bibliography: set text(font: ziti.songti,size: zihao.wuhao)
#bibliography(bibliography_file,
      title: none,
      style: "ieee")
