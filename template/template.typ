#import "fonts.typ": *

#let conf(title,doc) = {
  // A4 尺寸，边距 2.54cm
  set page(size: A4, margin: 2.54cm)
  // 设置标题

  doc
}
