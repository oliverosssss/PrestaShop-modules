{if $categoryList === false || sizeof($categoryList) === 0}
     <tr>
          <td colspan="3" class="center">{$noCatFound}</td>
     </tr>
{else}
     {foreach from=$categoryList key=k  item=c}
          <tr{if $k % 2 !== 0} class="alt_row"{/if}>
               <td>{$c.name} ({if isset($getCatInStock[$c.id_category])}
                    {$getCatInStock[$c.id_category]}
                    {/if})
               </td>
               <td id="categoryPath{$c.id_category}">
                    {if isset($categoryConfigList[$c.id_category]) && isset($categoryConfigList[$c.id_category].var)}
                         {$categoryConfigList[$c.id_category].var}
                    {else}
                         <select name="category{$c.id_category}" id="categoryLevel1-{$c.id_category}" rel="{$c.id_category}" style="font-size: 12px; width: 160px;" OnChange="changeCategoryMatch(1, {$c.id_category});">
                              <option value="0">{$noCatSelected}</option>
                              {foreach from=$eBayCategoryList item=ec}
                                   <option value="{$ec.id_ebay_category}">{$ec.name}{if $ec.is_multi_sku == 1} *{/if}</option>
                              {/foreach}
                         </select>
                    {/if}
               </td>
               <td>
                    <input type="text" size="4" maxlength="4" name="percent{$c.id_category}" id="percent{$c.id_category}" rel="{$c.id_category}" style="font-size: 12px;" value="{if isset($categoryConfigList[$c.id_category]) && isset($categoryConfigList[$c.id_category].var)}{$categoryConfigList[$c.id_category].percent}{/if}" />
               </td>
          </tr>
     {/foreach}
{/if}