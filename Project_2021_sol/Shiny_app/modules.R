table <- function(original_title, year, director, genre, writer, duration, 
                  production_company, country, actors, language, avg_vote,
                  budget, description) {
  tagList(HTML(glue::glue('
  
<table border="0" cellpadding="0" cellspacing="0" width="auto" style="border-collapse:
 collapse;table-layout:fixed ;width:auto">
 
       <colgroup><col width=auto span="2" style="mso-width-source:userset;mso-width-alt:7862;
       width:161pt">
         <col width="215" style="mso-width-source:userset;mso-width-alt:7862;width:161pt">
         <col width="215" style="mso-width-source:userset;mso-width-alt:7862;width:161pt">
         <col width="80" span="3" style="width:60pt">
       </colgroup><tbody><tr height="20" style="height:15.0pt">
   
      <td colspan="4" rowspan="2" height="40" class="xl66" width="860" style="height:30.0pt; width:644pt;display:table-cell">
        <div style="margin-right:10px" contenteditable="false">{original_title}</div>
      </td>
      <td rowspan="2" class="xl65" width="80" style="width:60pt">
        <div style="margin-right:10px"></div>
      </td>
        <td rowspan="2" class="xl65" width="80" style="width:60pt">
        <div style="margin-right:10px"></div>
      </td>
      <td rowspan="2" class="xl65" width="80" style="width:60pt">
        <div style="margin-right:10px"></div>
      </td>
   </tr>
   <tr height="20" style="height:15.0pt">
   </tr>
 <tr height="76" style="height:57.0pt">
  <td height="76" class="xl67" width="auto" style="height:57.0pt;width:161pt;
  display:table-cell">
  <div style="margin-right:10px">Year Published</div></td>
  <td class="xl70" width="215" style="width:161pt">
  <div style="margin-right:10px">{year}</div></td>
  <td class="xl67" width="215" style="width:161pt">
  <div style="margin-right:10px">Director</div></td>
  <td class="xl70" width="215" style="width:161pt">
  <div style="margin-right:10px">{director}</div>
  </td>
  <td></td>
  <td colspan="2" style="mso-ignore:colspan"></td>
 </tr>
 <tr height="38" style="height:28.5pt">
  <td height="38" class="xl68" width="215" style="height:28.5pt;border-top:none;
  width:161pt;display:table-cell">
  <div style="margin-right:10px">Genre</div></td>
  <td class="xl71" width="215" style="border-top:none;width:161pt">
  <div style="margin-right:10px">{genre}</div></td>
  <td class="xl68" width="215" style="border-top:none;width:161pt">
  <div style="margin-right:10px">Writer(s)</div></td>
  <td class="xl71" width="215" style="border-top:none;width:161pt">
  <div style="margin-right:10px">{writer}</div>
  </td>
  <td></td>
  <td colspan="2" style="mso-ignore:colspan"></td>
 </tr>
 <tr height="76" style="height:57.0pt">
  <td height="76" class="xl68" width="215" style="height:57.0pt;border-top:none;
  width:161pt;display:table-cell">
  <div style="margin-right:10px">Duration (m)</div></td>
  <td class="xl71" width="215" style="border-top:none;width:161pt">
  <div style="margin-right:10px">{duration}</div></td>
  <td class="xl68" width="215" style="border-top:none;width:161pt">
  <div style="margin-right:10px">Production company</div></td>
  <td class="xl71" width="215" style="border-top:none;width:161pt">
  <div style="margin-right:10px">{production_company}</div>
  </td>
  <td colspan="3" style="mso-ignore:colspan"></td>
 </tr>
 <tr height="38" style="height:28.5pt">
  <td height="38" class="xl69" width="215" style="height:28.5pt;border-top:none;
  width:161pt;display:table-cell">
  <div style="margin-right:10px">Country</div></td>
  <td class="xl71" width="215" style="border-top:none;width:161pt">
  <div style="margin-right:10px">{country}</div></td>
  <td class="xl68" width="215" style="border-top:none;width:161pt">
  <div style="margin-right:10px">Actors</div></td>
  <td class="xl71" width="215" style="border-top:none;width:161pt">
  <div style="margin-right:10px">{actors}</div>
  </td>
  <td></td>
  <td colspan="2" style="mso-ignore:colspan"></td>
 </tr>
 <tr height="38" style="height:28.5pt">
  <td height="38" class="xl68" width="215" style="height:28.5pt;border-top:none;
  width:161pt;display:table-cell">
  <div style="margin-right:10px">Language</div></td>
  <td class="xl71" width="215" style="border-top:none;width:161pt">
  <div style="margin-right:10px">{language}</div></td>
  <td class="xl68" width="215" style="border-top:none;width:161pt">
  <div style="margin-right:10px">Average vote</div></td>
  <td class="xl71" width="215" style="border-top:none;width:161pt">
  <div style="margin-right:10px">{avg_vote}</div>
  </td>
  <td></td>
  <td colspan="2" style="mso-ignore:colspan"></td>
 </tr>
 <tr height="38" style="height:28.5pt">
  <td height="38" class="xl69" width="215" style="height:28.5pt;border-top:none;
  width:161pt;display:table-cell">
  <div style="margin-right:10px">Budget</div></td>
  <td class="xl71" width="215" style="border-top:none;width:161pt">
  <div style="margin-right:10px">{budget}</div></td>
  <td class="xl72" width="215" style="border-top:none;width:161pt">
  <div style="margin-right:10px">Description</div>
  &nbsp;</td>
  <td class="xl73" width="215" style="border-top:none;width:161pt;display:table-cell">
  <div style="margin-right:10px">{description}</div>
  &nbsp;</td>
  <td></td>
  <td colspan="2" style="mso-ignore:colspan"></td>
 </tr>

</tbody></table>


                          ')
              )
        )
}