import{u as L,ax as A,a as f,c as $,w as n,b as S,o as h,d as t,au as a,g as s,p as b,f as g,k as u,n as V,V as F,av as w,aw as I,bD as P,O as y,m as E,M as O}from"./app.d12111a2.js";import j from"./SettingsDrawerContent.270bc2bd.js";import{_ as M}from"./Pagination.632f64fb.js";import{V as R}from"./VTable.4e88a8b6.js";import{V as k}from"./VSwitch.015ed8ba.js";import{V as N}from"./VTooltip.4db7f416.js";import{V as q}from"./VContainer.6eda6352.js";import"./VSelect.7ed835a6.js";import"./VCheckboxBtn.522e9dc8.js";import"./VSelectionControl.2cf78e55.js";import"./VChip.63a6f5b3.js";/* empty css              */const z={class:"mt-4 mr-2"},G=a("th",null,null,-1),H={class:"pa-1",width:"10%"},se={__name:"Index",props:{currencies:{type:Object,default:null},last_sync_at:{type:String,default:null}},setup(p){const C=p,_=L(),D=A(),i=f({statuses:[...C.currencies.data.map(e=>!!e.is_active)],default:[...C.currencies.data.map(e=>!!e.is_default)]});function T(e,c){f({_method:"PUT",is_active:i.statuses[e]}).post(route("admin.settings.currencies.change-status",{currency:c}),{preserveScroll:!0,preserveState:!0,onSuccess:d=>{_.showNotification(d),i.statuses=d.props.currencies.data.map(m=>!!m.is_active)}})}function U(e,c){f({_method:"PUT",is_default:i.default[e]}).post(route("admin.settings.currencies.change-default",{currency:c}),{preserveScroll:!0,preserveState:!0,onSuccess:d=>{_.showNotification(d),i.default=d.props.currencies.data.map(m=>!!m.is_default)}})}const v=f({_method:"PUT"});return(e,c)=>{const d=S("Link"),m=S("AppLayout");return h(),$(m,{title:e.$t("Currencies")},{"sub-navbar":n(()=>[t(j)]),actions:n(()=>[a("p",z,s(p.last_sync_at),1),t(V,{loading:u(v).processing,onClick:c[0]||(c[0]=o=>u(v).post(e.route("admin.settings.currencies.sync"),{onSuccess:l=>u(_).showNotification(l)}))},{default:n(()=>[t(b,null,{default:n(()=>[g("mdi-plus")]),_:1}),g(" "+s(e.$t("Sync")),1)]),_:1},8,["loading"]),t(d,{href:e.route("admin.settings.currencies.create")},{default:n(()=>[t(V,null,{default:n(()=>[t(b,null,{default:n(()=>[g("mdi-plus")]),_:1}),g(" "+s(e.$t("Add New")),1)]),_:1})]),_:1},8,["href"])]),default:n(()=>[t(q,null,{default:n(()=>[t(F,null,{default:n(()=>[t(R,{class:"table-rounded"},{default:n(()=>[a("thead",null,[a("tr",null,[a("th",null,s(e.$t("Name")),1),a("th",null,s(e.$t("Code")),1),a("th",null,s(e.$t("Rate")),1),a("th",null,s(e.$t("Is Active")),1),a("th",null,s(e.$t("Is Default")),1),G])]),a("tbody",null,[(h(!0),w(O,null,I(p.currencies.data,(o,l)=>(h(),w("tr",{key:l},[a("td",null,s(o.name),1),a("td",null,s(o.code),1),a("td",null,s(o.rate),1),a("td",null,[t(k,{modelValue:u(i).statuses[l],"onUpdate:modelValue":r=>u(i).statuses[l]=r,color:"primary","hide-detail":"",onChange:r=>T(l,o.id)},null,8,["modelValue","onUpdate:modelValue","onChange"])]),a("td",null,[t(k,{modelValue:u(i).default[l],"onUpdate:modelValue":r=>u(i).default[l]=r,color:"primary","hide-detail":"",onChange:r=>U(l,o.id)},null,8,["modelValue","onUpdate:modelValue","onChange"])]),a("td",H,[t(P,{rounded:"xl"},{default:n(()=>[t(N,{text:e.$t("Edit Currency")},{activator:n(({props:r})=>[t(V,y({icon:"mdi-clipboard-edit-outline"},r,{onClick:B=>e.$inertia.visit(e.route("admin.settings.currencies.edit",{currency:o.id}))}),null,16,["onClick"])]),_:2},1032,["text"]),o.is_default?E("",!0):(h(),$(N,{key:0,text:e.$t("Delete Currency")},{activator:n(({props:r})=>[t(V,y({icon:"mdi-delete-outline"},r,{onClick:B=>u(D).showDialog(e.route("admin.settings.currencies.destroy",{currency:o.id}))}),null,16,["onClick"])]),_:2},1032,["text"]))]),_:2},1024)])]))),128))])]),_:1}),t(M,{pagination:p.currencies},null,8,["pagination"])]),_:1})]),_:1})]),_:1},8,["title"])}}};export{se as default};