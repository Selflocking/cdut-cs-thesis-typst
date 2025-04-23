import os
import sys
import subprocess
from pathlib import Path

def ensure_pdf2docx():
	try:
		from pdf2docx import Converter
	except ImportError:
		# 检查是否有虚拟环境
		venv_dir = os.path.join(os.path.dirname(__file__), '.venv')
		if not os.path.exists(venv_dir):
			subprocess.check_call([sys.executable, '-m', 'venv', venv_dir])
		
		pip_path = os.path.join(venv_dir, 'bin', 'pip') if os.name != 'nt' else os.path.join(venv_dir, 'Scripts', 'pip.exe')
		# 检查是否安装了pdf2docx
		if subprocess.call([pip_path, 'show', 'pdf2docx']) != 0:
			# 安装pdf2docx
			subprocess.check_call([pip_path, 'install', 'pdf2docx'])
		# 重新执行当前脚本
		python_path = os.path.join(venv_dir, 'bin', 'python') if os.name != 'nt' else os.path.join(venv_dir, 'Scripts', 'python.exe')
		os.execv(python_path, [python_path] + sys.argv)

ensure_pdf2docx()

from pdf2docx import Converter

# 从args中解析pdf地址
if len(sys.argv) < 2:
	print("Usage: python convert.py <pdf_file>")
	sys.exit(1)

pdf_file = sys.argv[1]
pdf = Path(pdf_file)
docx = pdf.with_suffix('.docx')

# convert pdf to docx
cv = Converter(pdf)
cv.convert(docx)
cv.close()
