table2 <- function(original_title1,
                   original_title2,
                   original_title3, 
                   year1, 
                   year2, 
                   year3, 
                   avg_vote1,
                   avg_vote2,
                   avg_vote3) {
  tagList(HTML(glue::glue('



<body>
    <div class="card">
        
        <div> <span class="position"> 2 </span></div>
        <div class="title">{original_title2}</div>
      
        <div class="icon">
            <i class="fas fa-award iconviz"style="color : #e2e2e3;"></i>
        </div><!--/icon-->
      
        <div class="features">
            <ul>
              <li><span><i class="fas fa-thumbs-up"></i></span> Average vote : {avg_vote2}</li>
              <li><span><i class="fas fa-calendar-alt"></i></span> Year Published : {year2}</li>
            </ul>
          </div><!--/features-->
      

      
      </div><!--/card-->
      
      <div class="card">
        <div> <span class="position"> 1 </span></div>
        <div class="title">{original_title1}</div>
        
        <div class="icon">
            <i class="fas fa-medal iconviz" style="color : #FFD700;"></i>
          
        </div><!--/icon-->
      
        <div class="features">
          <ul>
            <li><span><i class="fas fa-thumbs-up"></i></span> Average vote : {avg_vote1}</li>
            <li><span><i class="fas fa-calendar-alt"></i></span> Year Published : {year1}</li>
          </ul>
        </div><!--/features-->
      
        
      
      </div><!--/card-->
      
      <div class="card">
      
        <div> <span class="position"> 3 </span></div>
        <div class="title">{original_title3}</div>
      
        <div class="icon">
            <i class="fas fa-award iconviz"style="color : #CD7F32;"></i>
        </div><!--/icon-->
      
        <div class="features">
            <ul>
              <li><span><i class="fas fa-thumbs-up"></i></span> Average vote : {avg_vote3}</li>
              <li><span><i class="fas fa-calendar-alt"></i></span> Year Published : {year3}</li>
            </ul>
          </div><!--/features-->
      
        
      
      </div><!--/card-->
      
      
      
</body>


                          ')
              )
          )
}