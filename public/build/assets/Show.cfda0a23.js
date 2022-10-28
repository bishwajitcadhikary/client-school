import{r as k,av as L,d as t,w as e,aI as O,M as R,b as j,o as c,V as b,aN as A,e as p,f as s,g as a,i as r,P as E,Q as i,aL as d,au as n,n as f,p as m,c as h,aH as x,bz as M,am as U,k as P,t as D,m as T,aP as q,aQ as F,a as W,u as z}from"./app.d12111a2.js";import{V as H}from"./VContainer.6eda6352.js";import{V as C}from"./VRow.a42250e5.js";import{V as v}from"./VCol.4fb9d811.js";import{V as N}from"./VChip.63a6f5b3.js";/* empty css              */const Q={class:"text-sm"},G={class:"text-body-2"},J={class:"text-sm"},K={class:"text-body-2"},X={class:"text-sm"},Y={class:"text-body-2"},Z={class:"text-sm"},ee={class:"text-body-2"},te={class:"text-sm"},le={class:"text-body-2"},ae={class:"text-sm"},se={class:"text-body-2"},oe={class:"text-sm"},ne={class:"text-body-2"},ue=["href"],ie={class:"text-sm"},ve={__name:"Show",props:{school:{type:Object,required:!0,default:null}},setup(o){const g=o,V=k(!1),S=`https://${g.school.domain}`,$=k(!0),_=k(!1),w=()=>{let l=new Request(S,{method:"get"});fetch(l,{mode:"no-cors"}).then(u=>{u.status!==404&&($.value=!0)}).catch(u=>{$.value=!1})};w();const I=()=>{W({_method:"PUT"}).post(route("admin.schools.change-status",{school:g.school.id}),{preserveState:!0,preserveScroll:!0,only:["school"],onSuccess:l=>z().showNotification(l),onFinish:l=>{_.value=!1}})};return(l,u)=>{const B=j("AppLayout");return c(),L(R,null,[t(B,{title:o.school.name,back:l.route("admin.schools.index")},{default:e(()=>[t(H,null,{default:e(()=>[t(C,null,{default:e(()=>[t(v,{cols:"12",lg:"4",md:"5"},{default:e(()=>[t(C,null,{default:e(()=>[t(v,{cols:"12"},{default:e(()=>[t(b,null,{default:e(()=>[t(A,null,{default:e(()=>[t(p,null,{default:e(()=>[s(a(l.$t("Database Credentials")),1)]),_:1})]),_:1}),t(r,null,{default:e(()=>[t(E,null,{default:e(()=>[t(i,null,{default:e(()=>[t(d,null,{default:e(()=>[n("h6",Q,[s(a(l.$t("School:"))+" ",1),n("span",G,a(o.school.name),1)])]),_:1})]),_:1}),t(i,null,{default:e(()=>[t(d,null,{default:e(()=>[n("h6",J,[s(a(l.$t("HOST:"))+" ",1),n("span",K,a(o.school.host),1)])]),_:1})]),_:1}),t(i,null,{default:e(()=>[t(d,null,{default:e(()=>[n("h6",X,[s(a(l.$t("PORT:"))+" ",1),n("span",Y,a(o.school.port),1)])]),_:1})]),_:1}),t(i,null,{default:e(()=>[t(d,null,{default:e(()=>[n("h6",Z,[s(a(l.$t("USERNAME:"))+" ",1),n("span",ee,a(o.school.username),1)])]),_:1})]),_:1}),t(i,null,{default:e(()=>[t(d,null,{default:e(()=>[n("h6",te,[s(a(l.$t("PASSWORD:"))+" ",1),n("span",le,a(V.value?o.school.password:"*********"),1),t(f,{variant:"plain",onClick:u[0]||(u[0]=y=>V.value=!V.value)},{default:e(()=>[t(m,null,{default:e(()=>[s(a(V.value?"mdi-eye-off":"mdi-eye"),1)]),_:1})]),_:1})])]),_:1})]),_:1}),t(i,null,{default:e(()=>[t(d,null,{default:e(()=>[n("h6",ae,[s(a(l.$t("DATABASE:"))+" ",1),n("span",se,a(o.school.database),1)])]),_:1})]),_:1}),t(i,null,{default:e(()=>[t(d,null,{default:e(()=>[n("h6",oe,[s(a(l.$t("DOMAIN:"))+" ",1),n("span",ne,[n("a",{href:"http://"+o.school.domain,target:"_blank"},a(o.school.domain),9,ue)])])]),_:1})]),_:1}),t(i,null,{default:e(()=>[t(d,null,{default:e(()=>[n("h6",ie,[s(a(l.$t("STATUS:"))+" ",1),o.school.is_active?(c(),h(N,{key:0,color:"primary"},{default:e(()=>[s(a(l.$t("Active"))+" ",1),t(m,{class:"ml-2",icon:"mdi-check"})]),_:1})):(c(),h(N,{key:1,color:"error"},{default:e(()=>[s(a(l.$t("Inactive"))+" ",1),t(m,{class:"ml-2",icon:"mdi-close"})]),_:1}))])]),_:1})]),_:1})]),_:1})]),_:1}),t(r,{class:"d-flex justify-center"},{default:e(()=>[t(f,{class:"me-3",onClick:u[1]||(u[1]=y=>l.$inertia.visit(l.route("admin.schools.edit",{school:o.school.id})))},{default:e(()=>[s(a(l.$t("Edit")),1)]),_:1}),t(f,{color:o.school.is_active?"error":"primary",onClick:u[2]||(u[2]=y=>_.value=!0)},{default:e(()=>[s(a(o.school.is_active?l.$t("Deactivate"):l.$t("Activate"))+" ",1),t(m,null,{default:e(()=>[s(a(o.school.is_active?"mdi-arrow-down":"mdi-arrow-up"),1)]),_:1})]),_:1},8,["color"])]),_:1})]),_:1})]),_:1})]),_:1})]),_:1}),t(v,null,{default:e(()=>[$.value?(c(),h(b,{key:0},{default:e(()=>[t(r,null,{default:e(()=>[n("iframe",{src:S,frameborder:"0",width:"100%",height:"420"})]),_:1}),t(x,{"model-value":!$.value,class:"align-center justify-center text-center",contained:""},{default:e(()=>[t(M,{size:"64",color:"primary",indeterminate:""})]),_:1},8,["model-value"])]),_:1})):(c(),h(C,{key:1,justify:"center"},{default:e(()=>[t(v,{cols:"12",md:"6"},{default:e(()=>[t(b,null,{default:e(()=>[t(r,{class:"d-flex justify-center align-center"},{default:e(()=>[t(U,{class:"text-primary mb-4",variant:"tonal"},{default:e(()=>[t(m,null,{default:e(()=>[s("mdi-server")]),_:1})]),_:1})]),_:1}),t(r,{class:"text-center"},{default:e(()=>[t(v,{cols:"12"},{default:e(()=>[s(a(l.$t("Site is not reachable. Maybe it is down or site deployment is taking time. Please try again later.")),1)]),_:1}),t(v,{cols:"12"},{default:e(()=>[t(f,{onClick:w},{default:e(()=>[t(m,null,{default:e(()=>[s("mdi-refresh")]),_:1}),s(" "+a(l.$t("Refresh")),1)]),_:1})]),_:1})]),_:1})]),_:1})]),_:1})]),_:1}))]),_:1})]),_:1})]),_:1})]),_:1},8,["title","back"]),t(O,{modelValue:_.value,"onUpdate:modelValue":u[4]||(u[4]=y=>_.value=y),persistent:"","max-width":"30%"},{default:e(()=>[t(b,null,{default:e(()=>[t(A,null,{default:e(()=>[t(p,null,{default:e(()=>[s(a(l.$t("Are you sure to :status the school",{status:o.school.is_active?P(D)("deactivate"):P(D)("activate")})),1)]),_:1})]),_:1}),o.school.is_active?(c(),h(r,{key:0},{default:e(()=>[s(a(l.$t("Website will be deactivated")),1)]),_:1})):T("",!0),o.school.is_active?T("",!0):(c(),h(r,{key:1},{default:e(()=>[s(a(l.$t("After activation website will be live")),1)]),_:1})),t(q,null,{default:e(()=>[t(F),t(f,{color:"primary",text:"",onClick:u[3]||(u[3]=y=>_.value=!1)},{default:e(()=>[s(a(l.$t("Cancel")),1)]),_:1}),t(f,{color:"error",text:"",onClick:I},{default:e(()=>[s(a(o.school.is_active?l.$t("Deactivate"):l.$t("Activate")),1)]),_:1})]),_:1})]),_:1})]),_:1},8,["modelValue"])],64)}}};export{ve as default};
