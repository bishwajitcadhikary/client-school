import{u as B,r as v,c as V,w as e,b as D,o as u,d as a,aw as g,ax as _,V as $,aS as I,T as N,m as f,D as R,n as j,U as z,W as c,aT as m,f as n,g as o,j as C,aO as P,e as k,i as b,av as d,aU as U,aV as E,H as y,aP as F,a as M}from"./app.c74c21f4.js";import{_ as O}from"./Pagination.ddb96f02.js";import H from"./SettingsDrawerContent.4e2e494c.js";import{V as W}from"./VRow.51c37cbe.js";import{V as q}from"./VCol.fb68aa0d.js";import{V as G}from"./VContainer.9871394f.js";import"./VSelect.5810ae9c.js";import"./VCheckboxBtn.85849725.js";import"./VSelectionControl.e7494f68.js";import"./VLabel.2a4a1171.js";import"./form.655e4f4e.js";import"./VTextField.2cf6dc35.js";import"./VCounter.bd549793.js";/* empty css              */const J="/build/assets/avatar-1.aac046b6.png",K="/build/assets/avatar-2.0ae005f8.png",Q="/build/assets/avatar-3.3ef9169b.png",X="/build/assets/avatar-4.406ee6ab.png",Y={class:"d-flex justify-space-between align-center"},Z={class:"font-weight-medium"},x={class:"v-avatar-group"},pe={__name:"Index",props:{roles:{type:Object,default:null}},setup(p){const w=B(),A=[J,K,Q,X],i=v(!1),S=v();function h(t){i.value=!1,M({}).delete(route("admin.settings.roles.destroy",{role:t}),{onSuccess:l=>w.showNotification(l)})}return(t,l)=>{const L=D("AppLayout");return u(),V(L,{title:t.$t("Roles"),actions:[{title:t.$t("Add New"),href:t.route("admin.settings.roles.create"),icon:"mdi-plus"}]},{"sub-navbar":e(()=>[a(H)]),default:e(()=>[a(G,{class:"grey lighten-5"},{default:e(()=>[a(W,null,{default:e(()=>[(u(!0),g(y,null,_(p.roles.data,(r,T)=>(u(),V(q,{key:T,cols:"12",sm:"4"},{default:e(()=>[a($,{class:"pa-3"},{default:e(()=>[a(I,null,{append:e(()=>[a(N,{ref_for:!0,ref_key:"menuRef",ref:S,activator:"parent",location:"start","close-on-click":""},{activator:e(({props:s})=>[a(f,R({icon:"",color:"default",size:"x-small",variant:"text"},s),{default:e(()=>[a(j,{size:"24",icon:"mdi-dots-vertical"})]),_:2},1040)]),default:e(()=>[a(z,null,{default:e(()=>[a(c,{value:"1"},{default:e(()=>[a(m,{onClick:s=>t.$inertia.visit(t.route("admin.settings.roles.edit",{role:r.id}))},{default:e(()=>[n(o(t.$t("Edit")),1)]),_:2},1032,["onClick"])]),_:2},1024),a(c,{value:"2"},{default:e(()=>[a(m,{onClick:s=>t.$inertia.visit(t.route("admin.settings.roles.assign-permission",{role:r.id}))},{default:e(()=>[n(o(t.$t("Assign Permission")),1)]),_:2},1032,["onClick"])]),_:2},1024),a(c,{value:"3"},{default:e(()=>[a(m,{onClick:l[0]||(l[0]=C(s=>i.value=!0,["stop"]))},{default:e(()=>[n(o(t.$t("Delete")),1)]),_:1}),a(P,{modelValue:i.value,"onUpdate:modelValue":l[2]||(l[2]=s=>i.value=s),"max-width":"290"},{default:e(()=>[a($,{class:"pa-3"},{default:e(()=>[a(k,{class:"text-h5 text-center"},{default:e(()=>[n(o(t.$t("Are your sure?")),1)]),_:1}),a(b,{class:"text-center"},{default:e(()=>[d("p",null,o(t.$t("Action cannot be undone")),1)]),_:1}),a(U,null,{default:e(()=>[a(E),a(f,{onClick:l[1]||(l[1]=s=>i.value=!1)},{default:e(()=>[n(o(t.$t("Cancel")),1)]),_:1}),a(f,{color:"error",onClick:C(s=>h(r.id),["stop"])},{default:e(()=>[n(o(t.$t("Delete")),1)]),_:2},1032,["onClick"])]),_:2},1024)]),_:2},1024)]),_:2},1032,["modelValue"])]),_:2},1024)]),_:2},1024)]),_:2},1536)]),default:e(()=>[a(k,null,{default:e(()=>[n(o(r.name),1)]),_:2},1024)]),_:2},1024),a(b,{class:"position-relative"},{default:e(()=>[d("div",Y,[d("span",Z,o(t.$t(":count users",{count:10})),1),d("div",x,[(u(),g(y,null,_(A,s=>a(F,{key:s,image:s,size:"45"},null,8,["image"])),64))])])]),_:1})]),_:2},1024)]),_:2},1024))),128))]),_:1}),a(O,{pagination:p.roles},null,8,["pagination"])]),_:1})]),_:1},8,["title","actions"])}}};export{pe as default};
