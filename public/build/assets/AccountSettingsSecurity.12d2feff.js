import{r as f,a as C,c as P,w as o,o as v,d as e,V as $,j as k,i as w,k as t,av as n,g as p,aw as S,ax as x,n as N,H as B,m as g,f as y,u as F}from"./app.c74c21f4.js";import{V as c}from"./VRow.51c37cbe.js";import{V as I}from"./VForm.64f4569b.js";import{V as m}from"./VCol.fb68aa0d.js";import{V}from"./VTextField.2cf6dc35.js";/* empty css              */import"./form.655e4f4e.js";import"./VCounter.bd549793.js";import"./VLabel.2a4a1171.js";const R={class:"text-base font-weight-medium mt-2"},T={class:"d-flex flex-column gap-y-3"},U={class:"font-weight-medium"},G={__name:"AccountSettingsSecurity",props:{requiresConfirmation:Boolean},setup(q){const i=f(!1),d=f(!1),u=f(!1),b=["Minimum 8 characters long - the more, the better"],r=C({_method:"PUT",current_password:"",password:"",password_confirmation:""}),_=()=>{r.post(route("customer.profile.change-password"),{preserveScroll:!0,preserveState:!0,onSuccess:l=>{F().showNotification(l),r.reset()}})};return(l,s)=>(v(),P(c,null,{default:o(()=>[e(m,{cols:"12"},{default:o(()=>[e($,{title:l.$t("Change Password")},{default:o(()=>[e(I,{onSubmit:k(_,["prevent"])},{default:o(()=>[e(w,null,{default:o(()=>[e(c,{class:"mb-3"},{default:o(()=>[e(m,{cols:"12",md:"6"},{default:o(()=>[e(V,{modelValue:t(r).current_password,"onUpdate:modelValue":s[0]||(s[0]=a=>t(r).current_password=a),type:i.value?"text":"password","append-inner-icon":i.value?"mdi-eye-off-outline":"mdi-eye-outline",label:l.$t("Current Password"),"error-messages":t(r).errors.current_password,"onClick:appendInner":s[1]||(s[1]=a=>i.value=!i.value)},null,8,["modelValue","type","append-inner-icon","label","error-messages"])]),_:1})]),_:1}),e(c,null,{default:o(()=>[e(m,{cols:"12",md:"6"},{default:o(()=>[e(V,{modelValue:t(r).password,"onUpdate:modelValue":s[2]||(s[2]=a=>t(r).password=a),type:d.value?"text":"password","append-inner-icon":d.value?"mdi-eye-off-outline":"mdi-eye-outline",label:l.$t("New Password"),"error-messages":t(r).errors.password,"onClick:appendInner":s[3]||(s[3]=a=>d.value=!d.value)},null,8,["modelValue","type","append-inner-icon","label","error-messages"])]),_:1}),e(m,{cols:"12",md:"6"},{default:o(()=>[e(V,{modelValue:t(r).password_confirmation,"onUpdate:modelValue":s[4]||(s[4]=a=>t(r).password_confirmation=a),type:u.value?"text":"password","append-inner-icon":u.value?"mdi-eye-off-outline":"mdi-eye-outline",label:l.$t("Confirm New Password"),"error-messages":t(r).errors.password_confirmation,"onClick:appendInner":s[5]||(s[5]=a=>u.value=!u.value)},null,8,["modelValue","type","append-inner-icon","label","error-messages"])]),_:1})]),_:1})]),_:1}),e(w,null,{default:o(()=>[n("p",R,p(l.$t("Password Requirements:")),1),n("ul",T,[(v(),S(B,null,x(b,a=>n("li",{key:a,class:"d-flex"},[n("div",null,[e(N,{size:"7",icon:"mdi-circle",class:"me-3"})]),n("span",U,p(a),1)])),64))])]),_:1}),e(w,{class:"d-flex flex-wrap gap-4"},{default:o(()=>[e(g,{loading:t(r).processing,type:"submit"},{default:o(()=>[y(p(l.$t("Change Password")),1)]),_:1},8,["loading"]),e(g,{type:"reset",color:"secondary",variant:"tonal",onClick:s[6]||(s[6]=a=>t(r).reset())},{default:o(()=>[y(p(l.$t("Reset")),1)]),_:1})]),_:1})]),_:1},8,["onSubmit"])]),_:1},8,["title"])]),_:1})]),_:1}))}};export{G as default};
