<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:crdo="http://crdo.risc.cnrs.fr/schemas/"
    xmlns:annot="http://crdo.risc.fr/schemas/annotation"
  	xmlns:php="http://php.net/xsl" 
    xmlns:xi="http://www.w3.org/2001/XInclude"
	xmlns:xalan="http://xml.apache.org/xalan"
	exclude-result-prefixes="xi xalan"
	version="1.0">
	
	<xsl:output method="xml" indent="yes"/>
	<!--<xsl:output method="html"
doctype-system="about:legacy-compat" indent="yes"/>-->
		<xsl:param name="titre" select="''"/>
		<xsl:param name="url_sound_wav" select="''"/>
        <xsl:param name="url_sound_mp3" select="''"/>
        <xsl:param name="navigator" select="''"/>
        <xsl:param name="chercheurs" select="''"/>
        <xsl:param name="locuteurs" select="''"/>
		<xsl:param name="lg" select="''"/>
        <xsl:param name="lg_code" select="''"/>
        <xsl:param name="id" select="''"/>
		<xsl:param name="url_text" select="''"/>
		<xsl:param name="aff_lang" select="'*'"/>
        <xsl:param name="mediaUrl"  select="''"/>
	<!-- ******************************************************** -->

	<xsl:template match="/">
    
    
                
    
		<!--<script src="showhide.js" type="text/javascript">.</script>-->
		<div style="margin-left: 5px;">
			<h2 align="center"><strong style="font-size:16px">  <xsl:value-of select="$titre"/>    <a href="show_metadatas.php?id={$id}&amp;lg={$lg}"
                target="_blank"
                onClick="window.open(this.href,'popup_lang1','width=500,height=300,scrollbars=yes,resizable=yes',1);return false"><img class="sansBordure" src="../../images/icones/info.gif"/> </a>
                 </strong>
            
            <br/>
            
            
           <!-- <div>
      <a	href="create_pdf.php?id={$id}">Creation fichier PDF</a>
         </div>-->
           <!-- <div>
            <a	href="ipad.php?id={$id}">Accès iPad</a>
            </div>-->
            <!--   <div>
      <a	href="create_rtf.php?id={$id}">Creation fichier RTF</a>
         </div>-->
            
           			 <xsl:choose>
						<xsl:when test="$aff_lang='fr'">
                        	Langue : 
                        </xsl:when>
                        <xsl:otherwise> 
                    		Language : 
                        </xsl:otherwise>
                    </xsl:choose>
				 <!--<a href="http://lacito.vjf.cnrs.fr/ALC/Languages/{$lg}_popup.htm"
                target="_blank"
                onClick="window.open(this.href,'popup_lang1','width=500,height=300,scrollbars=yes,resizable=yes',1);return false">-->
                
                <xsl:value-of select="$lg"/>(<a href="http://www.ethnologue.com/language/{$lg_code}" target="_blank"><xsl:value-of select="$lg_code"/></a>)
                <!--</a>-->
               <br/> 
	<br/>
   <table width="100%">
    <tr>
    <td align="left">
    <xsl:if test="$chercheurs"> 
    				<xsl:choose>
						<xsl:when test="$aff_lang='fr'">
                        	Chercheur(s) : 
                        </xsl:when>
                        <xsl:otherwise> 
                    		Researcher(s) : 
                        </xsl:otherwise>
                    </xsl:choose>
    
    				<span style="color:#333"><xsl:value-of select="$chercheurs"/></span>
    </xsl:if>
    </td>
    <td align="right">
    <xsl:if test="$locuteurs">
   				 <xsl:choose>
   				 <xsl:when test="$aff_lang='fr'">
                        	Locuteur(s) :
                        </xsl:when>
                        <xsl:otherwise> 
                    		Speaker(s) :
                        </xsl:otherwise>
                    </xsl:choose> 
                    
                    <span style="color:#333"><xsl:value-of select="$locuteurs"/></span>
    </xsl:if>
    </td>
    </tr>   
    </table>
    
    <!--Chercheur(s) : <span style="color:#333"><xsl:value-of select="$chercheurs"/></span>
    <br/>
    <br/>
    Locuteur(s) : <span style="color:#333"><xsl:value-of select="$locuteurs"/></span>-->
			</h2>
            
                   
         <br />
         
        <!-- <div>
				   <audio controls> 
  <source src="$url_sound_wav" />
  <p class="warning">Le format *.wav n'est pas pris en charge par votre navigateur</p>
					</audio>
                    
		</div>-->
       
       <div>
        
         <xsl:choose>
         	
         
          		<xsl:when test="contains($navigator, 'Firefox')">
          			<xsl:choose>
    					<xsl:when test="contains($url_sound_wav, 'wav')">
      						 <div>
                             	<xsl:call-template name="player-audio_html5">
									<xsl:with-param name="mediaUrl" select="$url_sound_wav"/>
						 		</xsl:call-template>
                              
                             	<!--<xsl:call-template name="player-audio_wav">
									<xsl:with-param name="mediaUrl_wav" select="$url_sound_wav"/>
						 		</xsl:call-template>-->
     						
     						</div>
    					</xsl:when> 
                    </xsl:choose>
                 </xsl:when>
                 
                 
                 <xsl:when test="contains($navigator, 'Opera')">
          			<xsl:choose>
    					<xsl:when test="contains($url_sound_wav, 'wav')">
      						 <div>
                             	<xsl:call-template name="player-audio_html5">
									<xsl:with-param name="mediaUrl" select="$url_sound_wav"/>
						 		</xsl:call-template>
                                
                             	<!--<xsl:call-template name="player-audio_wav">
									<xsl:with-param name="mediaUrl_wav" select="$url_sound_wav"/>
						 		</xsl:call-template>-->
     						</div>
     						
    					</xsl:when> 
                    </xsl:choose>
                 </xsl:when>
                 
                 
                 <xsl:when test="contains($navigator, 'Chrome')">
          			<xsl:choose>
    					<xsl:when test="contains($url_sound_wav, 'wav')">
      						 <div>
                             	<!--<xsl:call-template name="player-audio_wav">
									<xsl:with-param name="mediaUrl_wav" select="$url_sound_wav"/>
						 		</xsl:call-template>-->
                                <xsl:call-template name="player-audio_html5">
									<xsl:with-param name="mediaUrl" select="$url_sound_wav"/>
						 		</xsl:call-template>
     						</div>
    					</xsl:when> 
                    </xsl:choose>
                 </xsl:when>
                 
                <xsl:when test="contains($navigator, 'Explorer')">
          			<!--<xsl:choose>
    					<xsl:when test="contains($url_sound_mp3, 'mp3')">
      						 <div>
                             	<xsl:call-template name="player-audio_html5">
									<xsl:with-param name="mediaUrl" select="$url_sound_mp3"/>
					 			</xsl:call-template>
     						</div>
    					</xsl:when> 
                        <xsl:otherwise>-->
   							<div>
                            <!--<xsl:call-template name="player-audio_html5">
									<xsl:with-param name="mediaUrl" select="$url_sound_wav"/>
						 		</xsl:call-template>-->
								<xsl:call-template name="player-audio_wav">
									<xsl:with-param name="mediaUrl_wav" select="$url_sound_wav"/>
								</xsl:call-template>
							</div>
   					<!--</xsl:otherwise>
                    </xsl:choose>-->
                </xsl:when>
                 
                 
    			<xsl:otherwise>
   							<div>
                            <xsl:call-template name="player-audio_html5">
									<xsl:with-param name="mediaUrl" select="$url_sound_wav"/>
						 		</xsl:call-template>
								<!--<xsl:call-template name="player-audio_wav">
									<xsl:with-param name="mediaUrl_wav" select="$url_sound_wav"/>
								</xsl:call-template>-->
							</div>
                            <!--<div>
                             	<xsl:call-template name="player-audio_html5_bis">
									<xsl:with-param name="mediaUrl" select="$url_sound_wav"/>
						 		</xsl:call-template>
     						</div>-->
                            <!--<div>
                             	<xsl:call-template name="player-audio_html5_bis">
									<xsl:with-param name="mediaUrl" select="$url_sound_mp3"/>
					 			</xsl:call-template>
     						</div>-->
   					</xsl:otherwise>
  					
        </xsl:choose>
        
       </div>
       
                     
                     
         <!--<xsl:choose>
          		<xsl:when test="contains($navigator, 'Firefox')">
          			<xsl:choose>
    					<xsl:when test="contains($url_sound_mp3, 'mp3')">
      						<div>
								<xsl:call-template name="player-audio_mp3">
									<xsl:with-param name="mediaUrl_mp3" select="$url_sound_mp3"/>
            						<xsl:with-param name="mediaUrl_wav" select="$url_sound_wav"/>
								</xsl:call-template>
							</div>
    					</xsl:when>  
    				<xsl:otherwise>-->
                    <!--http://crdo.risc.cnrs.fr/data/boutet/BOD041.mp4-->
                    <div>
                   <!-- <video width="400" height="222" controls="controls">
  <source src="http://crdo.risc.cnrs.fr/data/boutet/BOD041.mp4" type="video/mp4" />
  Ici l'alternative à la vidéo : un lien de téléchargement, un message, etc.
</video>-->
<!--<object id="player" width="800" height="100" classid="clsid:02BF25D5-8C17-4B23-BC80-D3488ABDDC6B" codebase="http://www.apple.com/qtactivex/qtplugin.cab">
			<param name="src" value="http://crdo.risc.cnrs.fr/data/boutet/BOD041.mp4"/>
			<param name="AUTOPLAY" value="false"/>
			<param name="CONTROLLER" value="true"/>
			<embed width="800pt" height="100px" pluginspace="http://www.apple.com/quicktime/download/" controller="true" src="http://crdo.risc.cnrs.fr/data/boutet/BOD041.mp4" name="player" autostart="false" enablejavascript="true">
       			</embed>
		</object>-->
</div>
   						 <div>
							<!--<xsl:call-template name="player-audio_wav">
							<xsl:with-param name="mediaUrl_wav" select="$url_sound_wav"/>
							</xsl:call-template>-->
                            

     					</div>
   					<!--</xsl:otherwise>
  					</xsl:choose>
                    </xsl:when> 
    		 	<xsl:otherwise>
    		 		<xsl:call-template name="player-audio_wav">
						<xsl:with-param name="mediaUrl_wav" select="$url_sound_wav"/>
					 </xsl:call-template>
    			 </xsl:otherwise>
         		
        </xsl:choose>  -->
       
       
       <!--Affichage des case à cocher pour afficher ou cacher les infos de transcription, traduction pour un texte de type : TEXT-->
         <div>
               
        
<xsl:if test="annot:TEXT">
         	<table width="100%">             
			<tr>

				<td>
					<table>
                    	<xsl:if test="annot:TEXT/annot:S/annot:FORM">
						<tr>
							<th>
								<xsl:choose>
								<xsl:when test="$aff_lang='fr'">
									Transcription par phrase
								</xsl:when>
								<xsl:otherwise> 
									Transcription by sentence
								</xsl:otherwise>
								</xsl:choose>
								</th>
						</tr>
						<tr>
							<xsl:if test="annot:TEXT/annot:S/annot:FORM[@kindOf='phono']">
							<td>
								<input checked="checked" name="transcription_phono" onclick="javascript:showhide(this, 17, 'inline')"  type="checkbox"/>	
								<xsl:choose>
										<xsl:when test="$aff_lang='fr'">
											Phonologique
										</xsl:when>
										<xsl:otherwise> 
											Phonologic
										</xsl:otherwise>
									</xsl:choose>
										
							</td>
							</xsl:if>
						</tr>
						<tr>
							<xsl:if test="annot:TEXT/annot:S/annot:FORM[@kindOf='ortho']">
							<td>
								<input checked="checked" name="transcription_ortho" onclick="javascript:showhide(this, 18, 'inline')"  type="checkbox"/>
								<xsl:choose>
									<xsl:when test="$aff_lang='fr'">
										Orthographique 
									</xsl:when>
									<xsl:otherwise> 
										Orthographic 
									</xsl:otherwise>
								</xsl:choose>
								
							</td>
							</xsl:if>
						</tr>
						<tr>
							<xsl:if test="annot:TEXT/annot:S/annot:FORM[@kindOf='phone']">
							<td>
								<input checked="checked" name="transcription_phone" onclick="javascript:showhide(this, 19, 'inline')"  type="checkbox"/>
								<xsl:choose>
								<xsl:when test="$aff_lang='fr'">
									Phonétique 
								</xsl:when>
								<xsl:otherwise> 
									Phonetic 
								</xsl:otherwise>
							</xsl:choose>
								
							</td>
							</xsl:if>
						</tr>
						<tr>
							<xsl:if test="annot:TEXT/annot:S/annot:FORM[@kindOf='transliter']">
							<td>
								<input checked="checked" name="transcription_translit" onclick="javascript:showhide(this, 20, 'inline')"  type="checkbox"/>
								<xsl:choose>
									<xsl:when test="$aff_lang='fr'">
										Translittéré 
									</xsl:when>
									<xsl:otherwise> 
										Transliterated 
									</xsl:otherwise>
								</xsl:choose>
								
							</td>
							</xsl:if>
						</tr>
						<tr>
							<xsl:if test="annot:TEXT/annot:S/annot:FORM[not(@kindOf)]">
							<td>
							
								<input checked="checked" name="transcription" onclick="javascript:showhide(this, 16, 'inline')"  type="checkbox"/>
							</td>
							</xsl:if>
						</tr>
						<tr><td><br/> </td></tr>
                        </xsl:if>						
                        <xsl:if test="annot:TEXT/annot:S/annot:TRANSL">
						<tr>
							<th> 
								<xsl:choose>
									<xsl:when test="$aff_lang='fr'">
										Traduction par phrase  
									</xsl:when>
									<xsl:otherwise> 
										Translation by sentence
									</xsl:otherwise>
								</xsl:choose>
							</th>
						</tr>
						<tr>
							<td>
								<xsl:if test="annot:TEXT/annot:S/annot:TRANSL[@xml:lang='fr']">
									
									<input checked="checked" name="translation_fr" onclick="javascript:showhide(this, 7, 'block')"  type="checkbox"/>
									FR 
									
								</xsl:if>
								
								<xsl:if test="annot:TEXT/annot:S/annot:TRANSL[@xml:lang='en']">
									
									<input checked="checked" name="translation_en" onclick="javascript:showhide(this, 6, 'block')"  type="checkbox"/>
									EN 
									
								</xsl:if>
                                <xsl:if test="annot:TEXT/annot:S/annot:TRANSL[@xml:lang='it']">
									
									<input checked="checked" name="translation_it" onclick="javascript:showhide(this, 8, 'block')"  type="checkbox"/>
									IT 
									
								</xsl:if>
                                <xsl:if test="annot:TEXT/annot:S/annot:TRANSL[@xml:lang='de']">
									
									<input checked="checked" name="translation_de" onclick="javascript:showhide(this, 9, 'block')"  type="checkbox"/>
									DE
									
								</xsl:if>
                                <xsl:if test="annot:TEXT/annot:S/annot:TRANSL[@xml:lang='cn']">
									
									<input checked="checked" name="translation_cn" onclick="javascript:showhide(this, 10, 'block')"  type="checkbox"/>
									CN
									
								</xsl:if>
								
								<xsl:if test="annot:TEXT/annot:S/annot:TRANSL[@xml:lang!='fr' and @xml:lang!='en' and @xml:lang!='it' and @xml:lang!='de' and @xml:lang!='cn']">
									<xsl:variable name="langue_autre" select="annot:TEXT/annot:S/annot:TRANSL[@xml:lang!='fr' and @xml:lang!='en' and @xml:lang!='it' and @xml:lang!='de' and @xml:lang!='cn']/@xml:lang"/>
									<input checked="checked" name="translation_other" onclick="javascript:showhide(this, 11, 'block')" type="checkbox"/>
									<xsl:choose>
										<xsl:when test="$aff_lang='fr'">
											<xsl:value-of select="translate($langue_autre,'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>    
										</xsl:when>
										<xsl:otherwise> 
											<xsl:value-of select="translate($langue_autre,'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>    
										</xsl:otherwise>
									</xsl:choose>  
									
								</xsl:if>
							</td>
						</tr>
						</xsl:if>
					</table>	
				</td>
									
				<xsl:if test="annot:TEXT/annot:FORM | annot:TEXT/annot:S/annot:FORM">
         		<td>
         		
         			<table>	
         				<tr>
         					<th>
         						<xsl:choose>
         							<xsl:when test="$aff_lang='fr'">
         								Transcription du texte complet
         							</xsl:when>
         							<xsl:otherwise> 
         								Whole text transcription 
         							</xsl:otherwise>
         						</xsl:choose>
         					</th>
         				</tr>
         				<tr>
         					<xsl:if test="annot:TEXT/annot:FORM | annot:TEXT/annot:S/annot:FORM">
         						<td>  
         							<input name="trans_text" onclick="javascript:showhide(this, 22, 'inline')"  type="checkbox"/>
         						</td>
         					</xsl:if>
         				</tr>
         				<tr><td><br/> </td></tr>						
         				<tr>
         					<th> 
         						<xsl:choose>
         							<xsl:when test="$aff_lang='fr'">
         								Traduction du texte complet  
         							</xsl:when>
         							<xsl:otherwise> 
         								Whole text translation
         							</xsl:otherwise>
         						</xsl:choose>
         					</th>
         				</tr>
         				<tr>
         					<td>
         					<xsl:if test="annot:TEXT/annot:TRANSL[@xml:lang='fr']| annot:TEXT/annot:S/annot:TRANSL[@xml:lang='fr']">
         					
         						<input name="trad_text_fr" onclick="javascript:showhide(this, 23, 'block')"  type="checkbox"/>
         						FR 
         				
         					</xsl:if>
         				
         					<xsl:if test="annot:TEXT/annot:TRANSL[@xml:lang='en'] | annot:TEXT/annot:S/annot:TRANSL[@xml:lang='en']">
         					
         						<input name="trad_text_en" onclick="javascript:showhide(this, 24, 'block')"  type="checkbox"/>
         						EN  
         					
         					</xsl:if>
                            
                            <xsl:if test="annot:TEXT/annot:TRANSL[@xml:lang='it'] | annot:TEXT/annot:S/annot:TRANSL[@xml:lang='it']">
         					
         						<input name="trad_text_it" onclick="javascript:showhide(this, 25, 'block')"  type="checkbox"/>
         						IT 
         					
         					</xsl:if>
                            
                            <xsl:if test="annot:TEXT/annot:TRANSL[@xml:lang='de'] | annot:TEXT/annot:S/annot:TRANSL[@xml:lang='de']">
         					
         						<input name="trad_text_de" onclick="javascript:showhide(this, 26, 'block')"  type="checkbox"/>
         						DE  
         					
         					</xsl:if>
                            <xsl:if test="annot:TEXT/annot:TRANSL[@xml:lang='cn'] | annot:TEXT/annot:S/annot:TRANSL[@xml:lang='cn']">
         					
         						<input name="trad_text_cn" onclick="javascript:showhide(this, 27, 'block')"  type="checkbox"/>
         						CN  
         					
         					</xsl:if>
         				
         					<xsl:if test="annot:TEXT/annot:TRANSL[@xml:lang!='fr' and @xml:lang!='en' and @xml:lang!='it' and @xml:lang!='de' and @xml:lang!='cn'] | annot:TEXT/annot:S/annot:TRANSL[@xml:lang!='fr' and @xml:lang!='en' and @xml:lang!='it' and @xml:lang!='de' and @xml:lang!='cn']">
         					<xsl:variable name="langue_autre" select="annot:TEXT/annot:S/annot:TRANSL/@xml:lang"/>
         						<input name="trad_text_other" onclick="javascript:showhide(this, 28, 'block')"  type="checkbox"/>
         						<xsl:choose>
         							<xsl:when test="$aff_lang='fr'">
         								<xsl:value-of select="translate($langue_autre,'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>    
         							</xsl:when>
         							<xsl:otherwise> 
         								  <xsl:value-of select="translate($langue_autre,'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>    
         							</xsl:otherwise>
         						</xsl:choose>  
         					
         					</xsl:if>
         					</td>
         				</tr>
         			</table>	
         		
         		</td>
				</xsl:if>	
				<xsl:if test="annot:TEXT/annot:S/annot:W[annot:TRANSL or annot:M/annot:TRANSL] | annot:TEXT/annot:S/annot:NOTE">			
         		<td>
         			<table>
         				<xsl:if test="annot:TEXT/annot:S/annot:W[annot:TRANSL or annot:M/annot:TRANSL]">
		         		<tr>
		         			<th>
		         				<xsl:choose>
		         				<xsl:when test="$aff_lang='fr'">
		         					Mot à mot 
		         				</xsl:when>
		         				<xsl:otherwise> 
		         					Glosses
		         				</xsl:otherwise>
		         			</xsl:choose>
		         			</th>
		         			
		         			<td>
		         				<input checked="checked" name="interlinear" onclick="javascript:showhide(this, 12, 'inline')" type="checkbox"/>
		         				
		         			</td>
		         			
		         		</tr>
         					</xsl:if>
         				<tr><td><br/> </td></tr>
         				<tr><td><br/> </td></tr>
         				<xsl:if test="annot:TEXT/annot:S/annot:NOTE">
         				<tr>
		         		<th>
		         			<xsl:choose>
		         				<xsl:when test="$aff_lang='fr'">
		         					Notes 
		         				</xsl:when>
		         				<xsl:otherwise> 
		         					Notes
		         				</xsl:otherwise>
		         			</xsl:choose>
		         		</th>
		         			
		         		<td>
		         			<input name="note_info" onclick="javascript:showhide(this, 21, 'block')"  type="checkbox"/>
		         			
		         		</td>
		         			
         				</tr>
         					</xsl:if>
         			</table>
         		</td>
				</xsl:if>
         	</tr>
         	
         </table>
         	
</xsl:if>     	
         	
         	
         	
         	
      <xsl:if test="annot:WORDLIST">
         	<table width="100%">             
         		<tr>
         			
         			<td>
         				<table>
         					<tr>
         						<th align="left">
         							<xsl:choose>
         								<xsl:when test="$aff_lang='fr'">
         									Transcription
         								</xsl:when>
         								<xsl:otherwise> 
         									Transcription
         								</xsl:otherwise>
         							</xsl:choose>
         						</th>
         					</tr>
         					<tr>
         						<xsl:if test="annot:WORDLIST/annot:W/annot:FORM[@kindOf='phono']">
         							<td>
         								<input checked="checked" name="transcription_phono" onclick="javascript:showhide(this, 17, 'inline')"  type="checkbox"/>	
         								<xsl:choose>
         									<xsl:when test="$aff_lang='fr'">
         										Phonologique
         									</xsl:when>
         									<xsl:otherwise> 
         										Phonologic
         									</xsl:otherwise>
         								</xsl:choose>
         								
         							</td>
         						</xsl:if>
         					</tr>
         					<tr>
         						<xsl:if test="annot:WORDLIST/annot:W/annot:FORM[@kindOf='ortho']">
         							<td>
         								<input checked="checked" name="transcription_ortho" onclick="javascript:showhide(this, 18, 'inline')"  type="checkbox"/>
         								<xsl:choose>
         									<xsl:when test="$aff_lang='fr'">
         										Orthographique 
         									</xsl:when>
         									<xsl:otherwise> 
         										Orthographic 
         									</xsl:otherwise>
         								</xsl:choose>
         								
         							</td>
         						</xsl:if>
         					</tr>
         					<tr>
         						<xsl:if test="annot:WORDLIST/annot:W/annot:FORM[@kindOf='phone']">
         							<td>
         								<input checked="checked" name="transcription_phone" onclick="javascript:showhide(this, 19, 'inline')"  type="checkbox"/>
         								<xsl:choose>
         									<xsl:when test="$aff_lang='fr'">
         										Phonétique 
         									</xsl:when>
         									<xsl:otherwise> 
         										Phonetic 
         									</xsl:otherwise>
         								</xsl:choose>
         								
         							</td>
         						</xsl:if>
         					</tr>
         					<tr>
         						<xsl:if test="annot:WORDLIST/annot:W/annot:FORM[@kindOf='transliter']">
         							<td>
         								<input checked="checked" name="transcription_translit" onclick="javascript:showhide(this, 20, 'inline')"  type="checkbox"/>
         								<xsl:choose>
         									<xsl:when test="$aff_lang='fr'">
         										Translittéré 
         									</xsl:when>
         									<xsl:otherwise> 
         										Transliterated 
         									</xsl:otherwise>
         								</xsl:choose>
         								
         							</td>
         						</xsl:if>
         					</tr>
         					<tr>
         						<xsl:if test="annot:WORDLIST/annot:W/annot:FORM[not(@kindOf)]">
         							<td>
         								
         								<input checked="checked" name="transcription" onclick="javascript:showhide(this, 16, 'inline')"  type="checkbox"/>
         							</td>
         						</xsl:if>
         					</tr>
         					<tr><td><br/> </td></tr>						
         					<tr>
         						<th align="left"> 
         							<xsl:choose>
         								<xsl:when test="$aff_lang='fr'">
         									Traduction  
         								</xsl:when>
         								<xsl:otherwise> 
         									Translation
         								</xsl:otherwise>
         							</xsl:choose>
         						</th>
         					</tr>
         					<tr>
         						<td>
         							<xsl:if test="annot:WORDLIST/annot:W/annot:TRANSL[@xml:lang='fr']">
         								
         								<input checked="checked" name="translation_fr" onclick="javascript:showhide(this, 7, 'block')"  type="checkbox"/>
         								FR 
         								
         							</xsl:if>
         							
         							<xsl:if test="annot:WORDLIST/annot:W/annot:TRANSL[@xml:lang='en']">
         								
         								<input checked="checked" name="translation_en" onclick="javascript:showhide(this, 6, 'block')"  type="checkbox"/>
         								EN 
         								
         							</xsl:if>
         							
         							<xsl:if test="annot:WORDLIST/annot:W/annot:TRANSL[@xml:lang!='fr' and @xml:lang!='en']">
         								<xsl:variable name="langue_autre" select="annot:WORDLIST/annot:W/annot:TRANSL[@xml:lang!='fr' and @xml:lang!='en']/@xml:lang"/>
         								<input checked="checked" name="translation_other" onclick="javascript:showhide(this, 8, 'block')" type="checkbox"/>
         								<xsl:choose>
         									<xsl:when test="$aff_lang='fr'">
         										<xsl:value-of select="translate($langue_autre,'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>     
         									</xsl:when>
         									<xsl:otherwise> 
         										<xsl:value-of select="translate($langue_autre,'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>    
         									</xsl:otherwise>
         								</xsl:choose>  
         								
         							</xsl:if>
         						</td>
         					</tr>
         					
         				</table>	
         			</td>	
         		<xsl:if test= "annot:WORDLIST/annot:W/annot:NOTE">	
         				<td>
         					<table>
         						<tr>
         							<th align="left">
         								<xsl:choose>
         									<xsl:when test="$aff_lang='fr'">
         										Notes 
         									</xsl:when>
         									<xsl:otherwise> 
         										Notes
         									</xsl:otherwise>
         								</xsl:choose>
         							</th>
         							
         								<td>
         									<input name="note_info" onclick="javascript:showhide(this, 21, 'block')"  type="checkbox"/>
         									
         								</td>
         						
         						</tr>
         					</table>
         				</td>
         			</xsl:if>
         		</tr>
         		
         	</table>
      </xsl:if>   	
         	
         	
         	
         	
         	
         	
         	

       
         </div>
         
         
      
		</div>

         
               <xsl:if test="annot:TEXT/annot:S/annot:W/annot:M/@class='CL'">
               <div><br/><b>
               <xsl:choose>
					<xsl:when test="$aff_lang='fr'">
                      <!--Mots en italique = Mots empruntés-->
                      Mots en italique = Mots des langues de contact
                    </xsl:when>
                    <xsl:otherwise> 
                    	<!--Words in italics = Loan words-->
                        Words in italics = Words from contact languages
                    </xsl:otherwise>
             </xsl:choose>
             </b><br/></div>
               </xsl:if>
        
		<xsl:apply-templates select=".//annot:TEXT|.//annot:WORDLIST"/>
	</xsl:template>	
	
	
	<xsl:template match="annot:TEXT">
		<table width="100%" border="1"  bordercolor="#993300" cellspacing="0" cellpadding="0">
			<tr>
				<td>
					<table width="100%" border="0" cellpadding="5" cellspacing="0" bordercolor="#993300" class="it">
						<tbody> 
                       <xsl:choose>
                        
                       <xsl:when test="annot:FORM">
                        <tr class="transcriptTable"><td class="segmentInfo"></td><td class="segmentContent"><div class="trans_text"><xsl:value-of select="annot:FORM"/></div></td></tr>
                        </xsl:when>
                       <xsl:when test="annot:S/annot:FORM">
                           <tr class="transcriptTable"><td class="segmentInfo"></td><td class="segmentContent"><div class="trans_text"><xsl:for-each select="annot:S"><xsl:value-of select="annot:FORM"/><br/></xsl:for-each></div></td></tr>
                        </xsl:when>
                       
                        </xsl:choose>
                        
                        <xsl:choose>
                        <xsl:when test="annot:TRANSL[@xml:lang='fr']">
                        <tr class="transcriptTable"><td class="segmentInfo"></td><td class="segmentContent"><div class="trad_text_fr"><xsl:value-of select="annot:TRANSL[@xml:lang='fr']"/></div></td></tr>
                        </xsl:when>
                        <xsl:when test="annot:S/annot:TRANSL[@xml:lang='fr']">
                        <tr class="transcriptTable"><td class="segmentInfo"></td><td class="segmentContent"><div class="trad_text_fr"><xsl:for-each select="annot:S"><xsl:value-of select="annot:TRANSL[@xml:lang='fr']"/><br/></xsl:for-each></div></td></tr>
                        </xsl:when>
                       
                       </xsl:choose>
                        <xsl:choose>
                        <xsl:when test="annot:TRANSL[@xml:lang='en']">
                        <tr class="transcriptTable"><td class="segmentInfo"></td><td class="segmentContent"><div class="trad_text_en"><xsl:value-of select="annot:TRANSL[@xml:lang='en']"/></div></td></tr>
                        </xsl:when>
                        <xsl:when test="annot:S/annot:TRANSL[@xml:lang='en']">
                        <tr class="transcriptTable"><td class="segmentInfo"></td><td class="segmentContent"><div class="trad_text_en"><xsl:for-each select="annot:S"><xsl:value-of select="annot:TRANSL[@xml:lang='en']"/><br/></xsl:for-each></div></td></tr>
                        </xsl:when>
                       
                       </xsl:choose>
                       
                       <xsl:choose>
                        <xsl:when test="annot:TRANSL[@xml:lang='it']">
                        <tr class="transcriptTable"><td class="segmentInfo"></td><td class="segmentContent"><div class="trad_text_it"><xsl:value-of select="annot:TRANSL[@xml:lang='it']"/></div></td></tr>
                        </xsl:when>
                        <xsl:when test="annot:S/annot:TRANSL[@xml:lang='it']">
                        <tr class="transcriptTable"><td class="segmentInfo"></td><td class="segmentContent"><div class="trad_text_it"><xsl:for-each select="annot:S"><xsl:value-of select="annot:TRANSL[@xml:lang='it']"/><br/></xsl:for-each></div></td></tr>
                        </xsl:when>
                       
                       </xsl:choose>
                       
                       <xsl:choose>
                        <xsl:when test="annot:TRANSL[@xml:lang='de']">
                        <tr class="transcriptTable"><td class="segmentInfo"></td><td class="segmentContent"><div class="trad_text_de"><xsl:value-of select="annot:TRANSL[@xml:lang='de']"/></div></td></tr>
                        </xsl:when>
                        <xsl:when test="annot:S/annot:TRANSL[@xml:lang='de']">
                        <tr class="transcriptTable"><td class="segmentInfo"></td><td class="segmentContent"><div class="trad_text_de"><xsl:for-each select="annot:S"><xsl:value-of select="annot:TRANSL[@xml:lang='de']"/><br/></xsl:for-each></div></td></tr>
                        </xsl:when>
                       
                       </xsl:choose>
                       
                       <xsl:choose>
                        <xsl:when test="annot:TRANSL[@xml:lang='cn']">
                        <tr class="transcriptTable"><td class="segmentInfo"></td><td class="segmentContent"><div class="trad_text_cn"><xsl:value-of select="annot:TRANSL[@xml:lang='cn']"/></div></td></tr>
                        </xsl:when>
                        <xsl:when test="annot:S/annot:TRANSL[@xml:lang='cn']">
                        <tr class="transcriptTable"><td class="segmentInfo"></td><td class="segmentContent"><div class="trad_text_cn"><xsl:for-each select="annot:S"><xsl:value-of select="annot:TRANSL[@xml:lang='cn']"/><br/></xsl:for-each></div></td></tr>
                        </xsl:when>
                       
                       </xsl:choose>
                       
                        <xsl:choose>
                        <xsl:when test="annot:TRANSL[@xml:lang!='fr' and @xml:lang!='en' and @xml:lang!='it' and @xml:lang!='de' and @xml:lang!='cn']">
                        <tr class="transcriptTable"><td class="segmentInfo"></td><td class="segmentContent"><div class="trad_text_other"><xsl:value-of select="annot:TRANSL[@xml:lang='cn']"/></div></td></tr>
                        </xsl:when>
                        <xsl:when test="annot:S/annot:TRANSL[@xml:lang!='fr' and @xml:lang!='en' and @xml:lang!='it' and @xml:lang!='de' and @xml:lang!='cn']">
                        <tr class="transcriptTable"><td class="segmentInfo"></td><td class="segmentContent"><div class="trad_text_other"><xsl:for-each select="annot:S"><xsl:value-of select="annot:TRANSL[@xml:lang!='fr' and @xml:lang!='en' and @xml:lang!='it' and @xml:lang!='de' and @xml:lang!='cn']"/><br/></xsl:for-each></div></td></tr>
                        </xsl:when>
                       
                       </xsl:choose>
                        
                        <!-- Cree la numerotation des phrases : Si (phrase numero i)-->
							<xsl:for-each select="annot:S">
								<tr class="transcriptTable">
									<td class="segmentInfo" width="25">S<xsl:value-of select="position()"/>
									</td>
									<td class="segmentContent" id="{@id}">
										<!--<xsl:value-of select="@id"/>-->
                                       <!-- <xsl:value-of select="annot:AUDIO/@start"/>
                                         <xsl:text> et </xsl:text>
                                        <xsl:value-of select="annot:AUDIO/@end"/>-->
                                        
											<a href="javascript:boutonStop()">
												<img src="stop.gif" alt="stop"/>
											</a>
                                            <xsl:text> </xsl:text>
											<a href="javascript:playFrom('{@id}')">
												<img src="play.gif" alt="écouter"/>
											</a>
                                          
											<!-- affiche le nom du locuteur si il y en a -->
											<xsl:if test="((@who) and (not(@who='')) and (not(@who=ancestor::annot:TEXT/annot:S[number(position())-1]/@who)))">
												<span class="speaker">
													<xsl:value-of select="@who"/><xsl:text>: </xsl:text>
												</span>
											</xsl:if>
											
										<!--	<xsl:if test="not(annot:W/annot:FORM) and not(annot:W/annot:M/annot:FORM) and annot:FORM">
												<span class="transcription">
													<xsl:value-of select="annot:FORM"/>
												</span>
											</xsl:if>
										-->
                                        
                                       
                                       
                                       
                                       
                                       <!-- cas ou S contient la balise FORM -->
                                       <!-- <xsl:if test="annot:FORM">-->
                                        
                                        <!-- Recuperation de la phrase -->
                                       <!--<xsl:for-each select="annot:FORM">-->
											<!--<div class="word_sentence">
                                            
												<xsl:value-of select="."/>
                                               
											</div>
                                            <br />
										</xsl:for-each>
                                        
                                        </xsl:if>-->
                                       
                                            
                                       
                                        
                                        <xsl:if test="annot:FORM">
                                       
                                        	<div class="word_sentence">
                                            
                                        <!-- Recuperation de la phrase -->
                                        <xsl:for-each select="annot:FORM">
                                        	<xsl:choose>
                                        		<xsl:when test="@kindOf">
                                        	<xsl:if test="@kindOf='phono'">
                                        		<div class="transcription_phono">
                                        		 <xsl:value-of select="."/><br/>
                                        		</div>
                                        		
                                        	</xsl:if>
                                        	<xsl:if test="@kindOf='ortho'">
                                        		<div class="transcription_ortho">
                                        		<xsl:value-of select="."/><br />
                                        		</div>
                                        		
                                        	</xsl:if>
                                        	<xsl:if test="@kindOf='phone'">
                                        		<div class="transcription_phone">
                                        		<xsl:value-of select="."/><br />
                                        		</div>
                                        		
                                        	</xsl:if>
                                        	<xsl:if test="@kindOf='transliter'">
                                        		<div class="transcription_translit">
                                        		<xsl:value-of select="."/><br />
                                        		</div>
                                        		
                                        	</xsl:if>
                                        		</xsl:when>
                                        		<xsl:otherwise>
                                                <div class="transcription">
                                        			<xsl:value-of select="."/><br />
                                                    </div>
                                        		</xsl:otherwise>
                                        	</xsl:choose>
                                        	
                                        	
                                        </xsl:for-each>
											</div>
                                         
                                        
                                        </xsl:if>
                                        
                                        
                                        <!-- Cas ou W ou M contiennent la balise FORM et ou S ne contient pas la balise FORM -->
                                        <xsl:if test="not(annot:FORM) and (annot:W/annot:FORM or annot:W/annot:M/annot:FORM)">
                                      	
                                       	
                                                    
                                       <!-- Recuperation des mots ou morphemes puis concatenation pour former une phrase --> 
                                        <xsl:for-each select="annot:W">
											
                                        
                                          
                                        	<div class="transcription" >
															<xsl:choose>
																
																
																	<xsl:when test="annot:FORM">
																		<xsl:value-of select="."/>
                                                                        <xsl:text> </xsl:text>
																	</xsl:when>
																	<xsl:otherwise>
																		<xsl:choose>
																			<xsl:when test="annot:M/@class='CL'">
																				<i>         
																					<xsl:for-each select="annot:M/annot:FORM">
																						<xsl:value-of select="."/>
																						<xsl:if test="position()!=last()">-</xsl:if>
																					</xsl:for-each>
                                                                                    <xsl:text> </xsl:text>
																					
																				</i> 
																			</xsl:when>
																			<xsl:otherwise>  
                                                                           			 <xsl:for-each select="annot:M/annot:FORM">
																					 <xsl:value-of select="."/>
																					 <xsl:if test="position()!=last()">-</xsl:if>
																					 </xsl:for-each>  
                                                                                     <xsl:text> </xsl:text>
                                                                             </xsl:otherwise>
																		</xsl:choose>
																	</xsl:otherwise>
																	
															</xsl:choose>
														</div>
                                                        
                                                        
                                     
                                          </xsl:for-each>
                                     <br />
                                      
											
                                        </xsl:if>
                                       
                                    <br />
                                     
                                    <xsl:if test="annot:TRANSL">
                                        
                                    <!-- Recupere la traduction si il en existe une -->
                                        
									
                                      
                                      <xsl:for-each select="annot:TRANSL[@xml:lang='en']">
											
                                             
                                            
                                            
                                            <div class="translation_en">
                                           <!-- <span style="color:#000">[EN] </span>-->
												<xsl:value-of select="."/><br/><br/>
                                                </div>
											
                                            
                                          </xsl:for-each> 
                                          
                                          <xsl:for-each select="annot:TRANSL[@xml:lang='fr']">
                                         
                                          
											<div class="translation_fr">
                                           <!-- <span style="color:#000">[FR] </span>-->
												<xsl:value-of select="."/><br/><br/>
											</div>
                                            
                                          </xsl:for-each> 
                                          
                                          <xsl:for-each select="annot:TRANSL[@xml:lang='it']">
                                         
                                          
											<div class="translation_it">
                                           <!-- <span style="color:#000">[FR] </span>-->
												<xsl:value-of select="."/><br/><br/>
											</div>
                                            
                                          </xsl:for-each> 
                                          
                                          <xsl:for-each select="annot:TRANSL[@xml:lang='de']">
                                         
                                          
											<div class="translation_de">
                                           <!-- <span style="color:#000">[FR] </span>-->
												<xsl:value-of select="."/><br/><br/>
											</div>
                                            
                                          </xsl:for-each> 
                                          
                                          <xsl:for-each select="annot:TRANSL[@xml:lang='cn']">
                                         
                                          
											<div class="translation_cn">
                                           <!-- <span style="color:#000">[FR] </span>-->
												<xsl:value-of select="."/><br/><br/>
											</div>
                                            
                                          </xsl:for-each> 
                                    
                                          
                                          <xsl:for-each select="annot:TRANSL[@xml:lang!='fr' and @xml:lang!='en' and @xml:lang!='it' and @xml:lang!='de' and @xml:lang!='cn']">
                                      
											<div class="translation_other">
<!--                                             <span class="maj" style="color:#000">[<xsl:value-of select="@xml:lang"/>]</span>	-->
												<xsl:value-of select="."/><br/><br/>
											</div>
                                        
                                          </xsl:for-each>
                                         
                                        </xsl:if>
                                        
                                      
                                 
										<!-- Recupere les mots avec leur glose -->
                                        <xsl:if test="(annot:W/annot:FORM and annot:W/annot:TRANSL) or (annot:W/annot:M/annot:FORM and annot:W/annot:M/annot:TRANSL) or (annot:W/annot:FORM) ">
                                        	
                                       	<xsl:for-each select="annot:W">
                                       
                                      
										<!--	<table class="word">
												<tbody>
													<tr>
														<td class="word_form">
													
										
															<xsl:choose>
																<xsl:when test="annot:M/annot:FORM">
																	<xsl:for-each select="annot:M/annot:FORM">
																		<xsl:value-of select="."/>
																		<xsl:if test="position()!=last()">-</xsl:if>
																	</xsl:for-each>
																</xsl:when>
																<xsl:when test="annot:FORM">
																	<xsl:value-of select="annot:FORM"/>
																</xsl:when>
															</xsl:choose>
                                              		</td>
													</tr>
													<tr>
                                                   
														<td class="word_transl">
														
															<xsl:choose>
																<xsl:when test="annot:M/annot:TRANSL[@xml:lang='en']">
																	<xsl:for-each select="annot:M/annot:TRANSL[@xml:lang='en']">
																		<xsl:value-of select="."/>
																		<xsl:if test="position()!=last()">-</xsl:if>
																	</xsl:for-each>
																</xsl:when>
                                                      
																<xsl:when test="annot:M/annot:TRANSL[@xml:lang='fr']">
																	<xsl:for-each select="annot:M/annot:TRANSL[@xml:lang='fr']">
																		<xsl:value-of select="."/>
																		<xsl:if test="position()!=last()">-</xsl:if>
																	</xsl:for-each>
																</xsl:when>
																<xsl:when test="annot:M/annot:TRANSL">
																	<xsl:for-each select="annot:M/annot:TRANSL[1]">
																		<xsl:value-of select="."/>
																		<xsl:if test="position()!=last()">-</xsl:if>
																	</xsl:for-each>
																</xsl:when>
																<xsl:when test="annot:TRANSL[@xml:lang='en']">
																	<xsl:value-of select="annot:TRANSL[@xml:lang='en']"/>
																</xsl:when>
																<xsl:when test="annot:TRANSL[@xml:lang='fr']">
																	<xsl:value-of select="annot:TRANSL[@xml:lang='fr']"/>
																</xsl:when>
                                                                <xsl:when test="not(annot:TRANSL[@xml:lang='en']) and not(annot:TRANSL[@xml:lang='fr'])">
																		<xsl:value-of select="annot:TRANSL"/>
																		
																	</xsl:when>
																<xsl:when test="annot:TRANSL">
																	<xsl:value-of select="annot:TRANSL[1]"/>
																</xsl:when>
															</xsl:choose>
													</td>
													</tr>
												</tbody>
											</table>-->
                                            
                                            
                                       
                                           <table class="word">
												<tbody>
													<tr>
														<td class="word_form">
													
                                                    
										
                                        				<xsl:choose>
																<xsl:when test="annot:M/annot:FORM">
																	<xsl:choose>
																		<xsl:when test="annot:M/@class='CL'">
																			<i>
																				<xsl:for-each select="annot:M/annot:FORM">
																					<xsl:value-of select="."/>
																					<xsl:if test="position()!=last()">-</xsl:if>
																				</xsl:for-each>
																				
																			</i>
																		</xsl:when>
																		<xsl:otherwise>  

																		<xsl:for-each select="annot:M/annot:FORM">
																					<xsl:value-of select="."/>
																					<xsl:if test="position()!=last()">-</xsl:if>
																				</xsl:for-each>

																		</xsl:otherwise>
																	</xsl:choose>
                                                                    </xsl:when>
																
																<xsl:otherwise>
                                                               
                                                                <xsl:value-of select="annot:FORM"/>
																	
																</xsl:otherwise>
																
															</xsl:choose>
                                            
                                           
                                            
                                              		</td>
													</tr>
													
														<!--<xsl:choose>
                                                        
                                                        <xsl:when test="(annot:M/annot:TRANSL[@xml:lang='fr']) or (annot:TRANSL[@xml:lang='fr'])">
                                                        
                                                        
															<xsl:choose>
																<xsl:when test="annot:M/annot:TRANSL[@xml:lang='fr']">
                                                                
                                                                <tr>
                                                   
																<td class="word_transl">
                                                        
																	<xsl:for-each select="annot:M/annot:TRANSL[@xml:lang='fr']">
																		<xsl:value-of select="."/>
																		<xsl:if test="position()!=last()">-</xsl:if>
																	</xsl:for-each>
                                                                    
                                                                </td>
																</tr>
                                                    
                                                    
																</xsl:when>
                                                      			<xsl:when test="annot:TRANSL[@xml:lang='fr']">
                                                                
                                                                <tr>
                                                   
																<td class="word_transl">
                                                        
                                                        
																	<xsl:value-of select="annot:TRANSL[@xml:lang='fr']"/>
                                                                    
                                                                </td>
																</tr>
																</xsl:when>
                                                                </xsl:choose>
																
													
                                                    </xsl:when>
                                                    <xsl:when test="(annot:M/annot:TRANSL[@xml:lang='en']) or (annot:TRANSL[@xml:lang='en'])">
														
															<xsl:choose>
																<xsl:when test="annot:M/annot:TRANSL[@xml:lang='en']">
                                                                
                                                                <tr>
                                                   
																<td class="word_transl">
                                                        
                                                        
																	<xsl:for-each select="annot:M/annot:TRANSL[@xml:lang='en']">
																		<xsl:value-of select="."/>
																		<xsl:if test="position()!=last()">-</xsl:if>
																	</xsl:for-each>
                                                                    
                                                                </td>
																</tr>
                                                                
                                                                
																</xsl:when>
                                                                
                                                                
                                                        
                                                        
                                                                <xsl:when test="annot:TRANSL[@xml:lang='en']">
                                                                
                                                                <tr>
                                                   
																<td class="word_transl">
                                                                
																	<xsl:value-of select="annot:TRANSL[@xml:lang='en']"/>
                                                                </td>
																</tr>
																
                                                                </xsl:when>
                                                                
                                                                
                                                    
                                                                </xsl:choose>
                                                      
																
													
                                                     </xsl:when>
                                                     <xsl:when test="(annot:M/annot:TRANSL[@xml:lang!='fr' and @xml:lang!='en']) or (annot:TRANSL[@xml:lang!='fr' and @xml:lang!='en'])">
                                                   
														
														
															<xsl:choose>
																<xsl:when test="annot:M/annot:TRANSL[@xml:lang!='fr' and @xml:lang!='en']">
                                                                <tr>
                                                                <td class="word_transl">
                                                                
																	<xsl:for-each select="annot:M/annot:TRANSL[@xml:lang!='fr' and @xml:lang!='en']">
																		<xsl:value-of select="."/>
																		<xsl:if test="position()!=last()">-</xsl:if>
																	</xsl:for-each>
                                                                    
                                                                 </td>
                                                    			</tr>
																</xsl:when>
                                                                <xsl:when test="annot:TRANSL[@xml:lang!='fr' and @xml:lang!='en']">
                                                                <tr>
                                                                <td class="word_transl">
                                                                
                                                                
																	<xsl:value-of select="annot:TRANSL[@xml:lang!='fr' and @xml:lang!='en']"/>
                                                                    
                                                                </td>
                                                    			</tr>
																</xsl:when>
                                                                </xsl:choose>
                                                      
																
													 </xsl:when>
                                                     <xsl:otherwise>
                                                     
                                                     <xsl:choose>
																<xsl:when test="annot:M/annot:TRANSL">
                                                                <tr>
                                                                <td class="word_transl">
                                                                
																	<xsl:for-each select="annot:M/annot:TRANSL">
																		<xsl:value-of select="."/>
																		<xsl:if test="position()!=last()">-</xsl:if>
																	</xsl:for-each>
                                                                    
                                                                 </td>
                                                    			</tr>
																</xsl:when>
                                                                <xsl:when test="annot:TRANSL">
                                                                <tr>
                                                                <td class="word_transl">
                                                                
                                                                
																	<xsl:value-of select="annot:TRANSL"/>
                                                                    
                                                                </td>
                                                    			</tr>
																</xsl:when>
                                                                </xsl:choose>
                                                     
                                                     
                                                     </xsl:otherwise>
                                                   
														
															</xsl:choose>
                                                            
                                                            
                                                           
                                                            
                                                            
																<xsl:if test="(annot:TRANSL) and not(annot:FORM)">
																	<tr>
                                                    <td class="word_transl">
																		<xsl:value-of select="annot:TRANSL"/>
																	</td>
                                                    
                                                    
													</tr>
																</xsl:if>-->
															
                                                                
                                                      <tr>
                                                   
														<td class="word_transl" valign="top">
														
															
															<xsl:choose>
																<xsl:when test="annot:M/annot:TRANSL">
															
                                                           
															
																		<xsl:for-each select="annot:M/annot:TRANSL">
																			<xsl:value-of select="."/>
																			<xsl:if test="position()!=last()">-</xsl:if>
																		</xsl:for-each>
																		
																
														
																	<!--<xsl:if test="annot:M/annot:TRANSL[@xml:lang='en']">
																		<xsl:for-each select="annot:M/annot:TRANSL[@xml:lang='en']">
																		<xsl:value-of select="."/>
																		<xsl:if test="position()!=last()">-</xsl:if>
																	</xsl:for-each>
																	
																</xsl:if>
																<xsl:if test="annot:M/annot:TRANSL[@xml:lang='fr']">
																	<xsl:for-each select="annot:M/annot:TRANSL[@xml:lang='fr']">
																		<xsl:value-of select="."/>
																		<xsl:if test="position()!=last()">-</xsl:if>
																	</xsl:for-each>
																	
																</xsl:if>
                                       						
																	<xsl:if test="not(annot:M/annot:TRANSL[@xml:lang='en']) and not(annot:M/annot:TRANSL[@xml:lang='fr'])">
																		<xsl:for-each select="annot:M/annot:TRANSL">
																			<xsl:value-of select="."/>
																			<xsl:if test="position()!=last()">-</xsl:if>
																		</xsl:for-each>
																		
																
															</xsl:if>-->
																
																	
																
																	<xsl:if test="annot:TRANSL">
																		<br/><xsl:for-each select="annot:TRANSL">
																			<xsl:value-of select="."/>
																			<xsl:if test="position()!=last()">-</xsl:if>
																		</xsl:for-each>
																		
																	</xsl:if>
															</xsl:when>
                                                            <xsl:when test="annot:TRANSL and not(annot:M/annot:TRANSL)">
															
																	<!--<xsl:if test="annot:TRANSL[@xml:lang='en']">
																		<xsl:value-of select="TRANSL[@xml:lang='en' or @lang='en']"/>
															
																</xsl:if>
																	<xsl:if test="annot:TRANSL[@xml:lang='fr']">
																		<xsl:value-of select="annot:TRANSL[@xml:lang='fr' or @lang='fr']"/>
																	
																</xsl:if>-->
																	
																		<xsl:for-each select="annot:TRANSL">
																			<xsl:value-of select="."/>
																			<xsl:if test="position()!=last()">-</xsl:if>
																		</xsl:for-each>
																		
																	
															</xsl:when>
																<xsl:otherwise>
																	<!--<xsl:if test="annot:M/annot:TRANSL">
																		<xsl:for-each select="annot:M/annot:TRANSL">
																			<xsl:value-of select="."/>
																			<xsl:if test="position()!=last()">-</xsl:if>
																		</xsl:for-each>
																	
																	</xsl:if>
																	<xsl:if test="annot:TRANSL">
                                                                    
																		<br/><xsl:value-of select="annot:TRANSL"/>
																	
																	</xsl:if>-->
																</xsl:otherwise>
															</xsl:choose>
														</td>
                                                        </tr>
																
													</tbody>

											</table>
                                            
													</xsl:for-each>
                                                   
                                                 
                                        </xsl:if>
                                     
                                        <div class="note_info">
                                    <xsl:for-each select="annot:NOTE/@message">
										<xsl:sort select="@xml:lang"/>
										<br/>
											<em>NOTE : <xsl:value-of select="."/></em>
                                           
										
									</xsl:for-each>
                                    </div>
                                   
                                        <!--<p>
                                        <div>Note : 
                                        <xsl:if test="annot:NOTE">
										<div class="note">
                                        
										
											<xsl:value-of select="@message"/>
										</div>
									</xsl:if></div>
                                        </p>-->
                                        
                                        
									</td>
                                    
								</tr>
                               
                              
                                   
							</xsl:for-each>
						</tbody>
					</table>
				</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template match="annot:WORDLIST">
   
		<table width="100%" border="1"  bordercolor="#993300" cellspacing="0" cellpadding="0">
			<tr>
				<td>
					<table width="100%" border="1" cellpadding="5" cellspacing="0" bordercolor="#993300" class="it">
						<tbody>
                       <!-- <th>
                        <xsl:for-each select="annot:W/annot:TRANSL[@xml:lang]">
                        <tr><xsl:value-of select="."/></tr>
                        </xsl:for-each>
                        </th>-->
							<xsl:for-each select="annot:W">
								<tr class="transcriptTable">
									<td class="segmentInfo" width="25">W<xsl:value-of select="position()"/></td>
									<td id="{@id}">
                                   <!-- <xsl:choose>
          									<xsl:when test="contains($navigator, 'Firefox')">
                                            		<xsl:choose>
    													<xsl:when test="contains($url_sound_mp3, 'mp3')">
                                                        </xsl:when>
                                                    	<xsl:otherwise>-->
                                                        <a href="javascript:boutonStop()">
														<img src="stop.gif" alt="stop"/>
														</a>
                                                        <xsl:text> </xsl:text>
														<a href="javascript:playFrom_W('{@id}')">
														<img src="play.gif" alt="écouter"/>
														</a>
                                                       <!-- </xsl:otherwise>
                                                    </xsl:choose>
                                            </xsl:when>
                                            <xsl:otherwise>
											<a href="javascript:boutonStop()">
												<img src="stop.gif" alt="stop"/>
											</a>
											<a href="javascript:playFrom('{@id}')">
												<img src="play.gif" alt="écouter"/>
											</a>
                                            </xsl:otherwise>
                                        </xsl:choose>-->
										
									</td>
                                   
                                  
                                   
                                  
									<!--<xsl:for-each select="annot:FORM">
										<xsl:sort select="@kindOf"/>
                                       
										
											<xsl:value-of select="."/><br/>
										
                                        
									</xsl:for-each>-->
                                    <xsl:if test="annot:FORM">
                                        	<div class="word_sentence">
                                            <td class="word_form_list">
                                        <!-- Recuperation de la phrase -->
                                        <xsl:for-each select="annot:FORM">
                                        
                                        	<xsl:choose>
                                        		<xsl:when test="@kindOf">
                                        	<xsl:if test="@kindOf='phono'">
                                        		<div class="transcription_phono">
                                        		 <xsl:value-of select="."/>
                                        		</div>
                                        		
                                        	</xsl:if>
                                        	<xsl:if test="@kindOf='ortho'">
                                        		<div class="transcription_ortho">
                                        		<xsl:value-of select="."/>
                                        		</div>
                                        		
                                        	</xsl:if>
                                        	<xsl:if test="@kindOf='phone'">
                                        		<div class="transcription_phone">
                                        		<xsl:value-of select="."/>
                                        		</div>
                                        		
                                        	</xsl:if>
                                        	<xsl:if test="@kindOf='transliter'">
                                        		<div class="transcription_translit">
                                        		<xsl:value-of select="."/>
                                        		</div>
                                        		
                                        	</xsl:if>
                                        		</xsl:when>
                                        		<xsl:otherwise>
                                                <div class="transcription">
                                        			<xsl:value-of select="."/>
                                                    </div>
                                        		</xsl:otherwise>
                                        	</xsl:choose>
                                        	
                                        	<br />
                                            
                                        </xsl:for-each>
                                        </td>
											</div>
                                         
                                        
                                        </xsl:if>
                                  
                                  
                                     <!-- <xsl:if test="annot:FORM">
                                        	<div class="word_sentence">
                                        
                                        <xsl:for-each select="annot:FORM">
                                        	<xsl:choose>
                                        		<xsl:when test="@kindOf">
                                        	<xsl:if test="@kindOf='phono'">
                                        		<td class="transcription1">
                                        		 <xsl:value-of select="."/>
                                        		</td>
                                        		
                                        	</xsl:if>
                                        	<xsl:if test="@kindOf='ortho'">
                                        		<td class="transcription2">
                                        		<xsl:value-of select="."/>
                                        		</td>
                                        		
                                        	</xsl:if>
                                        	<xsl:if test="@kindOf='phone'">
                                        		<td class="transcription3">
                                        		<xsl:value-of select="."/>
                                        		</td>
                                        		
                                        	</xsl:if>
                                        	<xsl:if test="@kindOf='transliter'">
                                        		<td class="transcription4">
                                        		<xsl:value-of select="."/>
                                        		</td>
                                        		
                                        	</xsl:if>
                                        		</xsl:when>
                                        		<xsl:otherwise>
                                                <td class="transcription">
                                        			<xsl:value-of select="."/>
                                                    </td>
                                        		</xsl:otherwise>
                                        	</xsl:choose>
                                        	
                                        	<br />
                                        </xsl:for-each>
											</div>
                                         
                                        
                                        </xsl:if>-->
                                 
                                       <xsl:if test="annot:TRANSL">
                                        	
                                        <!-- Recuperation de la phrase -->
                                        <xsl:for-each select="annot:TRANSL">
                                        <td class="word_transl_list">
                                        	<xsl:choose>
                                            <xsl:when test="(@xml:lang='fr') or (@xml:lang='en')">
                                        	<xsl:if test="@xml:lang='en'">
                                        		<div class="translation_en">
                                        		<xsl:value-of select="."/>
                                        		</div>
                                        		
                                        	</xsl:if>
                                        		
                                        	<xsl:if test="@xml:lang='fr'">
                                        		<div class="translation_fr">
                                        		<xsl:value-of select="."/>
                                        		</div>
                                        		
                                        	</xsl:if>
                                        		
                                     
                                        		
                                        	
                                        		</xsl:when>
                                        		<xsl:otherwise>
                                                <div class="translation_other">
                                        			<xsl:value-of select="."/>
                                                    </div>
                                        		</xsl:otherwise>
                                        	</xsl:choose>
                                        	
                                        	<br />
                                            </td>
                                        </xsl:for-each>
											
                                         
                                        
                                        </xsl:if>
                                        
                                   
                                  
									<!--<xsl:for-each select="annot:TRANSL">
										<xsl:sort select="@xml:lang"/>
										<td class="translation">
											<xsl:value-of select="."/>
										</td>
									</xsl:for-each>
                                    -->
                                    <!-- <xsl:for-each select="annot:TRANSL[@xml:lang='en']">
											<td class="translation1">
												<xsl:value-of select="."/>
											</td>
                                          </xsl:for-each> 
                                          
                                          <xsl:for-each select="annot:TRANSL[@xml:lang='fr']">
											<td class="translation2">
												<xsl:value-of select="."/>
											</td>
                                          </xsl:for-each> 
                                    
                                          
                                          <xsl:for-each select="annot:TRANSL[@xml:lang!='fr' and @xml:lang!='en']">
											<td class="translation3">
												<xsl:value-of select="."/>
											</td>
                                        
                                          </xsl:for-each>
                                         
                                       
                                        
                                        
                                        <br />-->
                                <xsl:if test="annot:NOTE/@message">
                                       <td class="note_info">
                                   <xsl:for-each select="annot:NOTE/@message">
										<xsl:sort select="@xml:lang"/>
										<em><xsl:value-of select="."/><br/></em>
									</xsl:for-each>
                                    	</td>
                                   </xsl:if>
								</tr>
                                
							</xsl:for-each>
						</tbody>
					</table>
				</td>
			</tr>
		</table>
	</xsl:template>
<!--<audio controls> 		
			<source src="mediaUrl_wav" />;
			</audio>-->
            
<xsl:template name="player-audio_html5">
<xsl:param name="mediaUrl" select="''"/>
	<audio controls="controls" id="player" name="player" autobuffer="true"> 
  <!-- <audio controls="controls" id="player" name="player">-->
		
        <!--<source src="http://fedora.tge-adonis.fr:8090/fedora/get/CRDO-Paris:235213/DEPOT_record_44k.mp3
" type="audio/mpeg" />-->
        <source src="{$mediaUrl}"></source>
	</audio>
     
    <script language="Javascript">
	<xsl:text>var audioElement = document.createElement('player');
	audioElement.setAttribute('src', "{$mediaUrl}");
	audioElement.addEventListener("load", function() { 
		audioElement.play()
		$(".duration span").html(audioElement.duration);
		$(".filename span").html(audioElement.src);
	}, true);
	</xsl:text>
	</script>
   
    <script language="Javascript">
			<xsl:text>var IDS    = new Array(</xsl:text>
			<xsl:for-each select="//annot:TEXT/annot:S | //annot:WORDLIST/annot:W">
	   			"<xsl:value-of select="@id"/>"
	  	 		<xsl:if test="position()!=last()">
				<xsl:text>,</xsl:text>
				</xsl:if>
			</xsl:for-each>
			<xsl:text>);</xsl:text>
			
			<xsl:text>var STARTS = new Array(</xsl:text>
			<xsl:for-each select="//annot:TEXT/annot:S/annot:AUDIO | //annot:WORDLIST/annot:W/annot:AUDIO">
	   			"<xsl:value-of select="@start"/>"
	   			<xsl:if test="position()!=last()">
				<xsl:text>,</xsl:text>
				</xsl:if>
			</xsl:for-each>
			<xsl:text>);</xsl:text>
			
			<xsl:text>var ENDS   = new Array(</xsl:text>
			<xsl:for-each select="//annot:TEXT/annot:S/annot:AUDIO | //annot:WORDLIST/annot:W/annot:AUDIO">
	  	 		"<xsl:value-of select="@end"/>"
	  	 		<xsl:if test="position()!=last()">
				<xsl:text>,</xsl:text>
				</xsl:if>
			</xsl:for-each>
			<xsl:text>);</xsl:text>
		</script>
        
        
        
        <!--<object id="player" width="350" height="16" classid="clsid:02BF25D5-8C17-4B23-BC80-D3488ABDDC6B" codebase="http://www.apple.com/qtactivex/qtplugin.cab">
			<param name="src" value="{$mediaUrl_wav}"/>
			<param name="AUTOPLAY" value="false"/>
			<param name="CONTROLLER" value="true"/>
			<embed width="350pt" height="16px" pluginspace="http://www.apple.com/quicktime/download/" controller="true" src="{$mediaUrl_wav}" name="player" autostart="false" enablejavascript="true">
       			</embed>
		</object>-->
        
<!-- <xsl:choose>
		<xsl:when test="$aff_lang='fr'">
                        	<span style="margin-left:10px">Lecture en continu :</span><input id="karaoke" name="karaoke" checked="checked" type="checkbox"/>
                        </xsl:when>
                        <xsl:otherwise> 
                    		<span style="margin-left:10px">Continuous playing:</span><input id="karaoke" name="karaoke" checked="checked" type="checkbox"/>
                        </xsl:otherwise>
                        </xsl:choose>-->
		<script type="text/javascript" src="showhide.js">.</script>
        <script type="text/javascript" src="evtPlayerManager.js">.</script>
		<script type="text/javascript" src="html5PlayerManager.js">.</script>
		
</xsl:template>





<xsl:template name="player-audio_html5_bis">
<xsl:param name="mediaUrl" select="''"/>
	<audio controls="controls" id="player" name="player" autobuffer="true"> 

        <source src="{$mediaUrl}" />
	</audio>
     
    <script language="Javascript">
	<xsl:text>var audioElement = document.createElement('player');
	audioElement.setAttribute('src', "{$mediaUrl}");
	audioElement.addEventListener("load", function() { 
		audioElement.play()
		$(".duration span").html(audioElement.duration);
		$(".filename span").html(audioElement.src);
	}, true);
	</xsl:text>
	</script>
   
    <script language="Javascript">
			<xsl:text>var IDS    = new Array(</xsl:text>
			<xsl:for-each select="//annot:TEXT/annot:S | //annot:WORDLIST/annot:W">
	   			"<xsl:value-of select="@id"/>"
	  	 		<xsl:if test="position()!=last()">
				<xsl:text>,</xsl:text>
				</xsl:if>
			</xsl:for-each>
			<xsl:text>);</xsl:text>
			
			<xsl:text>var STARTS = new Array(</xsl:text>
			<xsl:for-each select="//annot:TEXT/annot:S/annot:AUDIO | //annot:WORDLIST/annot:W/annot:AUDIO">
	   			"<xsl:value-of select="@start"/>"
	   			<xsl:if test="position()!=last()">
				<xsl:text>,</xsl:text>
				</xsl:if>
			</xsl:for-each>
			<xsl:text>);</xsl:text>
			
			<xsl:text>var ENDS   = new Array(</xsl:text>
			<xsl:for-each select="//annot:TEXT/annot:S/annot:AUDIO | //annot:WORDLIST/annot:W/annot:AUDIO">
	  	 		"<xsl:value-of select="@end"/>"
	  	 		<xsl:if test="position()!=last()">
				<xsl:text>,</xsl:text>
				</xsl:if>
			</xsl:for-each>
			<xsl:text>);</xsl:text>
		</script>
     
		<script type="text/javascript" src="showhide.js">.</script>
        <script type="text/javascript" src="evtPlayerManager.js">.</script>
		<script type="text/javascript" src="html5PlayerManager_bis.js">.</script>
		
</xsl:template>




	<xsl:template name="player-audio_wav">
		<xsl:param name="mediaUrl_wav" select="''"/>

		<script language="Javascript">
			<xsl:text>var IDS    = new Array(</xsl:text>
			<xsl:for-each select="//annot:TEXT/annot:S|//annot:WORDLIST/annot:W">
	   			"<xsl:value-of select="@id"/>"
	  	 		<xsl:if test="position()!=last()"><xsl:text>,</xsl:text></xsl:if>
			</xsl:for-each>
			<xsl:text>);</xsl:text>
			
			<xsl:text>var STARTS = new Array(</xsl:text>
			<xsl:for-each select="//annot:TEXT/annot:S/annot:AUDIO|//annot:WORDLIST/annot:W/annot:AUDIO">
	   			"<xsl:value-of select="@start"/>"
	   			<xsl:if test="position()!=last()"><xsl:text>,</xsl:text></xsl:if>
			</xsl:for-each>
			<xsl:text>);</xsl:text>
			
			<xsl:text>var ENDS   = new Array(</xsl:text>
			<xsl:for-each select="//annot:TEXT/annot:S/annot:AUDIO|//annot:WORDLIST/annot:W/annot:AUDIO">
	  	 		"<xsl:value-of select="@end"/>"
	  	 		<xsl:if test="position()!=last()"><xsl:text>,</xsl:text></xsl:if>
			</xsl:for-each>
			<xsl:text>);</xsl:text>
		</script>
		
		<object id="player" width="350" height="16" classid="clsid:02BF25D5-8C17-4B23-BC80-D3488ABDDC6B" codebase="http://www.apple.com/qtactivex/qtplugin.cab">
			<param name="src" value="{$mediaUrl_wav}"/>
			<param name="AUTOPLAY" value="false"/>
			<param name="CONTROLLER" value="true"/>
			<embed width="350pt" height="16px" pluginspace="http://www.apple.com/quicktime/download/" controller="true" src="{$mediaUrl_wav}" name="player" autostart="false" enablejavascript="true">
       			</embed>
		</object>
        
     
       <!--<object data="quicktimealt311.exe" width="400" height="18" id="quicktimealt311" name="quicktimealt311">
<param name="src" value="{$mediaUrl_wav}"/>
<embed width="350pt" height="16px" pluginspace="quicktimealt31.exe" controller="true" src="{$mediaUrl_wav}" name="player" autostart="false" enablejavascript="true">
       			</embed>
</object>-->
        <xsl:choose>
		<xsl:when test="$aff_lang='fr'">
                        	<span style="margin-left:10px">Lecture en continu :</span><input id="karaoke" name="karaoke" checked="checked" type="checkbox"/>
                        </xsl:when>
                        <xsl:otherwise> 
                    		<span style="margin-left:10px">Continuous playing:</span><input id="karaoke" name="karaoke" checked="checked" type="checkbox"/>
                        </xsl:otherwise>
                        </xsl:choose>
		<script type="text/javascript" src="showhide.js">.</script>
		<script type="text/javascript" src="evtPlayerManager.js">.</script>
		<script type="text/javascript" src="qtPlayerManager.js">.</script>
        
        </xsl:template>
       
        
        
	<!--<xsl:template name="player-audio_mp3">
		<xsl:param name="mediaUrl_mp3" select="''"/>
        <xsl:param name="mediaUrl_wav" select="''"/>
		<script language="Javascript">
			<xsl:text>var IDS    = new Array(</xsl:text>
			<xsl:for-each select="//annot:TEXT/annot:S|//annot:WORDLIST/annot:W">
	   			"<xsl:value-of select="@id"/>"
	  	 		<xsl:if test="position()!=last()"><xsl:text>,</xsl:text></xsl:if>
			</xsl:for-each>
			<xsl:text>);</xsl:text>
			
			<xsl:text>var STARTS = new Array(</xsl:text>
			<xsl:for-each select="//annot:TEXT/annot:S/annot:AUDIO|//annot:WORDLIST/annot:W/annot:AUDIO">
	   			"<xsl:value-of select="@start"/>"
	   			<xsl:if test="position()!=last()"><xsl:text>,</xsl:text></xsl:if>
			</xsl:for-each>
			<xsl:text>);</xsl:text>
			
			<xsl:text>var ENDS   = new Array(</xsl:text>
			<xsl:for-each select="//annot:TEXT/annot:S/annot:AUDIO|//annot:WORDLIST/annot:W/annot:AUDIO">
	  	 		"<xsl:value-of select="@end"/>"
	  	 		<xsl:if test="position()!=last()"><xsl:text>,</xsl:text></xsl:if>
			</xsl:for-each>
			<xsl:text>);</xsl:text>
		</script>-->

	<!--<object type="application/x-shockwave-flash"
	data="dewplayer.swf?son={$mediaUrl_mp3}"
	width="350" height="20"> <param name="movie" value="{$mediaUrl_mp3}"/>
	</object>-->
    
   <!-- <object type="application/x-shockwave-flash" data="dewplayer.swf" width="400" height="18" id="dewplayer" name="dewplayer">
<param name="wmode" value="transparent" />
<param name="movie" value="dewplayer.swf" />
<param name="flashvars" value="mp3={$mediaUrl_mp3}&amp;showtime=1" />
</object>-->
     
    <!-- <object type="application/x-shockwave-flash" data="dewplayer.swf?mp3={$mediaUrl_mp3}&amp;bgcolor=CCCCCC&amp;volume=100&amp;showtime=1" width="200" height="20">
  <param name="movie" value="dewplayer.swf?mp3={$mediaUrl_mp3}&amp;bgcolor=CCCCCC&amp;volume=100&amp;showtime=1&amp;autoplay=false" />
</object>-->

    
        
		
		<!--<script type="text/javascript" src="showhide.js">.</script>
		<script type="text/javascript" src="evtPlayerManager.js">.</script>
		<script type="text/javascript" src="qtPlayerManager.js">.</script>
	</xsl:template>-->
    
</xsl:stylesheet>