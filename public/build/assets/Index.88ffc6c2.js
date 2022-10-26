import{aA as E,h as N,aF as V,aB as m,c as T,w as s,r as I,o as g,a as t,V as A,b as o,d as C,e as B,t as d,F as D,u as h,a$ as j,K as p,L as _,g as K,al as M,f as $,ac as O,a_ as q,ad as z,aD as G,b0 as H}from"./app.769d2bc8.js";import J from"./SettingsDrawerContent.71129501.js";import{V as Q}from"./VTable.cecf783c.js";import{V as U}from"./VSwitch.96e3a9f3.js";import{V as b}from"./VTooltip.3df24ef8.js";import{V as R}from"./VContainer.e19bcb16.js";import"./VSelect.20e484dd.js";import"./VCheckboxBtn.416dd0ae.js";import"./VChip.9639af3b.js";/* empty css              */const W=o("th",null,null,-1),X={class:"pa-1",width:"10%"},ie={__name:"Index",props:{languages:{type:Object,default:null}},setup(L){const S=L,v=E(),c=N(!1),k=N(null),F=[V("Name"),V("Code"),V("Status"),V("Default")],r=m({statuses:[...S.languages.data.map(e=>!!e.is_active)]});function y(e,l){m({_method:"PUT",is_active:r.statuses[e]}).post(route("admin.settings.languages.change-status",{language:l}),{onSuccess:u=>{v.showNotification(u),r.statuses=u.props.languages.data.map(a=>!!a.is_active)}})}const f=m({statuses:[...S.languages.data.map(e=>!!e.is_default)]});function P(e,l){m({_method:"PUT",is_default:r.statuses[e]}).post(route("admin.settings.languages.change-default",{language:l}),{onSuccess:u=>{v.showNotification(u),f.statuses=u.props.languages.data.map(a=>!!a.is_default)}})}function x(){c.value=!1,m({}).delete(route("admin.settings.languages.destroy",{language:k.value}),{onSuccess:e=>{v.showNotification(e),r.statuses=e.props.languages.data.map(l=>!!l.is_active),f.statuses=e.props.languages.data.map(l=>!!l.is_default)}})}return(e,l)=>{const u=I("AdminLayout");return g(),T(u,{title:e.$t("Languages"),action:{href:e.route("admin.settings.languages.create"),icon:"mdi-plus",title:e.$t("Add New")}},{"sub-navbar":s(()=>[t(J)]),default:s(()=>[t(R,null,{default:s(()=>[t(A,null,{default:s(()=>[t(Q,{class:"table-rounded"},{default:s(()=>[o("thead",null,[o("tr",null,[(g(),C(D,null,B(F,a=>o("th",null,d(a),1)),64)),W])]),o("tbody",null,[(g(!0),C(D,null,B(L.languages.data,(a,i)=>(g(),C("tr",{key:i},[o("td",null,d(a.name),1),o("td",null,d(a.code),1),o("td",null,[t(U,{modelValue:h(r).statuses[i],"onUpdate:modelValue":n=>h(r).statuses[i]=n,color:"primary","hide-detail":"",onChange:n=>y(i,a.id)},null,8,["modelValue","onUpdate:modelValue","onChange"])]),o("td",null,[t(U,{modelValue:h(f).statuses[i],"onUpdate:modelValue":n=>h(f).statuses[i]=n,color:"primary","hide-details":"",onChange:n=>P(i,a.id)},null,8,["modelValue","onUpdate:modelValue","onChange"])]),o("td",X,[t(j,{rounded:"xl"},{default:s(()=>[t(b,{text:e.$t("Edit Phrases")},{activator:s(({props:n})=>[t(p,_({icon:"mdi-translate"},n,{onClick:w=>e.$inertia.visit(e.route("admin.settings.languages.edit-phrases",{language:a.id}))}),null,16,["onClick"])]),_:2},1032,["text"]),t(b,{text:e.$t("Edit Language")},{activator:s(({props:n})=>[t(p,_({icon:"mdi-clipboard-edit-outline"},n,{onClick:w=>e.$inertia.visit(e.route("admin.settings.languages.edit",{language:a.id}))}),null,16,["onClick"])]),_:2},1032,["text"]),t(b,{text:e.$t("Delete Language")},{activator:s(({props:n})=>[a.is_default?K("",!0):(g(),T(p,_({key:0,icon:"mdi-delete-outline"},n,{onClick:w=>{c.value=!0,k.value=a.id}}),null,16,["onClick"]))]),_:2},1032,["text"])]),_:2},1024)])]))),128))])]),_:1})]),_:1})]),_:1}),t(H,{modelValue:c.value,"onUpdate:modelValue":l[1]||(l[1]=a=>c.value=a),"max-width":"290"},{default:s(()=>[t(A,{class:"pa-3"},{default:s(()=>[t(M,{class:"text-h5 text-center"},{default:s(()=>[$(d(e.$t("Are your sure to delete?")),1)]),_:1}),t(O,{class:"text-center"},{default:s(()=>[o("p",null,d(e.$t("Action cannot be undone")),1)]),_:1}),t(q,null,{default:s(()=>[t(z),t(p,{onClick:l[0]||(l[0]=a=>c.value=!1)},{default:s(()=>[$(d(e.$t("Cancel")),1)]),_:1}),t(p,{color:"error",onClick:G(x,["stop"])},{default:s(()=>[$(d(e.$t("Delete")),1)]),_:1},8,["onClick"])]),_:1})]),_:1})]),_:1},8,["modelValue"])]),_:1},8,["title","action"])}}};export{ie as default};
