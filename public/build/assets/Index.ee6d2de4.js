import{u as b,r as m,c as g,w as l,b as D,o as d,d as e,V as f,i as p,au as a,g as s,av as V,aw as w,p as A,bD as B,n as u,j as v,bE as N,M as S,aI as T,e as F,f as c,aP as I,aQ as L,a as j}from"./app.f42d8be4.js";import z from"./SettingsDrawerContent.f47f64b5.js";import{V as E}from"./VTable.c8620f99.js";import{V as M}from"./VContainer.0a92d41a.js";import"./VSelect.82db8c00.js";import"./VCheckboxBtn.49e0f64e.js";import"./VSelectionControl.68e94a0f.js";import"./VChip.26b3479b.js";/* empty css              */const O=a("th",null,null,-1),P={class:"pa-1"},X={__name:"Index",props:{disks:{type:Object,default:null}},setup(k){const _=b(),i=m(!1);let o=m(null);function C(){i.value=!1,j({}).delete(route("admin.settings.file-disks.destroy",{file_disk:o==null?void 0:o.value}),{onSuccess:t=>{_.showNotification(t)}})}return(t,r)=>{const $=D("AdminLayout");return d(),g($,{title:t.$t("File Disks"),action:{title:t.$t("Add New"),href:t.route("admin.settings.file-disks.create"),icon:"mdi-plus"}},{"sub-navbar":l(()=>[e(z)]),default:l(()=>[e(M,null,{default:l(()=>[e(f,null,{default:l(()=>[e(p,null,{default:l(()=>[e(E,null,{default:l(()=>[a("thead",null,[a("tr",null,[a("th",null,s(t.$t("Disk Name")),1),a("th",null,s(t.$t("Filesystem Driver")),1),a("th",null,s(t.$t("Type")),1),a("th",null,s(t.$t("Is Default")),1),O])]),a("tbody",null,[(d(!0),V(S,null,w(k.disks.data,(n,h)=>(d(),V("tr",{key:h},[a("td",null,s(n.name),1),a("td",null,s(n.driver),1),a("td",null,s(n.type),1),a("td",null,[e(A,{icon:n.set_as_default?"mdi-check":"mdi-alpha-x",color:n.set_as_default?"success":"error"},null,8,["icon","color"])]),a("td",P,[e(B,{divided:""},{default:l(()=>[e(u,{size:"small",variant:"outlined",color:"primary",icon:"mdi-edit",onClick:y=>t.$inertia.visit(t.route("admin.settings.file-disks.edit",{file_disk:n.id}))},null,8,["onClick"]),e(u,{size:"small",variant:"outlined",color:"primary",icon:"mdi-trash",onClick:v(y=>{i.value=!0,N(o)?o.value=n.id:o=n.id},["stop"])},null,8,["onClick"])]),_:2},1024)])]))),128))])]),_:1}),e(T,{modelValue:i.value,"onUpdate:modelValue":r[1]||(r[1]=n=>i.value=n),"max-width":"450"},{default:l(()=>[e(f,{class:"pa-3"},{default:l(()=>[e(F,{class:"text-h5 text-center"},{default:l(()=>[c(s(t.$t("Are your sure to delete?")),1)]),_:1}),e(p,{class:"text-center"},{default:l(()=>[a("p",null,s(t.$t("Action cannot be undone")),1)]),_:1}),e(I,null,{default:l(()=>[e(L),e(u,{onClick:r[0]||(r[0]=n=>i.value=!1)},{default:l(()=>[c(s(t.$t("Cancel")),1)]),_:1}),e(u,{color:"error",onClick:v(C,["stop"])},{default:l(()=>[c(s(t.$t("Delete")),1)]),_:1},8,["onClick"])]),_:1})]),_:1})]),_:1},8,["modelValue"])]),_:1})]),_:1})]),_:1})]),_:1},8,["title","action"])}}};export{X as default};