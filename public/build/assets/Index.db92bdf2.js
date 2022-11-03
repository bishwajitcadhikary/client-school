import{r as h,aa as f,d as n,w as a,au as O,M as k,b as A,o as d,V as v,a9 as t,g as l,ab as I,c as i,bh as y,f as u,S as c,k as w,n as g,O as B,az as P,e as T,i as j,bi as z,aB as R,a5 as S}from"./app.8dfb89f9.js";import{V as F}from"./VRow.f3e7ba42.js";import{V as L}from"./VCol.4f44dc97.js";import{V as C}from"./VTable.7dbc1346.js";import{V as N}from"./VTooltip.5b2ba475.js";/* empty css              */const G={class:"text-center"},E={class:"text-center"},M={class:"text-center"},U={colspan:"2"},q=["src"],Z={__name:"Index",props:{orders:{type:Object,default:null}},setup(V){const _=V,$=S("dateFormat"),m=h(!1),s=h(null),b=e=>{m.value=!0,s.value=_.orders.data.find(o=>o.id===e)};return(e,o)=>{const D=A("AppLayout");return d(),f(k,null,[n(D,{title:e.$t("Orders")},{default:a(()=>[n(F,{class:"match-height"},{default:a(()=>[n(L,{cols:"12"},{default:a(()=>[n(v,null,{default:a(()=>[n(C,{class:"table-rounded","hide-default-footer":""},{default:a(()=>[t("thead",null,[t("tr",null,[t("th",null,l(e.$t("Order ID")),1),t("th",null,l(e.$t("Plan")),1),t("th",null,l(e.$t("Interval")),1),t("th",null,l(e.$t("Gateway")),1),t("th",G,l(e.$t("Status")),1),t("th",null,l(e.$t("Order At")),1),t("th",null,l(e.$t("Actions")),1)])]),t("tbody",null,[(d(!0),f(k,null,I(V.orders.data,r=>(d(),f("tr",{key:r.id},[t("td",null,l(r.id),1),t("td",null,l(r.plan.name),1),t("td",null,l(r.interval),1),t("td",null,l(r.gateway.name),1),t("td",E,[r.status==0?(d(),i(c,{key:0,color:"warning",dark:""},{default:a(()=>[n(y,{width:"3",size:"x-small",class:"me-3",color:"warning",indeterminate:""}),u(" "+l(e.$t("Pending")),1)]),_:1})):r.status==1?(d(),i(c,{key:1,color:"primary",dark:"","prepend-icon":"mdi-check"},{default:a(()=>[u(l(e.$t("Accepted")),1)]),_:1})):(d(),i(c,{key:2,color:"error",dark:"","prepend-icon":"mdi-close"},{default:a(()=>[u(l(e.$t("Rejected")),1)]),_:1}))]),t("td",null,l(w($)(r.created_at)),1),t("td",M,[n(N,{text:e.$t("View Details")},{activator:a(({props:p})=>[n(g,B({variant:"plain",size:"small",icon:"mdi-eye-outline"},p,{onClick:H=>b(r.id)}),null,16,["onClick"])]),_:2},1032,["text"])])]))),128))])]),_:1})]),_:1})]),_:1})]),_:1})]),_:1},8,["title"]),n(O,{modelValue:m.value,"onUpdate:modelValue":o[1]||(o[1]=r=>m.value=r),"max-width":"500",persistent:""},{default:a(()=>[n(v,null,{default:a(()=>[n(P,null,{default:a(()=>[n(T,null,{default:a(()=>[u(l(e.$t("Order Details")),1)]),_:1})]),_:1}),n(j,null,{default:a(()=>[n(C,null,{default:a(()=>{var r,p;return[t("tbody",null,[t("tr",null,[t("td",null,l(e.$t("Order ID")),1),t("td",null,l(s.value.id),1)]),t("tr",null,[t("td",null,l(e.$t("Transaction ID")),1),t("td",null,l(s.value.trx_id),1)]),t("tr",null,[t("td",null,l(e.$t("Plan")),1),t("td",null,l((r=s.value.plan)==null?void 0:r.name),1)]),t("tr",null,[t("td",null,l(e.$t("Gateway")),1),t("td",null,l((p=s.value.gateway)==null?void 0:p.name),1)]),t("tr",null,[t("td",null,l(e.$t("Status")),1),t("td",null,[s.value.status==0?(d(),i(c,{key:0,color:"warning",dark:""},{default:a(()=>[n(y,{width:"3",size:"x-small",class:"me-3",color:"warning",indeterminate:""}),u(" "+l(e.$t("Pending")),1)]),_:1})):s.value.status==1?(d(),i(c,{key:1,color:"primary",dark:"","prepend-icon":"mdi-check"},{default:a(()=>[u(l(e.$t("Accepted")),1)]),_:1})):(d(),i(c,{key:2,color:"error",dark:"","prepend-icon":"mdi-close"},{default:a(()=>[u(l(e.$t("Rejected")),1)]),_:1}))])]),t("tr",null,[t("td",null,l(e.$t("Description")),1),t("td",null,l(s.value.description),1)]),t("tr",null,[t("td",null,l(e.$t("Order At")),1),t("td",null,l(w($)(s.value.created_at)),1)]),t("tr",null,[t("td",U,[n(z,{class:"pa-5"},{default:a(()=>[t("img",{src:s.value.screenshot,alt:""},null,8,q)]),_:1})])])])]}),_:1})]),_:1}),n(R,null,{default:a(()=>[n(g,{color:"primary",variant:"text",block:"",onClick:o[0]||(o[0]=r=>m.value=!1)},{default:a(()=>[u(l(e.$t("Close")),1)]),_:1})]),_:1})]),_:1})]),_:1},8,["modelValue"])],64)}}};export{Z as default};