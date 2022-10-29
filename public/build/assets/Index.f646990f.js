import{r as L,c as n,w as e,b as y,o as r,d as t,f as c,g as a,m as V,V as b,i,au as l,aq as g,av as S,aw as j,Q as B,aP as N,n as $,M as P,aE as A,u as I}from"./app.75fe97d5.js";import{V as _}from"./VRow.1decdef7.js";import{V as m}from"./VCol.73001860.js";import{V as v}from"./VAlert.6eca066d.js";import{V as Y}from"./VSwitch.6870d19e.js";import{V as T}from"./VContainer.5696422c.js";/* empty css              */import"./VSelectionControl.7a610615.js";const E={class:"text-h4 pricing-title mb-4"},M={class:"text-h5 mb-2"},U={class:"d-flex justify-center align-center"},q={class:"text-sm font-weight-medium me-1"},D={class:"text-5xl font-weight-medium text-primary"},F={class:"text-sm font-weight-medium ms-1 mt-4"},O={class:"text-justify"},W={__name:"Index",props:{plans:{type:Object,default:null}},setup(C){const u=L(!1),k=s=>{A.Inertia.visit(route("customer.subscription.payment",s),{headers:{"X-Interval":u.value},onSuccess:d=>{I().showNotification(d)}})};return(s,d)=>{const x=y("VCardList"),w=y("AppLayout");return r(),n(w,{title:s.$t("Subscription")},{default:e(()=>[t(T,null,{default:e(()=>[t(_,{class:"mb-3"},{default:e(()=>{var o,p;return[(o=s.$page.props.auth.user)!=null&&o.plan_id?V("",!0):(r(),n(m,{key:0,cols:"12",md:"7"},{default:e(()=>[t(v,{icon:"mdi-information",color:"error"},{default:e(()=>[c(a(s.$t("You are not subscribed to any plan.")),1)]),_:1})]),_:1})),((p=s.$page.props.auth.user)==null?void 0:p.plan_id)&&s.$page.props.auth.plan_expired?(r(),n(m,{key:1,cols:"12",md:"7"},{default:e(()=>[t(v,{icon:"mdi-information",color:"error"},{default:e(()=>[c(a(s.$t("Your subscription has expire, please renew your subscription.")),1)]),_:1})]),_:1})):V("",!0)]}),_:1}),t(b,null,{default:e(()=>[t(i,{class:"pt-12 mb-16 pb-16"},{default:e(()=>[t(_,null,{default:e(()=>[t(m,{cols:"12",sm:"8",lg:"10",md:"12",class:"mx-auto"},{default:e(()=>[t(i,{class:"text-center"},{default:e(()=>[l("h4",E,a(s.$t("Pricing Plans")),1),l("p",null,a(s.$t("Choose the best plan to fit your needs.")),1)]),_:1}),t(i,{class:"d-flex gap-4 justify-center"},{default:e(()=>[t(g,{text:s.$t("Monthly")},null,8,["text"]),t(Y,{modelValue:u.value,"onUpdate:modelValue":d[0]||(d[0]=o=>u.value=o)},null,8,["modelValue"]),t(g,{text:s.$t("Yearly")},null,8,["text"])]),_:1}),t(_,{justify:"center"},{default:e(()=>[(r(!0),S(P,null,j(C.plans,(o,p)=>(r(),n(m,{key:p,cols:"12",md:"4"},{default:e(()=>[t(b,null,{default:e(()=>[t(i,{class:"v-card-text text-center"},{default:e(()=>[l("h5",M,a(o.name),1)]),_:2},1024),t(i,{class:"position-relative text-center"},{default:e(()=>{var f,h;return[l("div",U,[l("sup",q,a((h=(f=s.$page.props.app)==null?void 0:f.currency)==null?void 0:h.symbol),1),l("h1",D,a(u.value?o.yearly_price:o.monthly_price),1),l("sub",F,"/"+a(u.value?"year":"month"),1)])]}),_:2},1024),t(i,{class:"pt-2"},{default:e(()=>[l("p",O,a(o.description),1),t(x,null,{default:e(()=>[t(B,{"prepend-icon":"mdi-circle-outline",type:"text"},{default:e(()=>[c(a(s.$t(":school_count School Limit",{school_count:o.school_limit})),1)]),_:2},1024)]),_:2},1024)]),_:2},1024),t(N,null,{default:e(()=>[s.$page.props.auth.user.plan_id?(r(),n($,{key:0,color:"success",variant:"success",depressed:"",block:""},{default:e(()=>[c(a(s.$t("Your Current Plan")),1)]),_:1})):(r(),n($,{key:1,color:"primary",block:"",onClick:f=>k(o.id)},{default:e(()=>[c(a(s.$t("Upgrade")),1)]),_:2},1032,["onClick"]))]),_:2},1024)]),_:2},1024)]),_:2},1024))),128))]),_:1})]),_:1})]),_:1})]),_:1})]),_:1})]),_:1})]),_:1},8,["title"])}}};export{W as default};