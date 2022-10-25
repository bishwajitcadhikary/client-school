import{h as m,c as b,w as l,r as D,o as d,a as t,b as a,t as o,d as p,e as N,ak as g,b4 as A,J as u,aI as V,bd as B,F as T,f as c,ap as w,V as F,aK as I,aH as L}from"./app.dfca5287.js";import S from"./SettingsDrawerContent.c7703bac.js";import{V as h,a as v,c as j,e as z}from"./VCard.1aef212d.js";import{V as E}from"./VTable.715b15dd.js";import{V as H}from"./VDialog.34f2b42e.js";import"./VSelect.7afc3e43.js";import"./VCheckboxBtn.134247d4.js";import"./VChip.7123b1f9.js";const J=a("th",null,null,-1),K={class:"pa-1"},W={__name:"Index",props:{disks:{type:Object,default:null}},setup(_){const f=I("Notification"),i=m(!1);let n=m(null);function k(){i.value=!1,L({}).delete(route("admin.settings.file-disks.destroy",{file_disk:n==null?void 0:n.value}),{onSuccess:e=>{e.props.flash.error&&f.error(e.props.flash.error),e.props.flash.success&&f.success(e.props.flash.success)}})}return(e,r)=>{const C=D("AdminLayout");return d(),b(C,{title:e.$t("File Disks"),action:{title:e.$t("Add New"),href:e.route("admin.settings.file-disks.create"),icon:"mdi-plus"}},{"sub-navbar":l(()=>[t(S)]),default:l(()=>[t(F,null,{default:l(()=>[t(h,null,{default:l(()=>[t(v,null,{default:l(()=>[t(E,null,{default:l(()=>[a("thead",null,[a("tr",null,[a("th",null,o(e.$t("Disk Name")),1),a("th",null,o(e.$t("Filesystem Driver")),1),a("th",null,o(e.$t("Type")),1),a("th",null,o(e.$t("Is Default")),1),J])]),a("tbody",null,[(d(!0),p(T,null,N(_.disks.data,(s,$)=>(d(),p("tr",{key:$},[a("td",null,o(s.name),1),a("td",null,o(s.driver),1),a("td",null,o(s.type),1),a("td",null,[t(g,{icon:s.set_as_default?"mdi-check":"mdi-alpha-x",color:s.set_as_default?"success":"error"},null,8,["icon","color"])]),a("td",K,[t(A,{divided:""},{default:l(()=>[t(u,{size:"small",variant:"outlined",color:"primary",icon:"mdi-edit",onClick:y=>e.$inertia.visit(e.route("admin.settings.file-disks.edit",{file_disk:s.id}))},null,8,["onClick"]),t(u,{size:"small",variant:"outlined",color:"primary",icon:"mdi-trash",onClick:V(y=>{i.value=!0,B(n)?n.value=s.id:n=s.id},["stop"])},null,8,["onClick"])]),_:2},1024)])]))),128))])]),_:1}),t(H,{modelValue:i.value,"onUpdate:modelValue":r[1]||(r[1]=s=>i.value=s),"max-width":"450"},{default:l(()=>[t(h,{class:"pa-3"},{default:l(()=>[t(j,{class:"text-h5 text-center"},{default:l(()=>[c(o(e.$t("Are your sure to delete?")),1)]),_:1}),t(v,{class:"text-center"},{default:l(()=>[a("p",null,o(e.$t("Action cannot be undone")),1)]),_:1}),t(z,null,{default:l(()=>[t(w),t(u,{onClick:r[0]||(r[0]=s=>i.value=!1)},{default:l(()=>[c(o(e.$t("Cancel")),1)]),_:1}),t(u,{color:"error",onClick:V(k,["stop"])},{default:l(()=>[c(o(e.$t("Delete")),1)]),_:1},8,["onClick"])]),_:1})]),_:1})]),_:1},8,["modelValue"])]),_:1})]),_:1})]),_:1})]),_:1},8,["title","action"])}}};export{W as default};
