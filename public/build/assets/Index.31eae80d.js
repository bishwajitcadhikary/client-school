import{_ as g}from"./Pagination.f66c5c8b.js";import{c as i,w as s,b as w,o,d as n,V as A,av as e,g as a,aw as k,ax as D,Y as m,f as c,l as u,k as p,m as h,D as f,ay as N,H as b,i as B,a1 as v}from"./app.024f86d4.js";import{_ as E}from"./DataNotFound.0f4dca2f.js";import{V as F}from"./VTable.ccb6ff10.js";import{V as $}from"./VTooltip.2a21bcfe.js";import{V as S}from"./VContainer.066e5020.js";import"./VCol.19781618.js";/* empty css              */import"./VRow.a17a7fb6.js";const T=e("th",null,"#",-1),z={class:"text-center"},L={class:"text-center",width:"15%"},j={width:"5%"},I={class:"text-center"},P={class:"text-center"},Q={__name:"Index",props:{customers:{type:Object,default:null}},setup(d){v("currencyFormat");const C=v("dateFormat");return(t,H)=>{const _=w("AppLayout");return o(),i(_,{title:t.$t("Customers"),actions:[{title:t.$t("New Customer"),href:t.route("admin.customers.create"),icon:"mdi-plus"}]},{default:s(()=>[n(S,null,{default:s(()=>[n(A,null,{default:s(()=>[d.customers.data.length?(o(),i(F,{key:0},{default:s(()=>[e("thead",null,[e("tr",null,[T,e("th",null,a(t.$t("Name")),1),e("th",null,a(t.$t("Username")),1),e("th",null,a(t.$t("Email")),1),e("th",z,a(t.$t("Status")),1),e("th",null,a(t.$t("Registered At")),1),e("th",null,a(t.$t("Plan Expire At")),1),e("th",L,a(t.$t("Actions")),1)])]),e("tbody",null,[(o(!0),k(b,null,D(d.customers.data,(l,y)=>(o(),k("tr",{key:y},[e("td",j,a(y+1),1),e("td",null,a(l.name),1),e("td",null,a(l.username),1),e("td",null,a(l.email),1),e("td",I,[l.status==1?(o(),i(m,{key:0,class:"ma-2",color:"primary"},{default:s(()=>[c(a(t.$t("Active")),1)]),_:1})):u("",!0),l.status==0?(o(),i(m,{key:1,class:"ma-2",color:"secondary"},{default:s(()=>[c(a(t.$t("Inactive")),1)]),_:1})):u("",!0),l.status==2?(o(),i(m,{key:2,class:"ma-2",color:"red","text-color":"white"},{default:s(()=>[c(a(t.$t("Suspended")),1)]),_:1})):u("",!0)]),e("td",null,a(p(C)(l.created_at)),1),e("td",null,a(p(C)(l.plan_expire_at)),1),e("td",P,[n($,{text:t.$t("View Customer")},{activator:s(({props:r})=>[n(h,f({variant:"plain",size:"small",icon:"mdi-eye-outline"},r,{onClick:V=>t.$inertia.visit(t.route("admin.customers.show",{customer:l.id}))}),null,16,["onClick"])]),_:2},1032,["text"]),n($,{text:t.$t("Edit Customer")},{activator:s(({props:r})=>[n(h,f({variant:"plain",size:"small",icon:"mdi-clipboard-edit-outline"},r,{onClick:V=>t.$inertia.visit(t.route("admin.customers.edit",{customer:l.id}))}),null,16,["onClick"])]),_:2},1032,["text"]),n($,{text:t.$t("Delete Customer")},{activator:s(({props:r})=>[n(h,f({variant:"plain",size:"small",icon:"mdi-delete-outline"},r,{onClick:V=>p(N)().showDialog(t.route("admin.customers.destroy",{customer:l.id}))}),null,16,["onClick"])]),_:2},1032,["text"])])]))),128))])]),_:1})):u("",!0),n(B,null,{default:s(()=>[d.customers.data.length?u("",!0):(o(),i(E,{key:0})),n(g,{pagination:d.customers},null,8,["pagination"])]),_:1})]),_:1})]),_:1})]),_:1},8,["title","actions"])}}};export{Q as default};
