using SLATEC
using Documenter

DocMeta.setdocmeta!(SLATEC, :DocTestSetup, :(using SLATEC); recursive=true)

pages = [
    "Home" => "index.md",
    "Reference" => Any[
        "ref/index.md"
        "ref/fnlib.md"
    ],
    "SLATEC TOC" => Any[
        "slatec/index.md"
    ]
]

makedocs(;
    modules=[SLATEC],
    authors="Chengyu HAN <cyhan.dev@outlook.com> and contributors",
    sitename="SLATEC.jl",
    format=Documenter.HTML(;
        # canonical="https://inkydragon.github.io/SLATEC.jl",
        canonical="https://cyhan.dev/SLATEC.jl",
        edit_link="main",
        assets=String[],
    ),
    warnonly=true,
    checkdocs=:exports,
    pages=pages,
)

deploydocs(;
    repo="github.com/inkydragon/SLATEC.jl",
    devbranch="main",
)
