using SLATEC
using Documenter

DocMeta.setdocmeta!(SLATEC, :DocTestSetup, :(using SLATEC); recursive=true)

makedocs(;
    modules=[SLATEC],
    authors="Chengyu HAN <cyhan.dev@outlook.com> and contributors",
    sitename="SLATEC.jl",
    format=Documenter.HTML(;
        canonical="https://inkydragon.github.io/SLATEC.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/inkydragon/SLATEC.jl",
    devbranch="main",
)
