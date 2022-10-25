import{h as v,aH as h,c as y,w as s,r as B,o as p,a as e,b as a,t as l,d as C,e as F,u as g,b4 as G,J as f,K as _,g as L,F as D,V as U,f as V,ap as I,aI as M,aK as j}from"./app.dfca5287.js";import E from"./SettingsDrawerContent.c7703bac.js";import{V as b,c as K,a as P,e as H}from"./VCard.1aef212d.js";import{V as J}from"./VTable.715b15dd.js";import{V as O}from"./VSwitch.e0b4e87c.js";import{V as k}from"./VTooltip.04591468.js";import{V as q}from"./VDialog.34f2b42e.js";import"./VSelect.7afc3e43.js";import"./VCheckboxBtn.134247d4.js";import"./VChip.7123b1f9.js";const z=a("th",{width:"5%"}," # ",-1),Q=a("th",null,null,-1),R={class:"pa-1",width:"10%"},ot={__name:"Index",props:{gateways:{type:Object,default:null}},setup(w){const N=w,c=j("Notification"),i=v(!1),$=v(null),d=h({statuses:[...N.gateways.data.map(t=>!!t.is_active)]});function A(t,n){h({_method:"PUT",is_active:d.statuses[t]}).post(route("admin.settings.gateways.change-status",{gateway:n}),{onSuccess:r=>{r.props.flash.success&&c.success(r.props.flash.success),r.props.flash.error&&c.error(r.props.flash.error),d.statuses=r.props.gateways.data.map(o=>!!o.is_active)}})}function S(){i.value=!1,h({}).delete(route("admin.settings.gateways.destroy",{gateway:$.value}),{onSuccess:t=>{t.props.flash.success&&c.success(t.props.flash.success),t.props.flash.error&&c.error(t.props.flash.error),d.statuses=t.props.gateways.data.map(n=>!!n.is_active),defaultForm.statuses=t.props.gateways.data.map(n=>!!n.is_default)}})}return(t,n)=>{const r=B("AdminLayout");return p(),y(r,{action:{href:t.route("admin.settings.gateways.create"),icon:"mdi-plus",title:t.$t("Add New")},title:t.$t("Gateways")},{"sub-navbar":s(()=>[e(E)]),default:s(()=>[e(U,null,{default:s(()=>[e(b,null,{default:s(()=>[e(J,{class:"table-rounded"},{default:s(()=>[a("thead",null,[a("tr",null,[z,a("th",null,l(t.$t("Logo")),1),a("th",null,l(t.$t("Name")),1),a("th",null,l(t.$t("Namespace")),1),a("th",null,l(t.$t("Charge")),1),a("th",null,l(t.$t("Min Amount")),1),a("th",null,l(t.$t("Max Amount")),1),a("th",null,l(t.$t("Status")),1),Q])]),a("tbody",null,[(p(!0),C(D,null,F(w.gateways.data,(o,m)=>(p(),C("tr",{key:m},[a("td",null,l(o.name),1),a("td",null,l(o.code),1),a("td",null,[e(O,{modelValue:g(d).statuses[m],"onUpdate:modelValue":u=>g(d).statuses[m]=u,color:"primary","hide-detail":"",onChange:u=>A(m,o.id)},null,8,["modelValue","onUpdate:modelValue","onChange"])]),a("td",R,[e(G,{rounded:"xl"},{default:s(()=>[e(k,{text:t.$t("Edit Gateway")},{activator:s(({props:u})=>[e(f,_({icon:"mdi-clipboard-edit-outline"},u,{onClick:T=>t.$inertia.visit(t.route("admin.settings.gateways.edit",{gateway:o.id}))}),null,16,["onClick"])]),_:2},1032,["text"]),e(k,{text:t.$t("Delete Gateway")},{activator:s(({props:u})=>[o.is_default?L("",!0):(p(),y(f,_({key:0,icon:"mdi-delete-outline"},u,{onClick:T=>{i.value=!0,$.value=o.id}}),null,16,["onClick"]))]),_:2},1032,["text"])]),_:2},1024)])]))),128))])]),_:1})]),_:1})]),_:1}),e(q,{modelValue:i.value,"onUpdate:modelValue":n[1]||(n[1]=o=>i.value=o),"max-width":"290"},{default:s(()=>[e(b,{class:"pa-3"},{default:s(()=>[e(K,{class:"text-h5 text-center"},{default:s(()=>[V(l(t.$t("Are your sure to delete?")),1)]),_:1}),e(P,{class:"text-center"},{default:s(()=>[a("p",null,l(t.$t("Action cannot be undone")),1)]),_:1}),e(H,null,{default:s(()=>[e(I),e(f,{onClick:n[0]||(n[0]=o=>i.value=!1)},{default:s(()=>[V(l(t.$t("Cancel")),1)]),_:1}),e(f,{color:"error",onClick:M(S,["stop"])},{default:s(()=>[V(l(t.$t("Delete")),1)]),_:1},8,["onClick"])]),_:1})]),_:1})]),_:1},8,["modelValue"])]),_:1},8,["action","title"])}}};export{ot as default};
