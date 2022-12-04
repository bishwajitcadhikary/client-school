import{_ as w}from"./Pagination.ddb96f02.js";import{c as s,w as i,b as P,o,d as n,V as N,av as e,g as a,aw as k,ax as D,k as c,Y as m,f as p,l as r,m as h,D as $,ay as T,H as b,i as A,a1 as C}from"./app.c74c21f4.js";import{_ as B}from"./DataNotFound.fa8e0d1d.js";import{V as F}from"./VTable.bbaee15f.js";import{V as y}from"./VTooltip.6345da64.js";import{V as L}from"./VContainer.9871394f.js";import"./VCol.fb68aa0d.js";/* empty css              */import"./VRow.51c37cbe.js";const S=e("th",null,"#",-1),z={class:"text-center"},Y={class:"text-center"},j={class:"text-center",width:"15%"},E={width:"5%"},I={class:"text-center"},H={class:"text-center"},M={class:"text-center"},Z={__name:"Index",props:{plans:{type:Object,default:null}},setup(u){const f=C("currencyFormat"),V=C("dateFormat");return(t,O)=>{const g=P("AppLayout");return o(),s(g,{title:t.$t("Plans"),actions:[{title:t.$t("New Plan"),href:t.route("admin.plans.create"),icon:"mdi-plus"}]},{default:i(()=>[n(L,null,{default:i(()=>[n(N,null,{default:i(()=>[u.plans.data.length?(o(),s(F,{key:0},{default:i(()=>[e("thead",null,[e("tr",null,[S,e("th",null,a(t.$t("Name")),1),e("th",null,a(t.$t("Monthly Price")),1),e("th",null,a(t.$t("Yearly Price")),1),e("th",null,a(t.$t("School Limit")),1),e("th",null,a(t.$t("Customer Limit")),1),e("th",null,a(t.$t("Total Customer")),1),e("th",z,a(t.$t("Status")),1),e("th",Y,a(t.$t("Trial")),1),e("th",null,a(t.$t("Created At")),1),e("th",j,a(t.$t("Actions")),1)])]),e("tbody",null,[(o(!0),k(b,null,D(u.plans.data,(l,_)=>(o(),k("tr",{key:_},[e("td",E,a(_+1),1),e("td",null,a(l.name),1),e("td",null,a(c(f)(l.monthly_price,t.$page.props.app.currency.code)),1),e("td",null,a(c(f)(l.yearly_price,t.$page.props.app.currency.code)),1),e("td",null,a(l.school_limit),1),e("td",null,a(l.max_limit),1),e("td",null,a(l.max_limit),1),e("td",I,[l.is_active?(o(),s(m,{key:0,class:"ma-2",color:"primary"},{default:i(()=>[p(a(t.$t("Active")),1)]),_:1})):r("",!0),l.is_active?r("",!0):(o(),s(m,{key:1,class:"ma-2",color:"secondary"},{default:i(()=>[p(a(t.$t("Inactive")),1)]),_:1}))]),e("td",H,[l.is_trial?(o(),s(m,{key:0,class:"ma-2",color:"primary"},{default:i(()=>[p(a(t.$t("Yes")),1)]),_:1})):r("",!0),l.is_trial?r("",!0):(o(),s(m,{key:1,class:"ma-2",color:"secondary"},{default:i(()=>[p(a(t.$t("No")),1)]),_:1}))]),e("td",null,a(c(V)(l.created_at)),1),e("td",M,[n(y,{text:t.$t("View Plan")},{activator:i(({props:d})=>[n(h,$({variant:"plain",size:"small",icon:"mdi-eye-outline"},d,{onClick:v=>t.$inertia.visit(t.route("admin.plans.show",{plan:l.id}))}),null,16,["onClick"])]),_:2},1032,["text"]),n(y,{text:t.$t("Edit Plan")},{activator:i(({props:d})=>[n(h,$({variant:"plain",size:"small",icon:"mdi-clipboard-edit-outline"},d,{onClick:v=>t.$inertia.visit(t.route("admin.plans.edit",{plan:l.id}))}),null,16,["onClick"])]),_:2},1032,["text"]),n(y,{text:t.$t("Delete Plan")},{activator:i(({props:d})=>[n(h,$({variant:"plain",size:"small",icon:"mdi-delete-outline"},d,{onClick:v=>c(T)().showDialog(t.route("admin.plans.destroy",{plan:l.id}))}),null,16,["onClick"])]),_:2},1032,["text"])])]))),128))])]),_:1})):r("",!0),n(A,null,{default:i(()=>[u.plans.data.length?r("",!0):(o(),s(B,{key:0})),n(w,{pagination:u.plans},null,8,["pagination"])]),_:1})]),_:1})]),_:1})]),_:1},8,["title","actions"])}}};export{Z as default};
