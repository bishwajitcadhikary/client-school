import{h as d,c as k,w as t,r as y,o as c,a as e,b as l,t as o,d as m,e as b,b4 as w,J as i,aI as h,F as A,f as p,ap as B,V as g,aK as N,aH as T}from"./app.dfca5287.js";import z from"./SettingsDrawerContent.c7703bac.js";import{V,a as v,c as S,e as D}from"./VCard.1aef212d.js";import{V as F}from"./VTable.715b15dd.js";import{V as L}from"./VDialog.34f2b42e.js";import"./VSelect.7afc3e43.js";import"./VCheckboxBtn.134247d4.js";import"./VChip.7123b1f9.js";const j=l("th",null,null,-1),I={class:"pa-1"},P={__name:"Index",props:{backups:{type:Object,default:null}},setup(C){const f=N("Notification"),r=d(!1),u=d(null);d(null);function _(a){r.value=!1,T({path:u==null?void 0:u.value}).delete(route("admin.settings.backups.destroy",{backup:"delete"}),{onSuccess:s=>{s.props.flash.error&&f.error(s.props.flash.error),s.props.flash.success&&f.success(s.props.flash.success)}})}return(a,s)=>{const $=y("AdminLayout");return c(),k($,{title:a.$t("Backups"),action:{title:a.$t("Add New"),href:a.route("admin.settings.backups.create"),icon:"mdi-plus"}},{"sub-navbar":t(()=>[e(z)]),default:t(()=>[e(g,null,{default:t(()=>[e(V,null,{default:t(()=>[e(v,null,{default:t(()=>[e(F,null,{default:t(()=>[l("thead",null,[l("tr",null,[l("th",null,o(a.$t("Path")),1),l("th",null,o(a.$t("Size")),1),l("th",null,o(a.$t("Created At")),1),j])]),l("tbody",null,[(c(!0),m(A,null,b(C.backups,n=>(c(),m("tr",null,[l("td",null,o(n.path),1),l("td",null,o(n.size),1),l("td",null,o(n.created_at),1),l("td",I,[e(w,{divided:""},{default:t(()=>[e(i,{size:"small",variant:"outlined",color:"primary",icon:"mdi-download",href:a.route("admin.settings.backups.download",{path:n.path}),download:""},null,8,["href"]),e(i,{size:"small",variant:"outlined",color:"primary",icon:"mdi-trash",onClick:h(E=>{r.value=!0,u.value=n.path},["stop"])},null,8,["onClick"])]),_:2},1024)])]))),256))])]),_:1}),e(L,{modelValue:r.value,"onUpdate:modelValue":s[1]||(s[1]=n=>r.value=n),"max-width":"450"},{default:t(()=>[e(V,{class:"pa-3"},{default:t(()=>[e(S,{class:"text-h5 text-center"},{default:t(()=>[p(o(a.$t("Are your sure to delete?")),1)]),_:1}),e(v,{class:"text-center"},{default:t(()=>[l("p",null,o(a.$t("Action cannot be undone")),1)]),_:1}),e(D,null,{default:t(()=>[e(B),e(i,{onClick:s[0]||(s[0]=n=>r.value=!1)},{default:t(()=>[p(o(a.$t("Cancel")),1)]),_:1}),e(i,{color:"error",onClick:h(_,["stop"])},{default:t(()=>[p(o(a.$t("Delete")),1)]),_:1},8,["onClick"])]),_:1})]),_:1})]),_:1},8,["modelValue"])]),_:1})]),_:1})]),_:1})]),_:1},8,["title","action"])}}};export{P as default};