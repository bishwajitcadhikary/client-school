import{u as b,r as c,c as g,w as l,b as w,o as d,d as e,V as f,i as p,av as a,g as s,aw as V,ax as D,n as A,bH as B,m as u,j as v,by as N,H as S,aO as T,e as F,f as m,aU as L,aV as j,a as z}from"./app.c74c21f4.js";import H from"./SettingsDrawerContent.4e2e494c.js";import{V as I}from"./VTable.bbaee15f.js";import{V as O}from"./VContainer.9871394f.js";import"./VSelect.5810ae9c.js";import"./VCheckboxBtn.85849725.js";import"./VSelectionControl.e7494f68.js";import"./VLabel.2a4a1171.js";import"./form.655e4f4e.js";import"./VTextField.2cf6dc35.js";import"./VCounter.bd549793.js";/* empty css              */const U=a("th",null,null,-1),E={class:"pa-1"},x={__name:"Index",props:{disks:{type:Object,default:null}},setup(k){const _=b(),i=c(!1);let n=c(null);function y(){i.value=!1,z({}).delete(route("admin.settings.file-disks.destroy",{file_disk:n==null?void 0:n.value}),{onSuccess:t=>{_.showNotification(t)}})}return(t,r)=>{const C=w("AppLayout");return d(),g(C,{title:t.$t("File Disks"),action:{title:t.$t("Add New"),href:t.route("admin.settings.file-disks.create"),icon:"mdi-plus"}},{"sub-navbar":l(()=>[e(H)]),default:l(()=>[e(O,null,{default:l(()=>[e(f,null,{default:l(()=>[e(p,null,{default:l(()=>[e(I,null,{default:l(()=>[a("thead",null,[a("tr",null,[a("th",null,s(t.$t("Disk Name")),1),a("th",null,s(t.$t("Filesystem Driver")),1),a("th",null,s(t.$t("Type")),1),a("th",null,s(t.$t("Is Default")),1),U])]),a("tbody",null,[(d(!0),V(S,null,D(k.disks.data,(o,$)=>(d(),V("tr",{key:$},[a("td",null,s(o.name),1),a("td",null,s(o.driver),1),a("td",null,s(o.type),1),a("td",null,[e(A,{icon:o.set_as_default?"mdi-check":"mdi-alpha-x",color:o.set_as_default?"success":"error"},null,8,["icon","color"])]),a("td",E,[e(B,{divided:""},{default:l(()=>[e(u,{size:"small",variant:"outlined",color:"primary",icon:"mdi-edit",onClick:h=>t.$inertia.visit(t.route("admin.settings.file-disks.edit",{file_disk:o.id}))},null,8,["onClick"]),e(u,{size:"small",variant:"outlined",color:"primary",icon:"mdi-trash",onClick:v(h=>{i.value=!0,N(n)?n.value=o.id:n=o.id},["stop"])},null,8,["onClick"])]),_:2},1024)])]))),128))])]),_:1}),e(T,{modelValue:i.value,"onUpdate:modelValue":r[1]||(r[1]=o=>i.value=o),"max-width":"450"},{default:l(()=>[e(f,{class:"pa-3"},{default:l(()=>[e(F,{class:"text-h5 text-center"},{default:l(()=>[m(s(t.$t("Are your sure to delete?")),1)]),_:1}),e(p,{class:"text-center"},{default:l(()=>[a("p",null,s(t.$t("Action cannot be undone")),1)]),_:1}),e(L,null,{default:l(()=>[e(j),e(u,{onClick:r[0]||(r[0]=o=>i.value=!1)},{default:l(()=>[m(s(t.$t("Cancel")),1)]),_:1}),e(u,{color:"error",onClick:v(y,["stop"])},{default:l(()=>[m(s(t.$t("Delete")),1)]),_:1},8,["onClick"])]),_:1})]),_:1})]),_:1},8,["modelValue"])]),_:1})]),_:1})]),_:1})]),_:1},8,["title","action"])}}};export{x as default};
