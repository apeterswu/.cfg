" Vim syntax file
" Language: CUDA (NVIDIA Compute Unified Device Architecture)
" Maintainer:   Timothy B. Terriberry <tterribe@users.sourceforge.net>
" Last Change:  2007 Oct 13


" CUDA extentions for cuda type
syn keyword cudaType        cufftComplex cufftDoubleComplex
syn keyword cudaType        cufftHandle

syn keyword cudaFFTConstant CUFFT_FORWARD CUFFT_INVERSE CUFFT_C2C

hi def link cudaType                Type
hi def link cudaFFTConstant         Constant

" vim: ts=8
