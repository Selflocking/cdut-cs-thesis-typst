#import "fonts.typ": *
#import "../contents/info.typ" as info
#import "../contents/abstract.typ" as abstract
#import "@preview/numbly:0.1.0": numbly

#let Thesis() = {
  set page(paper: "a4", margin: 2.54cm)
  // 题目
  align(center, text(font: ziti.heiti,size: zihao.erhao,weight: "bold")[#info.title])

  // 作者
  align(center)[
  #set text(font:ziti.songti,size: zihao.xiaosan)
    作者姓名：#info.name
    #h(1fr)
    专业名称：#info.class
    #h(1fr)
    指导教师：#info.teacher
  ]

  // 摘要
  align(center, text(font: ziti.heiti, size: zihao.xiaoer, weight: "bold")[摘要])

  text(font: ziti.songti, size: zihao.xiaosi)[
    #abstract.abstract_zh
  ]

  linebreak()
  linebreak()

  text(font: ziti.heiti, size: zihao.xiaosi,weight: "bold")[
    关键词：#abstract.keywords_zh.join("; ")
  ]

  pagebreak()

  align(center, text(font: ziti.heiti, size: zihao.xiaoer, weight: "bold")[Abstract])

  text(font: ziti.songti, size: zihao.xiaosi)[
    #abstract.abstract_en
  ]

  linebreak()
  linebreak()

  text(font: ziti.heiti, size: zihao.xiaosi,weight: "bold")[
    Key words: #abstract.keywords_en.join("; ")
  ]

  pagebreak()

  // 目录
  align(center, text(font: ziti.heiti, size: zihao.xiaoer, weight: "bold")[目录])
  set text(font: ziti.heiti, size: zihao.xiaosi)
  outline(title: "")

  pagebreak()
  let cheader = "成都理工大学" + info.year +"学士学位论文（设计）"
  // 页眉页脚
  set page(
    header: [
    #set align(center)
    #set text(font: ziti.songti,size: zihao.xiaowu)
    #cheader
    // 下划线
    #v(-0.8em)
    #line(length: 100%)
  ],
    numbering: "1"
  )

  // 设置标题格式
  set heading(numbering: numbly(
    "第{1}章",
    "{1}.{2}",
    "{1}.{2}.{3}"
  ))

  // 一级标题
  show heading.where(level: 1): it => [
    #set align(center)
    #set text(font: ziti.heiti, size: zihao.xiaoer, weight: "bold")
    #pagebreak(weak: true)
    #it
  ]
  // 二级标题
  show heading.where(level: 2): it => [
    #set text(font: ziti.heiti, size: zihao.xiaosan, weight: "bold")
    #it
  ]
  // 三级标题
  show heading.where(level: 1): it => [
    #set text(font: ziti.heiti, size: zihao.xiaosi, weight: "bold")
    #it
  ]

  // 正文
  set text(font: ziti.songti, size: zihao.xiaosi)

  // 正文
  include "body.typ"

  // 结论
  include "conclusion.typ"

  // 致谢
  include "acknowledgement.typ"

  // 参考文献
  include "reference.typ"

  // 附录
  include "appendix.typ"
}
