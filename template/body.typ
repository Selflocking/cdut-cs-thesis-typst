#import "fonts.typ": *

// 重置页码
#counter(page).update(1)

// 公式添加编号
#set math.equation(numbering: "(1)")

#include "../contents/main.typ"
