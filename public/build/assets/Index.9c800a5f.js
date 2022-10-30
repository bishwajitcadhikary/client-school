import{r as L,c as n,w as e,b,o as l,d as s,f as i,g as o,m as $,V as g,i as u,a9 as r,a4 as k,aa as S,ab as j,Q as B,aC as N,n as h,M as A,aq as I,u as P}from"./app.bbada7ee.js";import{V as y}from"./VRow.3d8628ae.js";import{V as f}from"./VCol.0ac1e7d0.js";import{V as C}from"./VAlert.73a15395.js";import{V as Y}from"./VSwitch.9069d65c.js";import{V as T}from"./VContainer.0de8f543.js";/* empty css              */import"./VSelectionControl.082103a1.js";const M={class:"text-h4 pricing-title mb-4"},R={class:"text-h5 mb-2"},U={class:"d-flex justify-center align-center"},q={class:"text-sm font-weight-medium me-1"},D={class:"text-5xl font-weight-medium text-primary"},E={class:"text-sm font-weight-medium ms-1 mt-4"},F={class:"text-justify"},W={__name:"Index",props:{plans:{type:Object,default:null}},setup(v){const d=L(!1),_=t=>{I.Inertia.visit(route("customer.subscription.payment",t),{headers:{"X-Interval":d.value},onSuccess:p=>{P().showNotification(p)}})};return(t,p)=>{const x=b("VCardList"),w=b("AppLayout");return l(),n(w,{title:t.$t("Subscription")},{default:e(()=>[s(T,null,{default:e(()=>[s(y,{class:"mb-3"},{default:e(()=>{var a,m;return[(a=t.$page.props.auth.user)!=null&&a.plan_id?$("",!0):(l(),n(f,{key:0,cols:"12",md:"7"},{default:e(()=>[s(C,{icon:"mdi-information",color:"error"},{default:e(()=>[i(o(t.$t("You are not subscribed to any plan.")),1)]),_:1})]),_:1})),((m=t.$page.props.auth.user)==null?void 0:m.plan_id)&&t.$page.props.auth.plan_expired?(l(),n(f,{key:1,cols:"12",md:"7"},{default:e(()=>[s(C,{icon:"mdi-information",color:"error"},{default:e(()=>[i(o(t.$t("Your subscription has expire, please renew your subscription.")),1)]),_:1})]),_:1})):$("",!0)]}),_:1}),s(g,null,{default:e(()=>[s(u,{class:"pt-12 mb-16 pb-16"},{default:e(()=>[s(y,null,{default:e(()=>[s(f,{cols:"12",sm:"8",lg:"10",md:"12",class:"mx-auto"},{default:e(()=>[s(u,{class:"text-center"},{default:e(()=>[r("h4",M,o(t.$t("Pricing Plans")),1),r("p",null,o(t.$t("Choose the best plan to fit your needs.")),1)]),_:1}),s(u,{class:"d-flex gap-4 justify-center"},{default:e(()=>[s(k,{text:t.$t("Monthly")},null,8,["text"]),s(Y,{modelValue:d.value,"onUpdate:modelValue":p[0]||(p[0]=a=>d.value=a)},null,8,["modelValue"]),s(k,{text:t.$t("Yearly")},null,8,["text"])]),_:1}),s(y,{justify:"center"},{default:e(()=>[(l(!0),S(A,null,j(v.plans,(a,m)=>(l(),n(f,{key:m,cols:"12",md:"4"},{default:e(()=>[s(g,null,{default:e(()=>[s(u,{class:"v-card-text text-center"},{default:e(()=>[r("h5",R,o(a.name),1)]),_:2},1024),s(u,{class:"position-relative text-center"},{default:e(()=>{var c,V;return[r("div",U,[r("sup",q,o((V=(c=t.$page.props.app)==null?void 0:c.currency)==null?void 0:V.symbol),1),r("h1",D,o(d.value?a.yearly_price:a.monthly_price),1),r("sub",E,"/"+o(d.value?"year":"month"),1)])]}),_:2},1024),s(u,{class:"pt-2"},{default:e(()=>[r("p",F,o(a.description),1),s(x,null,{default:e(()=>[s(B,{"prepend-icon":"mdi-circle-outline",type:"text"},{default:e(()=>[i(o(t.$t(":school_count School Limit",{school_count:a.school_limit})),1)]),_:2},1024)]),_:2},1024)]),_:2},1024),s(N,null,{default:e(()=>[t.$page.props.auth.user.plan_id===a.id&&!t.$page.props.auth.plan_expired?(l(),n(h,{key:0,color:"success",variant:"success",depressed:"",block:"",onClick:c=>_(a.id)},{default:e(()=>[i(o(t.$t("Your Current Plan")),1)]),_:2},1032,["onClick"])):t.$page.props.auth.user.plan_id===a.id&&t.$page.props.auth.plan_expired?(l(),n(h,{key:1,color:"success",variant:"success",depressed:"",block:"",onClick:c=>_(a.id)},{default:e(()=>[i(o(t.$t("Renew")),1)]),_:2},1032,["onClick"])):(l(),n(h,{key:2,color:"primary",block:"",onClick:c=>_(a.id)},{default:e(()=>[i(o(t.$t("Upgrade")),1)]),_:2},1032,["onClick"]))]),_:2},1024)]),_:2},1024)]),_:2},1024))),128))]),_:1})]),_:1})]),_:1})]),_:1})]),_:1})]),_:1})]),_:1},8,["title"])}}};export{W as default};