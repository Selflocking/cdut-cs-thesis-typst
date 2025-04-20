#import "template/template.typ": *
#import "@preview/numbly:0.1.0": numbly

// 题目
#let title = "论文标题"
#align(center, text(font: ziti.heiti,size: zihao.erhao,weight: "bold")[#title])

// 作者
#let author = "张三"
#let class = "计算机"
#let teacher = "李四"

#align(center)[
  #set text(font:ziti.songti,size: zihao.xiaosan)

  作者姓名：#author
  #h(5%)
  专业名称：#class
  #h(5%)
  指导教师：#teacher
]

// 摘要
#align(center, text(font: ziti.heiti, size: zihao.xiaoer, weight: "bold")[摘要])
#let abstract_zh = [
  本论文主要研究了XXX问题，提出了一种新的解决方案。通过实验验证了该方案的有效性和可行性。
]
#let keywords_zh = ("计算机科学", "算法", "数据结构")

#text(font: ziti.songti, size: zihao.xiaosi)[
  #abstract_zh
]

#linebreak()

#text(font: ziti.heiti, size: zihao.xiaosi,weight: "bold")[
  关键词：#keywords_zh.join("; ")
]

#pagebreak()

#align(center, text(font: ziti.heiti, size: zihao.xiaoer, weight: "bold")[Abstract])
#let abstract_en = [
  This paper mainly studies the XXX problem and proposes a new solution. The effectiveness and feasibility of this solution are verified through experiments.
]
#let keywords_en = ("Computer Science", "Algorithm", "Data Structure")

#text(font: ziti.songti, size: zihao.xiaosi)[
  #abstract_en
]

#linebreak()

#text(font: ziti.heiti, size: zihao.xiaosi,weight: "bold")[
  Key words: #keywords_en.join("; ")
]

#pagebreak()
// 目录
#align(center, text(font: ziti.heiti, size: zihao.xiaoer, weight: "bold")[目录])
#set text(font: ziti.heiti, size: zihao.xiaosi)
#outline(title: "")

#pagebreak()

// 重置页码
#counter(page).update(1)

#let cheader = "成都理工大学2025届学士学位论文（设计）"
// 页眉页脚
#set page(
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
#set heading(numbering: numbly(
  "第{1}章",
  "{1}.{2}",
  "{1}.{2}.{3}"
))

// 一级标题
#show heading.where(level: 1): it => [
  #set align(center)
  #set text(font: ziti.heiti, size: zihao.xiaoer, weight: "bold")
  #it
]
// 二级标题
#show heading.where(level: 2): it => [
  #set text(font: ziti.heiti, size: zihao.xiaosan, weight: "bold")
  #it
]
// 三级标题
#show heading.where(level: 1): it => [
  #set text(font: ziti.heiti, size: zihao.xiaosi, weight: "bold")
  #it
]

// 正文
#set text(font: ziti.songti, size: zihao.xiaosi)

= XXX

== XXX
本论文主要研究了XXX问题，提出了一种新的解决方案。通过实验验证了该方案的有效性和可行性。

=== XXX

本论文主要研究了XXX问题，提出了一种新的解决方案。通过实验验证了该方案的有效性和可行性。
