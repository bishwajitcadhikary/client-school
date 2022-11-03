import{r as k,a as U,aa as q,d as e,w as t,au as z,M as O,b as X,o as h,V as c,i as r,aw as Q,av as R,a9 as o,g as s,ax as Y,P as D,Q as i,ay as v,f as l,c as w,S as P,m as y,n as p,bl as G,p as A,az as $,N as H,aA as L,e as g,j as J,l as F,k as f,h as K,t as B,aB as Z,aC as ee,u as E}from"./app.8dfb89f9.js";import{V as te}from"./VContainer.cd2d1563.js";import{V as T}from"./VRow.f3e7ba42.js";import{V as _}from"./VCol.4f44dc97.js";import{V as ae,a as x,b as se,c as I}from"./VWindowItem.558f849b.js";import{V as le,a as oe}from"./VAlert.a2afe515.js";import{V as ue}from"./VForm.fbff8dd5.js";/* empty css              */const ne={class:"text-h6 mt-4"},de={class:"text-h6"},re={class:"text-sm"},ie={class:"text-body-2"},me={class:"text-sm"},fe={class:"text-body-2"},ce={class:"text-sm"},ve={class:"text-body-2"},pe={class:"text-sm"},_e={class:"text-body-2"},he={class:"text-sm"},Ve={class:"text-body-2"},we={class:"text-sm"},ye={class:"text-body-2"},$e={class:"text-sm"},ge={class:"text-body-2"},be={class:"text-sm"},Ce={class:"text-body-2"},Se=o("div",{class:"flex-grow-1"},null,-1),ke=o("sup",{class:"text-primary text-sm font-weight-regular"},"$",-1),Pe=o("h3",{class:"text-h3 text-primary font-weight-semibold"}," 99 ",-1),Ae=o("sub",{class:"mt-3"},[o("h6",{class:"text-sm font-weight-regular"}," / month ")],-1),xe={class:"my-6"},Ie=o("div",{class:"d-flex font-weight-semibold mt-3 mb-2"},[o("h6",{class:"text-sm"}," Days "),o("div",{class:"flex-grow-1"}),o("h6",{class:"text-sm"}," 26 of 30 Days ")],-1),Le=o("p",{class:"text-xs mt-2","data-v-89ffa39a":""}," 4 days remaining ",-1),Me={__name:"Show",props:{customer:{type:Object,required:!0,default:null}},setup(u){const N=u,b=k("overview"),C=k(!1),S=k(!1),V=k(!1),m=U({_method:"PUT",password:null,password_confirmation:null}),j=()=>{m.post(route("admin.customers.change-password",{customer:N.customer.id}),{preserveState:!0,preserveScroll:!0,onSuccess:a=>{E().showNotification(a),m.reset()}})},M=()=>{U({_method:"PUT"}).post(route("admin.customers.toggle-suspend",{customer:N.customer.id}),{preserveState:!1,onSuccess:a=>E().showNotification(a),onFinish:a=>{V.value=!1}})};return(a,n)=>{const W=X("AppLayout");return h(),q(O,null,[e(W,{title:u.customer.name},{default:t(()=>[e(te,null,{default:t(()=>[e(T,null,{default:t(()=>[e(_,{cols:"12",lg:"4",md:"5"},{default:t(()=>[e(T,null,{default:t(()=>[e(_,{cols:"12"},{default:t(()=>[e(c,null,{default:t(()=>[e(r,{class:"text-center pt-15"},{default:t(()=>[e(Q,{rounded:"sm",size:"120",variant:"tonal"},{default:t(()=>[e(R,{src:"https://demos.themeselection.com/materio-vuetify-vuejs-admin-template/demo-3/assets/avatar-1.aac046b6.png"})]),_:1}),o("h6",ne,s(u.customer.name),1)]),_:1}),e(r,null,{default:t(()=>[o("h6",de,s(a.$t("Details")),1),e(Y),e(D,null,{default:t(()=>[e(i,null,{default:t(()=>[e(v,null,{default:t(()=>[o("h6",re,[l(s(a.$t("Username:"))+" ",1),o("span",ie,s(u.customer.username),1)])]),_:1})]),_:1}),e(i,null,{default:t(()=>[e(v,null,{default:t(()=>[o("h6",me,[l(s(a.$t("Email:"))+" ",1),o("span",fe,s(u.customer.email),1)])]),_:1})]),_:1}),e(i,null,{default:t(()=>[e(v,null,{default:t(()=>[o("h6",ce,[l(s(a.$t("Status:"))+" ",1),o("span",ve,[u.customer.status==1?(h(),w(P,{key:0,color:"primary",variant:"tonal"},{default:t(()=>[l(s(a.$t("Active")),1)]),_:1})):y("",!0),u.customer.status==0?(h(),w(P,{key:1,color:"secondary",variant:"tonal"},{default:t(()=>[l(s(a.$t("Inactive")),1)]),_:1})):y("",!0),u.customer.status==2?(h(),w(P,{key:2,class:"text-white",color:"red",variant:"tonal"},{default:t(()=>[l(s(a.$t("Inactive")),1)]),_:1})):y("",!0)])])]),_:1})]),_:1}),e(i,null,{default:t(()=>[e(v,null,{default:t(()=>[o("h6",pe,[l(s(a.$t("Contact:"))+" ",1),o("span",_e,s(u.customer.phone),1)])]),_:1})]),_:1}),e(i,null,{default:t(()=>[e(v,null,{default:t(()=>[o("h6",he,[l(s(a.$t("Language:"))+" ",1),o("span",Ve,s(u.customer.langauage),1)])]),_:1})]),_:1}),e(i,null,{default:t(()=>[e(v,null,{default:t(()=>[o("h6",we,[l(s(a.$t("Country:"))+" ",1),o("span",ye,s(u.customer.country),1)])]),_:1})]),_:1}),e(i,null,{default:t(()=>[e(v,null,{default:t(()=>[o("h6",$e,[l(s(a.$t("Website:"))+" ",1),o("span",ge,s(u.customer.website),1)])]),_:1})]),_:1}),e(i,null,{default:t(()=>[e(v,null,{default:t(()=>[o("h6",be,[l(s(a.$t("Last Login IP:"))+" ",1),o("span",Ce,s(u.customer.last_login_ip),1)])]),_:1})]),_:1})]),_:1})]),_:1}),e(r,{class:"d-flex justify-center"},{default:t(()=>[e(p,{class:"me-3",onClick:n[0]||(n[0]=d=>a.$inertia.visit(a.route("admin.customers.edit",{customer:u.customer.id})))},{default:t(()=>[l(s(a.$t("Edit")),1)]),_:1}),e(p,{color:u.customer.status!==2?"error":"success",onClick:n[1]||(n[1]=d=>V.value=!0)},{default:t(()=>[l(s(u.customer.status==2?a.$t("Activate"):a.$t("Suspend")),1)]),_:1},8,["color"])]),_:1})]),_:1})]),_:1}),e(_,{cols:"12"},{default:t(()=>[e(c,{variant:"elevated"},{default:t(()=>[e(r,{class:"d-flex"},{default:t(()=>[e(P,null,{default:t(()=>[l("Standard")]),_:1}),Se,ke,Pe,Ae]),_:1}),e(r),e(r,null,{default:t(()=>[o("div",xe,[Ie,e(G,{rounded:"","model-value":"50",color:"primary"}),Le]),e(p,{block:""},{default:t(()=>[l(s(a.$t("Upgrade Plan")),1)]),_:1})]),_:1})]),_:1})]),_:1})]),_:1})]),_:1}),e(_,{cols:"12",lg:"8",md:"7"},{default:t(()=>[e(c,{class:"mb-5"},{default:t(()=>[e(ae,{modelValue:b.value,"onUpdate:modelValue":n[2]||(n[2]=d=>b.value=d),"background-color":"deep-purple-darken-4","center-active":""},{default:t(()=>[e(x,{value:"overview"},{default:t(()=>[e(A,{class:"mr-2"},{default:t(()=>[l(" mdi-user ")]),_:1}),l(" "+s(a.$t("Overview")),1)]),_:1}),e(x,{value:"security"},{default:t(()=>[e(A,{class:"mr-2"},{default:t(()=>[l(" mdi-lock ")]),_:1}),l(" "+s(a.$t("Security")),1)]),_:1}),e(x,{value:"notifications"},{default:t(()=>[e(A,{class:"mr-2"},{default:t(()=>[l(" mdi-bell ")]),_:1}),l(" "+s(a.$t("Notifications")),1)]),_:1}),e(x,{value:"connections"},{default:t(()=>[e(A,{class:"mr-2"},{default:t(()=>[l(" mdi-link ")]),_:1}),l(" "+s(a.$t("Connections")),1)]),_:1})]),_:1},8,["modelValue"])]),_:1}),e(se,{modelValue:b.value,"onUpdate:modelValue":n[7]||(n[7]=d=>b.value=d)},{default:t(()=>[e(I,{value:"overview"},{default:t(()=>[e(c,null,{default:t(()=>[e($,null,{append:t(()=>[e(p,{"append-icon":"mdi-arrow-down",color:"primary"},{default:t(()=>[l(s(a.$t("Export"))+" ",1),e(H,{activator:"parent"},{default:t(()=>[e(D,null,{default:t(()=>[e(i,{key:"pdf",value:"pdf"},{default:t(()=>[e(L,null,{default:t(()=>[l("PDF")]),_:1})]),_:1}),e(i,{key:"xlsx",value:"xlsx"},{default:t(()=>[e(L,null,{default:t(()=>[l("XLSX")]),_:1})]),_:1}),e(i,{key:"csv",value:"csv"},{default:t(()=>[e(L,null,{default:t(()=>[l("CSV")]),_:1})]),_:1})]),_:1})]),_:1})]),_:1})]),default:t(()=>[e(g,null,{default:t(()=>[l(s(a.$t("Schools")),1)]),_:1})]),_:1})]),_:1})]),_:1}),e(I,{value:"security"},{default:t(()=>[e(c,null,{default:t(()=>[e($,null,{default:t(()=>[e(g,null,{default:t(()=>[l(s(a.$t("Change Password")),1)]),_:1})]),_:1}),e(r,null,{default:t(()=>[e(le,{class:"mb-6",color:"warning",icon:"mdi-warning"},{default:t(()=>[e(oe,null,{default:t(()=>[l(s(a.$t("Ensure that these requirements are met")),1)]),_:1}),o("span",null,s(a.$t("Minimum 8 characters long, uppercase & symbol")),1)]),_:1}),e(ue,{onSubmit:J(j,["prevent"])},{default:t(()=>[e(T,null,{default:t(()=>[e(_,{cols:"12",md:"6"},{default:t(()=>[e(F,{modelValue:f(m).password,"onUpdate:modelValue":n[3]||(n[3]=d=>f(m).password=d),"append-inner-icon":C.value?"mdi-eye":"mdi-eye-off","error-messages":f(m).errors.password,label:a.$t("Password"),type:C.value?"text":"password",hint:"At least 8 characters","onClick:appendInner":n[4]||(n[4]=d=>C.value=!C.value)},null,8,["modelValue","append-inner-icon","error-messages","label","type"])]),_:1}),e(_,{cols:"12",md:"6"},{default:t(()=>[e(F,{modelValue:f(m).password_confirmation,"onUpdate:modelValue":n[5]||(n[5]=d=>f(m).password_confirmation=d),"append-inner-icon":S.value?"mdi-eye":"mdi-eye-off","error-messages":f(m).errors.password_confirmation,label:a.$t("Confirm Password"),type:S.value?"text":"password","onClick:appendInner":n[6]||(n[6]=d=>S.value=!S.value)},null,8,["modelValue","append-inner-icon","error-messages","label","type"])]),_:1}),e(_,{cols:"12"},{default:t(()=>[e(p,{loading:f(m).processing,type:"submit"},{default:t(()=>[l(s(a.$t("Change Password")),1)]),_:1},8,["loading"])]),_:1})]),_:1})]),_:1},8,["onSubmit"])]),_:1})]),_:1})]),_:1}),e(I,{value:"notifications"},{default:t(()=>[e(c,null,{default:t(()=>[e($,null,{default:t(()=>[e(g,null,{default:t(()=>[l(s(a.$t("Notifications")),1)]),_:1}),e(K,null,{default:t(()=>[l(s(a.$t("You will receive notification for the below selected items.")),1)]),_:1})]),_:1}),e(r)]),_:1})]),_:1}),e(I,{value:"connections"},{default:t(()=>[e(c,null,{default:t(()=>[e($,null,{default:t(()=>[e(g,null,{default:t(()=>[l(s(a.$t("Connections")),1)]),_:1})]),_:1}),e(r)]),_:1})]),_:1})]),_:1},8,["modelValue"])]),_:1})]),_:1})]),_:1})]),_:1},8,["title"]),e(z,{modelValue:V.value,"onUpdate:modelValue":n[9]||(n[9]=d=>V.value=d),persistent:"","max-width":"30%"},{default:t(()=>[e(c,null,{default:t(()=>[e($,null,{default:t(()=>[e(g,null,{default:t(()=>[l(s(a.$t("Are you sure to :status the customer",{status:u.customer.status==2?f(B)("activate"):f(B)("suspend")})),1)]),_:1})]),_:1}),u.customer.status!==2?(h(),w(r,{key:0},{default:t(()=>[l(s(a.$t("Customer unable to access the account after the suspension")),1)]),_:1})):y("",!0),u.customer.status==2?(h(),w(r,{key:1},{default:t(()=>[l(s(a.$t("After activation user can access the account")),1)]),_:1})):y("",!0),e(Z,null,{default:t(()=>[e(ee),e(p,{color:"primary",text:"",onClick:n[8]||(n[8]=d=>V.value=!1)},{default:t(()=>[l(s(a.$t("Cancel")),1)]),_:1}),e(p,{color:"error",text:"",onClick:M},{default:t(()=>[l(s(u.customer.status==2?a.$t("Activate"):a.$t("Suspend")),1)]),_:1})]),_:1})]),_:1})]),_:1},8,["modelValue"])],64)}}};export{Me as default};