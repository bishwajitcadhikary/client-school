import{_ as k}from"./DataNotFound.0f4dca2f.js";import{_ as V}from"./Pagination.f66c5c8b.js";import{a as g,c as i,w as a,b,o as r,d as e,f as n,g as l,k as u,m as C,V as v,i as c,U as y,aw as L,ax as N,W as S,bp as $,H as h,l as m,a1 as w,bM as A,u as B}from"./app.024f86d4.js";import{V as F}from"./VRow.a17a7fb6.js";import{V as j}from"./VCol.19781618.js";import{V as T}from"./VContainer.066e5020.js";/* empty css              */const U={__name:"Notifications",props:{notifications:{type:Object,default:null}},setup(s){const f=w("dateFormat"),d=g({}),p=()=>{d.get(A().props.value.app.role==="admin"?route("admin.notifications.mark-all-as-read"):route("customer.notifications.mark-all-as-read"),{preserveScroll:!0,preserveState:!0,onSuccess:o=>B().showNotification(o)})};return(o,x)=>{const _=b("AppLayout");return r(),i(_,{title:o.$t("Notifications")},{actions:a(()=>[e(C,{color:"primary",loading:u(d).processing,onClick:p},{default:a(()=>[n(l(o.$t("Mark all as read")),1)]),_:1},8,["loading"])]),default:a(()=>[e(T,null,{default:a(()=>[e(F,{justify:"center"},{default:a(()=>[e(j,{cols:"12",md:"8"},{default:a(()=>[e(v,null,{default:a(()=>[s.notifications.data.length?(r(),i(c,{key:0},{default:a(()=>[e(y,null,{default:a(()=>[(r(!0),L(h,null,N(s.notifications.data,t=>(r(),i(S,{key:t.id,value:t.id,class:"border border-b-0","prepend-icon":t.read_at?"mdi-bell-outline":"mdi-bell-ring",onClick:I=>t.data.link?o.$inertia.visit(o.route("notifications.visit",{notification:t.id})):""},{append:a(()=>[n(l(u(f)(t.created_at)),1)]),default:a(()=>[e($,null,{default:a(()=>[n(l(t.data.message),1)]),_:2},1024)]),_:2},1032,["value","prepend-icon","onClick"]))),128))]),_:1})]),_:1})):m("",!0),e(c,null,{default:a(()=>[s.notifications.data.length?m("",!0):(r(),i(k,{key:0})),e(V,{pagination:s.notifications},null,8,["pagination"])]),_:1})]),_:1})]),_:1})]),_:1})]),_:1})]),_:1},8,["title"])}}};export{U as default};
