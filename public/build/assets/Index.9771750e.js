import A from"./SettingsDrawerContent.270bc2bd.js";import{r as N,av as p,d as o,w as n,aI as B,M as k,b as I,o as i,V as b,au as t,g as l,aw as L,aJ as w,k as f,c as V,f as d,bD as D,n as m,O as h,m as T,i as G,aP as F,ar as M}from"./app.d12111a2.js";import{V as S}from"./VContainer.6eda6352.js";import{V as j}from"./VTable.4e88a8b6.js";import{V as y}from"./VChip.63a6f5b3.js";import{V as $}from"./VTooltip.4db7f416.js";import"./VSelect.7ed835a6.js";import"./VCheckboxBtn.522e9dc8.js";import"./VSelectionControl.2cf78e55.js";/* empty css              */const E=t("th",{width:"5%"}," # ",-1),O={class:"text-center"},P={class:"text-center"},q={class:"pa-1",width:"10%"},Z={__name:"Index",props:{gateways:{type:Object,default:null}},setup(g){const c=M("currencyFormat"),u=N(!1);return(e,r)=>{const _=I("AppLayout");return i(),p(k,null,[o(_,{action:{href:e.route("admin.settings.gateways.create"),icon:"mdi-plus",title:e.$t("Add New")},title:e.$t("Gateways")},{"sub-navbar":n(()=>[o(A)]),default:n(()=>[o(S,null,{default:n(()=>[o(b,null,{default:n(()=>[o(j,{class:"table-rounded"},{default:n(()=>[t("thead",null,[t("tr",null,[E,t("th",null,l(e.$t("Logo")),1),t("th",null,l(e.$t("Name")),1),t("th",null,l(e.$t("Namespace")),1),t("th",null,l(e.$t("Currency")),1),t("th",null,l(e.$t("Charge")),1),t("th",null,l(e.$t("Min Amount")),1),t("th",null,l(e.$t("Max Amount")),1),t("th",O,l(e.$t("Status")),1),t("th",null,l(e.$t("Actions")),1)])]),t("tbody",null,[(i(!0),p(k,null,L(g.gateways.data,(a,v)=>(i(),p("tr",{key:v},[t("td",null,l(v+1),1),t("td",null,[o(w,{src:a.logo,height:"50"},null,8,["src"])]),t("td",null,l(a.name),1),t("td",null,l(a.namespace),1),t("td",null,l(a.currency.code),1),t("td",null,l(f(c)(a.charge,a.currency.code)),1),t("td",null,l(f(c)(a.min_amount,a.currency.code)),1),t("td",null,l(f(c)(a.max_amount,a.currency.code)),1),t("td",P,[a.is_active?(i(),V(y,{key:0,color:"primary"},{default:n(()=>[d(l(e.$t("Active")),1)]),_:1})):(i(),V(y,{key:1,color:"red","text-color":"white"},{default:n(()=>[d(l(e.$t("Inactive")),1)]),_:1}))]),t("td",q,[o(D,{rounded:"xl"},{default:n(()=>[o($,{text:e.$t("Show Gateway Infomation")},{activator:n(({props:s})=>[o(m,h({icon:"mdi-clipboard-edit-outline"},s,{onClick:r[0]||(r[0]=C=>u.value=!0)}),null,16)]),_:1},8,["text"]),o($,{text:e.$t("Edit Gateway")},{activator:n(({props:s})=>[o(m,h({icon:"mdi-clipboard-edit-outline"},s,{onClick:C=>e.$inertia.visit(e.route("admin.settings.gateways.edit",{gateway:a.id}))}),null,16,["onClick"])]),_:2},1032,["text"]),o($,{text:e.$t("Delete Gateway")},{activator:n(({props:s})=>[a.is_default?T("",!0):(i(),V(m,h({key:0,icon:"mdi-delete-outline"},s,{onClick:C=>{u.value=!0,e.deletableLangId=a.id}}),null,16,["onClick"]))]),_:2},1032,["text"])]),_:2},1024)])]))),128))])]),_:1})]),_:1})]),_:1})]),_:1},8,["action","title"]),o(B,{modelValue:u.value,"onUpdate:modelValue":r[2]||(r[2]=a=>u.value=a),"max-width":"50%"},{default:n(()=>[o(b,null,{default:n(()=>[o(G,null,{default:n(()=>[d(" Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ")]),_:1}),o(F,null,{default:n(()=>[o(m,{color:"primary",block:"",onClick:r[1]||(r[1]=a=>u.value=!1)},{default:n(()=>[d(" Close Dialog ")]),_:1})]),_:1})]),_:1})]),_:1},8,["modelValue"])],64)}}};export{Z as default};
