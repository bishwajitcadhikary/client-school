import{u as L,ax as A,a as f,c as $,w as n,r as S,o as h,b as t,at as a,t as s,l as b,e as V,i as u,k as g,V as F,au as w,av as I,bm as P,N as y,aw as E,L as j}from"./app.dc2d0110.js";import O from"./SettingsDrawerContent.467232ae.js";import{_ as R}from"./Pagination.8132c0ef.js";import{V as q}from"./VTable.13703ca8.js";import{V as N}from"./VSwitch.ccb29c42.js";import{V as k}from"./VTooltip.e3cacf25.js";import{V as z}from"./VContainer.ae849916.js";import"./VSelect.1c594559.js";import"./VCheckboxBtn.8dc877ea.js";import"./VChip.3dfe68ed.js";/* empty css              */const G={class:"mt-4 mr-2"},H=a("th",null,null,-1),J={class:"pa-1",width:"10%"},ne={__name:"Index",props:{currencies:{type:Object,default:null},last_sync_at:{type:String,default:null}},setup(p){const C=p,_=L(),D=A(),i=f({statuses:[...C.currencies.data.map(e=>!!e.is_active)],default:[...C.currencies.data.map(e=>!!e.is_default)]});function T(e,c){f({_method:"PUT",is_active:i.statuses[e]}).post(route("admin.settings.currencies.change-status",{currency:c}),{preserveScroll:!0,preserveState:!0,onSuccess:d=>{_.showNotification(d),i.statuses=d.props.currencies.data.map(m=>!!m.is_active)}})}function U(e,c){f({_method:"PUT",is_default:i.default[e]}).post(route("admin.settings.currencies.change-default",{currency:c}),{preserveScroll:!0,preserveState:!0,onSuccess:d=>{_.showNotification(d),i.default=d.props.currencies.data.map(m=>!!m.is_default)}})}const v=f({_method:"PUT"});return(e,c)=>{const d=S("Link"),m=S("AdminLayout");return h(),$(m,{title:e.$t("Currencies")},{"sub-navbar":n(()=>[t(O)]),actions:n(()=>[a("p",G,s(p.last_sync_at),1),t(g,{loading:u(v).processing,onClick:c[0]||(c[0]=o=>u(v).post(e.route("admin.settings.currencies.sync"),{onSuccess:l=>u(_).showNotification(l)}))},{default:n(()=>[t(b,null,{default:n(()=>[V("mdi-plus")]),_:1}),V(" "+s(e.$t("Sync")),1)]),_:1},8,["loading"]),t(d,{href:e.route("admin.settings.currencies.create")},{default:n(()=>[t(g,null,{default:n(()=>[t(b,null,{default:n(()=>[V("mdi-plus")]),_:1}),V(" "+s(e.$t("Add New")),1)]),_:1})]),_:1},8,["href"])]),default:n(()=>[t(z,null,{default:n(()=>[t(F,null,{default:n(()=>[t(q,{class:"table-rounded"},{default:n(()=>[a("thead",null,[a("tr",null,[a("th",null,s(e.$t("Name")),1),a("th",null,s(e.$t("Code")),1),a("th",null,s(e.$t("Rate")),1),a("th",null,s(e.$t("Is Active")),1),a("th",null,s(e.$t("Is Default")),1),H])]),a("tbody",null,[(h(!0),w(j,null,I(p.currencies.data,(o,l)=>(h(),w("tr",{key:l},[a("td",null,s(o.name),1),a("td",null,s(o.code),1),a("td",null,s(o.rate),1),a("td",null,[t(N,{modelValue:u(i).statuses[l],"onUpdate:modelValue":r=>u(i).statuses[l]=r,color:"primary","hide-detail":"",onChange:r=>T(l,o.id)},null,8,["modelValue","onUpdate:modelValue","onChange"])]),a("td",null,[t(N,{modelValue:u(i).default[l],"onUpdate:modelValue":r=>u(i).default[l]=r,color:"primary","hide-detail":"",onChange:r=>U(l,o.id)},null,8,["modelValue","onUpdate:modelValue","onChange"])]),a("td",J,[t(P,{rounded:"xl"},{default:n(()=>[t(k,{text:e.$t("Edit Currency")},{activator:n(({props:r})=>[t(g,y({icon:"mdi-clipboard-edit-outline"},r,{onClick:B=>e.$inertia.visit(e.route("admin.settings.currencies.edit",{currency:o.id}))}),null,16,["onClick"])]),_:2},1032,["text"]),o.is_default?E("",!0):(h(),$(k,{key:0,text:e.$t("Delete Currency")},{activator:n(({props:r})=>[t(g,y({icon:"mdi-delete-outline"},r,{onClick:B=>u(D).showDialog(e.route("admin.settings.currencies.destroy",{currency:o.id}))}),null,16,["onClick"])]),_:2},1032,["text"]))]),_:2},1024)])]))),128))])]),_:1}),t(R,{pagination:p.currencies},null,8,["pagination"])]),_:1})]),_:1})]),_:1},8,["title"])}}};export{ne as default};
