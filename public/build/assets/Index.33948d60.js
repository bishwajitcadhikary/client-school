import{u as b,r as f,c as g,w as l,b as D,o as d,d as e,V as m,i as p,a9 as a,g as n,aa as V,ab as B,p as w,bB as A,n as u,j as v,bC as N,M as S,au as T,e as F,f as c,aC as L,aD as j,a as z}from"./app.fc5e7aab.js";import I from"./SettingsDrawerContent.41930670.js";import{V as M}from"./VTable.0896bf51.js";import{V as E}from"./VContainer.88b2197d.js";import"./VSelect.9d034a32.js";import"./VCheckboxBtn.b3459cab.js";import"./VSelectionControl.ef57def4.js";/* empty css              */const O=a("th",null,null,-1),R={class:"pa-1"},W={__name:"Index",props:{disks:{type:Object,default:null}},setup(C){const k=b(),i=f(!1);let o=f(null);function _(){i.value=!1,z({}).delete(route("admin.settings.file-disks.destroy",{file_disk:o==null?void 0:o.value}),{onSuccess:t=>{k.showNotification(t)}})}return(t,r)=>{const $=D("AppLayout");return d(),g($,{title:t.$t("File Disks"),action:{title:t.$t("Add New"),href:t.route("admin.settings.file-disks.create"),icon:"mdi-plus"}},{"sub-navbar":l(()=>[e(I)]),default:l(()=>[e(E,null,{default:l(()=>[e(m,null,{default:l(()=>[e(p,null,{default:l(()=>[e(M,null,{default:l(()=>[a("thead",null,[a("tr",null,[a("th",null,n(t.$t("Disk Name")),1),a("th",null,n(t.$t("Filesystem Driver")),1),a("th",null,n(t.$t("Type")),1),a("th",null,n(t.$t("Is Default")),1),O])]),a("tbody",null,[(d(!0),V(S,null,B(C.disks.data,(s,h)=>(d(),V("tr",{key:h},[a("td",null,n(s.name),1),a("td",null,n(s.driver),1),a("td",null,n(s.type),1),a("td",null,[e(w,{icon:s.set_as_default?"mdi-check":"mdi-alpha-x",color:s.set_as_default?"success":"error"},null,8,["icon","color"])]),a("td",R,[e(A,{divided:""},{default:l(()=>[e(u,{size:"small",variant:"outlined",color:"primary",icon:"mdi-edit",onClick:y=>t.$inertia.visit(t.route("admin.settings.file-disks.edit",{file_disk:s.id}))},null,8,["onClick"]),e(u,{size:"small",variant:"outlined",color:"primary",icon:"mdi-trash",onClick:v(y=>{i.value=!0,N(o)?o.value=s.id:o=s.id},["stop"])},null,8,["onClick"])]),_:2},1024)])]))),128))])]),_:1}),e(T,{modelValue:i.value,"onUpdate:modelValue":r[1]||(r[1]=s=>i.value=s),"max-width":"450"},{default:l(()=>[e(m,{class:"pa-3"},{default:l(()=>[e(F,{class:"text-h5 text-center"},{default:l(()=>[c(n(t.$t("Are your sure to delete?")),1)]),_:1}),e(p,{class:"text-center"},{default:l(()=>[a("p",null,n(t.$t("Action cannot be undone")),1)]),_:1}),e(L,null,{default:l(()=>[e(j),e(u,{onClick:r[0]||(r[0]=s=>i.value=!1)},{default:l(()=>[c(n(t.$t("Cancel")),1)]),_:1}),e(u,{color:"error",onClick:v(_,["stop"])},{default:l(()=>[c(n(t.$t("Delete")),1)]),_:1},8,["onClick"])]),_:1})]),_:1})]),_:1},8,["modelValue"])]),_:1})]),_:1})]),_:1})]),_:1},8,["title","action"])}}};export{W as default};
