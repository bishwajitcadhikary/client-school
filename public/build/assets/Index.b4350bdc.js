import{u as b,r as m,c as g,w as l,b as w,o as d,d as e,V as f,i as p,av as a,g as s,aw as V,ax as D,n as T,bH as A,m as u,j as v,bx as B,H as N,aO as S,e as F,f as c,aT as L,aU as j,a as z}from"./app.024f86d4.js";import H from"./SettingsDrawerContent.adb5afcc.js";import{V as I}from"./VTable.ccb6ff10.js";import{V as O}from"./VContainer.066e5020.js";import"./VSelect.2b406d4f.js";import"./VCheckboxBtn.26820d3d.js";import"./VSelectionControl.e3763b2e.js";import"./VCounter.2419f175.js";import"./form.51b8e79f.js";import"./VTextField.4f31bb4a.js";/* empty css              */const U=a("th",null,null,-1),E={class:"pa-1"},Y={__name:"Index",props:{disks:{type:Object,default:null}},setup(k){const _=b(),i=m(!1);let n=m(null);function C(){i.value=!1,z({}).delete(route("admin.settings.file-disks.destroy",{file_disk:n==null?void 0:n.value}),{onSuccess:t=>{_.showNotification(t)}})}return(t,r)=>{const $=w("AppLayout");return d(),g($,{title:t.$t("File Disks"),action:{title:t.$t("Add New"),href:t.route("admin.settings.file-disks.create"),icon:"mdi-plus"}},{"sub-navbar":l(()=>[e(H)]),default:l(()=>[e(O,null,{default:l(()=>[e(f,null,{default:l(()=>[e(p,null,{default:l(()=>[e(I,null,{default:l(()=>[a("thead",null,[a("tr",null,[a("th",null,s(t.$t("Disk Name")),1),a("th",null,s(t.$t("Filesystem Driver")),1),a("th",null,s(t.$t("Type")),1),a("th",null,s(t.$t("Is Default")),1),U])]),a("tbody",null,[(d(!0),V(N,null,D(k.disks.data,(o,h)=>(d(),V("tr",{key:h},[a("td",null,s(o.name),1),a("td",null,s(o.driver),1),a("td",null,s(o.type),1),a("td",null,[e(T,{icon:o.set_as_default?"mdi-check":"mdi-alpha-x",color:o.set_as_default?"success":"error"},null,8,["icon","color"])]),a("td",E,[e(A,{divided:""},{default:l(()=>[e(u,{size:"small",variant:"outlined",color:"primary",icon:"mdi-edit",onClick:y=>t.$inertia.visit(t.route("admin.settings.file-disks.edit",{file_disk:o.id}))},null,8,["onClick"]),e(u,{size:"small",variant:"outlined",color:"primary",icon:"mdi-trash",onClick:v(y=>{i.value=!0,B(n)?n.value=o.id:n=o.id},["stop"])},null,8,["onClick"])]),_:2},1024)])]))),128))])]),_:1}),e(S,{modelValue:i.value,"onUpdate:modelValue":r[1]||(r[1]=o=>i.value=o),"max-width":"450"},{default:l(()=>[e(f,{class:"pa-3"},{default:l(()=>[e(F,{class:"text-h5 text-center"},{default:l(()=>[c(s(t.$t("Are your sure to delete?")),1)]),_:1}),e(p,{class:"text-center"},{default:l(()=>[a("p",null,s(t.$t("Action cannot be undone")),1)]),_:1}),e(L,null,{default:l(()=>[e(j),e(u,{onClick:r[0]||(r[0]=o=>i.value=!1)},{default:l(()=>[c(s(t.$t("Cancel")),1)]),_:1}),e(u,{color:"error",onClick:v(C,["stop"])},{default:l(()=>[c(s(t.$t("Delete")),1)]),_:1},8,["onClick"])]),_:1})]),_:1})]),_:1},8,["modelValue"])]),_:1})]),_:1})]),_:1})]),_:1},8,["title","action"])}}};export{Y as default};
