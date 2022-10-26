import{h as v,c as V,w as e,r as B,o as u,a,d as g,e as _,aX as R,J as f,K as D,ak as F,av as N,aw as m,ay as c,f as n,t as l,aI as $,b as d,ap as T,F as C,R as z,V as j,aH as E}from"./app.dfca5287.js";import{_ as M}from"./Pagination.22842a47.js";import P from"./SettingsDrawerContent.c7703bac.js";import{V as S}from"./VRow.d39a107d.js";import{V as H}from"./VCol.4592c862.js";import{V as k,b as J,c as b,a as y,e as K}from"./VCard.1aef212d.js";import{V as O}from"./VDialog.34f2b42e.js";import"./VSelect.7afc3e43.js";import"./VCheckboxBtn.134247d4.js";import"./VChip.7123b1f9.js";const U="/build/assets/avatar-1.aac046b6.png",X="/build/assets/avatar-2.0ae005f8.png",q="/build/assets/avatar-3.3ef9169b.png",G="/build/assets/avatar-4.406ee6ab.png",Q={class:"d-flex justify-space-between align-center"},W={class:"font-weight-medium"},Y={class:"v-avatar-group"},re={__name:"Index",props:{roles:{type:Object,default:null}},setup(p){const w=[U,X,q,G],i=v(!1),A=v();function h(t){i.value=!1,E({}).delete(route("admin.settings.roles.destroy",{role:t}),{onFinish:o=>{}})}return(t,o)=>{const I=B("AdminLayout");return u(),V(I,{title:t.$t("Roles"),actions:[{title:t.$t("Add New"),href:t.route("admin.settings.roles.create"),icon:"mdi-plus"}]},{"sub-navbar":e(()=>[a(P)]),default:e(()=>[a(j,{class:"grey lighten-5"},{default:e(()=>[a(S,null,{default:e(()=>[(u(!0),g(C,null,_(p.roles.data,(r,L)=>(u(),V(H,{key:L,cols:"12",sm:"4"},{default:e(()=>[a(k,{class:"pa-3"},{default:e(()=>[a(J,null,{append:e(()=>[a(R,{ref_for:!0,ref_key:"menuRef",ref:A,activator:"parent",location:"start","close-on-click":""},{activator:e(({props:s})=>[a(f,D({icon:"",color:"default",size:"x-small",variant:"text"},s),{default:e(()=>[a(F,{size:"24",icon:"mdi-dots-vertical"})]),_:2},1040)]),default:e(()=>[a(N,null,{default:e(()=>[a(m,{value:"1"},{default:e(()=>[a(c,{onClick:s=>t.$inertia.visit(t.route("admin.settings.roles.edit",{role:r.id}))},{default:e(()=>[n(l(t.$t("Edit")),1)]),_:2},1032,["onClick"])]),_:2},1024),a(m,{value:"2"},{default:e(()=>[a(c,{onClick:s=>t.$inertia.visit(t.route("admin.settings.roles.assign-permission",{role:r.id}))},{default:e(()=>[n(l(t.$t("Assign Permission")),1)]),_:2},1032,["onClick"])]),_:2},1024),a(m,{value:"3"},{default:e(()=>[a(c,{onClick:o[0]||(o[0]=$(s=>i.value=!0,["stop"]))},{default:e(()=>[n(l(t.$t("Delete")),1)]),_:1}),a(O,{modelValue:i.value,"onUpdate:modelValue":o[2]||(o[2]=s=>i.value=s),"max-width":"290"},{default:e(()=>[a(k,{class:"pa-3"},{default:e(()=>[a(b,{class:"text-h5 text-center"},{default:e(()=>[n(l(t.$t("Are your sure?")),1)]),_:1}),a(y,{class:"text-center"},{default:e(()=>[d("p",null,l(t.$t("Action cannot be undone")),1)]),_:1}),a(K,null,{default:e(()=>[a(T),a(f,{onClick:o[1]||(o[1]=s=>i.value=!1)},{default:e(()=>[n(l(t.$t("Cancel")),1)]),_:1}),a(f,{color:"error",onClick:$(s=>h(r.id),["stop"])},{default:e(()=>[n(l(t.$t("Delete")),1)]),_:2},1032,["onClick"])]),_:2},1024)]),_:2},1024)]),_:2},1032,["modelValue"])]),_:2},1024)]),_:2},1024)]),_:2},1536)]),default:e(()=>[a(b,null,{default:e(()=>[n(l(r.name),1)]),_:2},1024)]),_:2},1024),a(y,{class:"position-relative"},{default:e(()=>[d("div",Q,[d("span",W,l(t.$t(":count users",{count:10})),1),d("div",Y,[(u(),g(C,null,_(w,s=>a(z,{key:s,image:s,size:"45"},null,8,["image"])),64))])])]),_:1})]),_:2},1024)]),_:2},1024))),128))]),_:1}),a(M,{pagination:p.roles},null,8,["pagination"])]),_:1})]),_:1},8,["title","actions"])}}};export{re as default};