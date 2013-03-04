" Vim syntax file
" Language: CUDA (NVIDIA Compute Unified Device Architecture)
" Maintainer:   Timothy B. Terriberry <tterribe@users.sourceforge.net>
" Last Change:  2007 Oct 13


" CUDA extentions for function

syn keyword cudaGeneral     cudaMalloc cudaMemcpy cudaFree cudaThreadSynchronize

syn keyword cudaHelper      checkCudaErrors

syn keyword cudaFFT         cufftDestroy cufftExecC2C cufftPlan1d cufftPlan2d

hi def link cudaGeneral     Identifier
hi def link cudaFFT         Identifier
hi def link cudaHelper      Identifier

" vim: ts=8
