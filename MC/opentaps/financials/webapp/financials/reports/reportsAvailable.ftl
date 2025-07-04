<#--
 * Copyright (c) Open Source Strategies, Inc.
 *
 * Opentaps is free software: you can redistribute it and/or modify it
 * under the terms of the GNU Affero General Public License as published
 * by the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Opentaps is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 * along with Opentaps.  If not, see <http://www.gnu.org/licenses/>.
 *  
-->
<@import location="component://opentaps-common/webapp/common/includes/lib/opentapsFormMacros.ftl"/>

<#-- TODO: probably some kind of permission checking to see that this userLogin can view such and such reports -->
<div class="tabletext" style="margin-bottom: 30px;">
<#-- ><h4>usuario:Admin contrase&ntildea:password</h4></br> -->
<#assign hostname = request.getServerName()/>
<table style="width: 100%;">
<tr>
  <td style="vertical-align: top; width: 35%;">
	
     <#-- CONTABLES HCGZ -->
    <@displayReportGroup group="CONAC_CONTABLES" nameOnly=true>
      <li>
                        <a href="http://40.0.0.71:8080/pentaho/api/repos/%3Ahome%3AFINABIEN%3AContables%3AEF0-Balanza_de_comprobacion.prpt/viewer" target="_blank">
                            ${uiLabelMap.EF0}
                        </a>
                    </li>
                    <li>
                        <a href="http://40.0.0.71:8080/pentaho/api/repos/%3Ahome%3AFINABIEN%3AContables%3AEF1.1-Estado_de_situaci%25C3%25B3n_financiera.prpt/viewer" target="_blank">
                           ${uiLabelMap.AccountingEF1_1}
                        </a>
                    </li>
                    <li>
                        <a href="http://40.0.0.71:8080/pentaho/api/repos/%3Ahome%3AFINABIEN%3AContables%3AEF1.2-Estado_de_Situacion_Financiera_Anual.prpt/viewer" target="_blank">
                            ${uiLabelMap.AccountingEF1_2}
                        </a>
                    </li>
                    <li>
                        <a href="http://40.0.0.71:8080/pentaho/api/repos/%3Ahome%3AFINABIEN%3AContables%3AEF3.1-Estado_de_actividades.prpt/viewer" target="_blank">
                            ${uiLabelMap.EF31}
                        </a>
                    </li>
                    <li>
                        <a href="http://40.0.0.71:8080/pentaho/api/repos/%3Ahome%3AFINABIEN%3AContables%3AEF3.2-Estado_de_Actividades_Anual.prpt/viewer" target="_blank">
                            ${uiLabelMap.EF32}
                        </a>
                    </li>     
    </@displayReportGroup>

  </td>
</tr>

</table>
</div>

