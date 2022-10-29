import{r as f,a as C,c as P,w as o,o as v,d as e,V as $,j as k,i as w,l as c,k as t,au as n,g as p,av as S,aw as x,p as N,M as B,n as g,f as y,u as F}from"./app.75fe97d5.js";import{V}from"./VRow.1decdef7.js";import{V as I}from"./VForm.36860c1c.js";import{V as m}from"./VCol.73001860.js";/* empty css              */const R={class:"text-base font-weight-medium mt-2"},T={class:"d-flex flex-column gap-y-3"},U={class:"font-weight-medium"},D={__name:"AccountSettingsSecurity",props:{requiresConfirmation:Boolean},setup(q){const i=f(!1),d=f(!1),u=f(!1),b=["Minimum 8 characters long - the more, the better"],a=C({_method:"PUT",current_password:"",password:"",password_confirmation:""}),_=()=>{a.post(route("customer.profile.change-password"),{preserveScroll:!0,preserveState:!0,onSuccess:l=>{F().showNotification(l),a.reset()}})};return(l,s)=>(v(),P(V,null,{default:o(()=>[e(m,{cols:"12"},{default:o(()=>[e($,{title:l.$t("Change Password")},{default:o(()=>[e(I,{onSubmit:k(_,["prevent"])},{default:o(()=>[e(w,null,{default:o(()=>[e(V,{class:"mb-3"},{default:o(()=>[e(m,{cols:"12",md:"6"},{default:o(()=>[e(c,{modelValue:t(a).current_password,"onUpdate:modelValue":s[0]||(s[0]=r=>t(a).current_password=r),type:i.value?"text":"password","append-inner-icon":i.value?"mdi-eye-off-outline":"mdi-eye-outline",label:l.$t("Current Password"),"error-messages":t(a).errors.current_password,"onClick:appendInner":s[1]||(s[1]=r=>i.value=!i.value)},null,8,["modelValue","type","append-inner-icon","label","error-messages"])]),_:1})]),_:1}),e(V,null,{default:o(()=>[e(m,{cols:"12",md:"6"},{default:o(()=>[e(c,{modelValue:t(a).password,"onUpdate:modelValue":s[2]||(s[2]=r=>t(a).password=r),type:d.value?"text":"password","append-inner-icon":d.value?"mdi-eye-off-outline":"mdi-eye-outline",label:l.$t("New Password"),"error-messages":t(a).errors.password,"onClick:appendInner":s[3]||(s[3]=r=>d.value=!d.value)},null,8,["modelValue","type","append-inner-icon","label","error-messages"])]),_:1}),e(m,{cols:"12",md:"6"},{default:o(()=>[e(c,{modelValue:t(a).password_confirmation,"onUpdate:modelValue":s[4]||(s[4]=r=>t(a).password_confirmation=r),type:u.value?"text":"password","append-inner-icon":u.value?"mdi-eye-off-outline":"mdi-eye-outline",label:l.$t("Confirm New Password"),"error-messages":t(a).errors.password_confirmation,"onClick:appendInner":s[5]||(s[5]=r=>u.value=!u.value)},null,8,["modelValue","type","append-inner-icon","label","error-messages"])]),_:1})]),_:1})]),_:1}),e(w,null,{default:o(()=>[n("p",R,p(l.$t("Password Requirements:")),1),n("ul",T,[(v(),S(B,null,x(b,r=>n("li",{key:r,class:"d-flex"},[n("div",null,[e(N,{size:"7",icon:"mdi-circle",class:"me-3"})]),n("span",U,p(r),1)])),64))])]),_:1}),e(w,{class:"d-flex flex-wrap gap-4"},{default:o(()=>[e(g,{loading:t(a).processing,type:"submit"},{default:o(()=>[y(p(l.$t("Change Password")),1)]),_:1},8,["loading"]),e(g,{type:"reset",color:"secondary",variant:"tonal",onClick:s[6]||(s[6]=r=>t(a).reset())},{default:o(()=>[y(p(l.$t("Reset")),1)]),_:1})]),_:1})]),_:1},8,["onSubmit"])]),_:1},8,["title"])]),_:1})]),_:1}))}};export{D as default};
