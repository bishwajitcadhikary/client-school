import{V as h}from"./vue3-apexcharts.common.e1ac99c2.js";import{ah as u,E as s,c as d,w as o,V as f,av as p,o as x,a as l,u as i,ac as m,b as n}from"./app.769d2bc8.js";const b=n("h6",{class:"text-h6"}," $86.4k ",-1),_=n("p",{class:"text-center font-weight-semibold mb-0"}," Total Profit ",-1),y={__name:"AnalyticsTotalProfitLineCharts",setup(v){const t=u(),e=s(()=>t.current.value.colors),a=s(()=>t.current.value.variables),r=[{data:[0,20,5,30,15,45]}],c=s(()=>({chart:{parentHeightOffset:0,toolbar:{show:!1}},tooltip:{enabled:!1},grid:{borderColor:`rgba(${p(String(a.value["border-color"]))},${a.value["border-opacity"]})`,strokeDashArray:6,xaxis:{lines:{show:!0}},yaxis:{lines:{show:!1}},padding:{top:-10,left:-7,right:5,bottom:5}},stroke:{width:3,lineCap:"butt",curve:"straight"},colors:[e.value.primary],markers:{size:6,offsetY:4,offsetX:-2,strokeWidth:3,colors:["transparent"],strokeColors:"transparent",discrete:[{size:5.5,seriesIndex:0,strokeColor:e.value.primary,fillColor:e.value.surface,dataPointIndex:r[0].data.length-1}],hover:{size:7}},xaxis:{labels:{show:!1},axisTicks:{show:!1},axisBorder:{show:!1}},yaxis:{labels:{show:!1}}}));return(g,w)=>(x(),d(f,null,{default:o(()=>[l(m,null,{default:o(()=>[b,l(i(h),{type:"line",options:i(c),series:r,height:100},null,8,["options"]),_]),_:1})]),_:1}))}};export{y as default};
