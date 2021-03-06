getBentinkSubtypes <- function(eset) {
	## Classify new samples
  expression.matrix <- t(exprs(eset))
  annot <- fData(eset)
  colnames(annot)[which(colnames(annot) == "EntrezGene.ID")] <- "entrezgene"
  angio <- genefu::ovcAngiogenic(data = expression.matrix, annot=annot, gmap="entrezgene", do.mapping = TRUE)
  eset$Bentink.subtypes <- angio$subtype$subtype
  return(list(Annotated.eset=eset, angio=angio))
}