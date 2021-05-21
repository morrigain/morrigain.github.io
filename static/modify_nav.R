r <- readLines("~/Git/morrigain.github.io/index.html")
p <- paste(r,collapse="\n")
g <- grep('<div class="main">',r)
G <- grep('</div>',r)
h <- head(G[G>g],1)
top <- r[1:(g-1)]
bottom <- r[(h+1):length(r)]
top <- gsub("static/","../static/",top)
bottom <- gsub("static/","../static/",bottom)
top <- gsub("de/","",top)
bottom <- gsub("de/","",bottom)
top <- gsub("index.html","../index.html",top)
bottom <- gsub("index.html","../index.html",bottom)
d <- dir("~/Git/morrigain.github.io/de",full.names=TRUE)
for(i in seq_along(d)){
  r <- readLines(d[i])
  g <- grep('<div class="main"',r)
  G <- grep('</div>',r)
  h <- head(G[G>g],1)
  middle <- r[g:h]
  R <- c(top,middle,bottom)
  cat(R,sep="\n",file=d[i])
}
