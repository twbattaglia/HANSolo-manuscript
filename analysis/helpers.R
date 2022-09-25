# Functions for easier processing of dropout data
compute_stats = function(deseq2, trt = "Trt", ref = "Mock", lfcThreshold = 0.50, fitType = "local", shrink = "normal", alpha = 0.10, altHypothesis = "less", pAdjustMethod = "fdr", libraryCorrection = F){
  ddsMat.subset = deseq2[,deseq2$Group %in% c(trt, ref)]
  ddsMat.subset$Group = droplevels(ddsMat.subset$Group)
  ddsMat.subset$Group = relevel(ddsMat.subset$Group, ref)
  contrast_oe <- c("Group", trt, ref)
  ddsMat.subset <- DESeq(ddsMat.subset, fitType=fitType)
  res = results(ddsMat.subset, alpha = alpha, contrast = contrast_oe, lfcThreshold=lfcThreshold, altHypothesis=altHypothesis, pAdjustMethod = pAdjustMethod)
  lfc = lfcShrink(ddsMat.subset, coef=2, type=shrink, res = res, lfcThreshold = lfcThreshold)
  
  res %>% 
    summary()

  out = res %>% 
    as.data.frame() %>% 
    rownames_to_column("oligo_id") %>% 
    mutate(log2FoldChangeShrunken = lfc$log2FoldChange) %>% 
    mutate(padj = if_else(padj == 0.000000e+00, 5e-324, padj)) # Set to lowest possible R value
  
  return(out)
  
}

# Function to filter low counts (bottom 5%)
filter_low = function(input, percentile = 0.05){
  
  counts.temp <- input %>% 
    estimateSizeFactors() %>% 
    counts(., normalized = TRUE) %>% 
    as.data.frame() %>% 
    rownames_to_column("oligo_id")
  
  metrics <- counts.temp %>% 
    gather(sample, norm.counts, -oligo_id) %>%  
    group_by(oligo_id) %>% 
    summarise(sum = sum(norm.counts),
              mean = mean(norm.counts),
              median = median(norm.counts),
              sd = sd(norm.counts),
              c.v = sd/mean) 
  
  # Keep passing
  passing.idx = metrics %>% 
    filter(mean >= quantile(metrics$mean, percentile)) %>% 
    pull(oligo_id)
  
  # Filter table
  counts.temp.fil = counts.temp %>% 
    filter(oligo_id %in% passing.idx)
  
  # Filter table
  input.fil = input[passing.idx,]
  input.fil <- estimateSizeFactors(input.fil)
  return(input.fil)
}


# Function to filter low counts (bottom 5%)
remove_lowcounts = function(input, percentile = 0.05){
  
  # Keep passing
  passing.idx = input %>% 
    filter(baseMean >= quantile(baseMean, percentile)) %>% 
    pull(Gene)
  
  # Filter table
  input %>% 
    filter(Gene %in% passing.idx)
  
}



