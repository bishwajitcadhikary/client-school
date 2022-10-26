import{u as E,v as N,m as V,a as c,c as T,w as s,r as I,o as g,b as t,V as U,at as o,au as C,av as A,t as d,L as B,i as h,bm as j,k as p,N as _,aw as M,d as O,e as $,g as q,b0 as z,b1 as G,h as H,aV as J}from"./app.dc2d0110.js";import K from"./SettingsDrawerContent.467232ae.js";import{V as Q}from"./VTable.13703ca8.js";import{V as D}from"./VSwitch.ccb29c42.js";import{V as b}from"./VTooltip.e3cacf25.js";import{V as R}from"./VContainer.ae849916.js";import"./VSelect.1c594559.js";import"./VCheckboxBtn.8dc877ea.js";import"./VChip.3dfe68ed.js";/* empty css              */const W=o("th",null,null,-1),X={class:"pa-1",width:"10%"},ie={__name:"Index",props:{languages:{type:Object,default:null}},setup(k){const w=k,v=E(),m=N(!1),L=N(null),y=[V("Name"),V("Code"),V("Status"),V("Default")],r=c({statuses:[...w.languages.data.map(e=>!!e.is_active)]});function F(e,l){c({_method:"PUT",is_active:r.statuses[e]}).post(route("admin.settings.languages.change-status",{language:l}),{onSuccess:u=>{v.showNotification(u),r.statuses=u.props.languages.data.map(a=>!!a.is_active)}})}const f=c({statuses:[...w.languages.data.map(e=>!!e.is_default)]});function P(e,l){c({_method:"PUT",is_default:r.statuses[e]}).post(route("admin.settings.languages.change-default",{language:l}),{onSuccess:u=>{v.showNotification(u),f.statuses=u.props.languages.data.map(a=>!!a.is_default)}})}function x(){m.value=!1,c({}).delete(route("admin.settings.languages.destroy",{language:L.value}),{onSuccess:e=>{v.showNotification(e),r.statuses=e.props.languages.data.map(l=>!!l.is_active),f.statuses=e.props.languages.data.map(l=>!!l.is_default)}})}return(e,l)=>{const u=I("AdminLayout");return g(),T(u,{title:e.$t("Languages"),action:{href:e.route("admin.settings.languages.create"),icon:"mdi-plus",title:e.$t("Add New")}},{"sub-navbar":s(()=>[t(K)]),default:s(()=>[t(R,null,{default:s(()=>[t(U,null,{default:s(()=>[t(Q,{class:"table-rounded"},{default:s(()=>[o("thead",null,[o("tr",null,[(g(),C(B,null,A(y,a=>o("th",null,d(a),1)),64)),W])]),o("tbody",null,[(g(!0),C(B,null,A(k.languages.data,(a,i)=>(g(),C("tr",{key:i},[o("td",null,d(a.name),1),o("td",null,d(a.code),1),o("td",null,[t(D,{modelValue:h(r).statuses[i],"onUpdate:modelValue":n=>h(r).statuses[i]=n,color:"primary","hide-detail":"",onChange:n=>F(i,a.id)},null,8,["modelValue","onUpdate:modelValue","onChange"])]),o("td",null,[t(D,{modelValue:h(f).statuses[i],"onUpdate:modelValue":n=>h(f).statuses[i]=n,color:"primary","hide-details":"",onChange:n=>P(i,a.id)},null,8,["modelValue","onUpdate:modelValue","onChange"])]),o("td",X,[t(j,{rounded:"xl"},{default:s(()=>[t(b,{text:e.$t("Edit Phrases")},{activator:s(({props:n})=>[t(p,_({icon:"mdi-translate"},n,{onClick:S=>e.$inertia.visit(e.route("admin.settings.languages.edit-phrases",{language:a.id}))}),null,16,["onClick"])]),_:2},1032,["text"]),t(b,{text:e.$t("Edit Language")},{activator:s(({props:n})=>[t(p,_({icon:"mdi-clipboard-edit-outline"},n,{onClick:S=>e.$inertia.visit(e.route("admin.settings.languages.edit",{language:a.id}))}),null,16,["onClick"])]),_:2},1032,["text"]),t(b,{text:e.$t("Delete Language")},{activator:s(({props:n})=>[a.is_default?M("",!0):(g(),T(p,_({key:0,icon:"mdi-delete-outline"},n,{onClick:S=>{m.value=!0,L.value=a.id}}),null,16,["onClick"]))]),_:2},1032,["text"])]),_:2},1024)])]))),128))])]),_:1})]),_:1})]),_:1}),t(J,{modelValue:m.value,"onUpdate:modelValue":l[1]||(l[1]=a=>m.value=a),"max-width":"290"},{default:s(()=>[t(U,{class:"pa-3"},{default:s(()=>[t(O,{class:"text-h5 text-center"},{default:s(()=>[$(d(e.$t("Are your sure to delete?")),1)]),_:1}),t(q,{class:"text-center"},{default:s(()=>[o("p",null,d(e.$t("Action cannot be undone")),1)]),_:1}),t(z,null,{default:s(()=>[t(G),t(p,{onClick:l[0]||(l[0]=a=>m.value=!1)},{default:s(()=>[$(d(e.$t("Cancel")),1)]),_:1}),t(p,{color:"error",onClick:H(x,["stop"])},{default:s(()=>[$(d(e.$t("Delete")),1)]),_:1},8,["onClick"])]),_:1})]),_:1})]),_:1},8,["modelValue"])]),_:1},8,["title","action"])}}};export{ie as default};
