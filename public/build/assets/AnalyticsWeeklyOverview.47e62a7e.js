import{V as m}from"./vue3-apexcharts.common.28a0b127.js";import{l as v,m as g,a as x,w as a,H as n,G as i,o as _,b as t,h as s,g as c,d as k,p as d,u}from"./app.21a975b2.js";import{a as y,c as V,b as w,V as T}from"./VCard.81ba3810.js";const C={class:"me-n3"},S=s("div",{class:"d-flex align-center mb-3"},[s("h5",{class:"text-h5 me-4"}," 45% "),s("p",null," Your sales performance is 45% \u{1F60E} better compared to last month ")],-1),W={__name:"AnalyticsWeeklyOverview",setup($){const l=v(),f=g(()=>{const e=n(l.current.value.colors),o=n(l.current.value.variables),h=`rgba(${i(e.value["on-surface"])},${o.value["disabled-opacity"]})`,b=`rgba(${i(String(o.value["border-color"]))},${o.value["border-opacity"]})`;return{chart:{parentHeightOffset:0,toolbar:{show:!1}},plotOptions:{bar:{borderRadius:9,distributed:!0,columnWidth:"40%",endingShape:"rounded",startingShape:"rounded"}},stroke:{width:2,colors:[e.value.surface]},legend:{show:!1},grid:{borderColor:b,strokeDashArray:7,padding:{top:-1,right:0,left:-12,bottom:5}},dataLabels:{enabled:!1},colors:[e.value.background,e.value.background,e.value.background,e.value.primary,e.value.background,e.value.background],states:{hover:{filter:{type:"none"}},active:{filter:{type:"none"}}},xaxis:{categories:["Sun","Mon","Tue","Wed","Thu","Fri","Sat"],tickPlacement:"on",labels:{show:!1},crosshairs:{opacity:0},axisTicks:{show:!1},axisBorder:{show:!1}},yaxis:{show:!0,tickAmount:4,labels:{offsetX:-17,style:{colors:h,fontSize:"12px"},formatter:r=>`${r>999?`${(r/1e3).toFixed(0)}`:r}k`}}}}),p=[{data:[37,57,45,75,57,40,65]}];return(e,o)=>(_(),x(y,null,{default:a(()=>[t(w,null,{append:a(()=>[s("div",C,[t(c,{icon:"",size:"x-small",color:"default",variant:"text"},{default:a(()=>[t(k,{size:"24",icon:"mdi-dots-vertical"})]),_:1})])]),default:a(()=>[t(V,null,{default:a(()=>[d("Weekly Overview")]),_:1})]),_:1}),t(T,null,{default:a(()=>[t(u(m),{type:"bar",options:u(f),series:p,height:220},null,8,["options"]),S,t(c,{block:""},{default:a(()=>[d(" Details ")]),_:1})]),_:1})]),_:1}))}};export{W as default};
