import{u as $,a as b,c as v,w as t,b as S,o as k,d as r,V as U,e as F,f as p,g as c,h as T,i as j,j as G,k as e,m as L,n as N}from"./app.024f86d4.js";import{r as f}from"./rules.bd1e245b.js";import A from"./SettingsDrawerContent.adb5afcc.js";import{V as B}from"./VRow.a17a7fb6.js";import{V as I}from"./VCol.19781618.js";import{V as q}from"./VForm.2f49ab8c.js";import{V as i}from"./VTextField.4f31bb4a.js";import{V as P}from"./VFileInput.26e4d0e5.js";import{V as R}from"./VSelect.2b406d4f.js";import{V as D}from"./VTextarea.7bd68b00.js";import{V as H}from"./VSwitch.bae126a7.js";import{V as M}from"./VContainer.066e5020.js";import"./VCheckboxBtn.26820d3d.js";import"./VSelectionControl.e3763b2e.js";import"./VCounter.2419f175.js";import"./form.51b8e79f.js";/* empty css              */const oe={__name:"Create",props:{currencies:{type:Object,default:null}},setup(V){const d=V,g=$(),a=b({name:null,logo:null,currency:null,charge:0,is_active:!0,instructions:null}),n=b({code:null,rate:null,symbol:null});function y(){a.post(route("admin.settings.gateways.store"),{onSuccess:l=>{g.showNotification(l)}})}function C(l){l.length>0?a.logo=l[0]:a.logo=null}function w(l){var o,m,s;n.code=(o=d.currencies.find(u=>u.value==l))==null?void 0:o.code,n.rate=(m=d.currencies.find(u=>u.value==l))==null?void 0:m.rate,n.symbol=(s=d.currencies.find(u=>u.value==l))==null?void 0:s.symbol}return(l,o)=>{const m=S("AppLayout");return k(),v(m,{title:l.$t("Create Gateway"),back:l.route("admin.settings.gateways.index")},{"sub-navbar":t(()=>[r(A)]),default:t(()=>[r(M,null,{default:t(()=>[r(B,null,{default:t(()=>[r(I,{cols:"12",sm:"8"},{default:t(()=>[r(U,null,{default:t(()=>[r(F,null,{default:t(()=>[p(c(l.$t("Create Gateway")),1)]),_:1}),r(T,null,{default:t(()=>[p(c(l.$t("Here you can create new payment gateway")),1)]),_:1}),r(j,null,{default:t(()=>[r(q,{onSubmit:G(y,["prevent"])},{default:t(()=>[r(i,{modelValue:e(a).name,"onUpdate:modelValue":o[0]||(o[0]=s=>e(a).name=s),class:"mb-5",label:l.$t("Gateway Name"),rules:[e(f).required]},null,8,["modelValue","label","rules"]),r(P,{class:"mb-5",accept:"image/png, image/jpeg, image/jpg",label:l.$t("Logo"),placeholder:l.$t("Pick gateway logo"),"error-messages":e(a).errors.logo,"onUpdate:modelValue":C},null,8,["label","placeholder","error-messages"]),r(R,{modelValue:e(a).currency,"onUpdate:modelValue":[o[1]||(o[1]=s=>e(a).currency=s),w],class:"mb-5",label:l.$t("Currency"),items:V.currencies,rules:[e(f).required],"error-messages":e(a).errors.currency},null,8,["modelValue","label","items","rules","error-messages"]),r(i,{modelValue:e(n).code,"onUpdate:modelValue":o[2]||(o[2]=s=>e(n).code=s),class:"mb-5",label:l.$t("Currency Code"),disabled:""},null,8,["modelValue","label"]),r(i,{modelValue:e(n).rate,"onUpdate:modelValue":o[3]||(o[3]=s=>e(n).rate=s),class:"mb-5",prefix:e(n).symbol,label:l.$t("Currency Rate"),disabled:""},null,8,["modelValue","prefix","label"]),r(i,{modelValue:e(a).charge,"onUpdate:modelValue":o[4]||(o[4]=s=>e(a).charge=s),type:"number",class:"mb-5",prefix:e(n).symbol,label:l.$t("Gateway Charge"),"error-messages":e(a).errors.charge},null,8,["modelValue","prefix","label","error-messages"]),r(D,{modelValue:e(a).instructions,"onUpdate:modelValue":o[5]||(o[5]=s=>e(a).instructions=s),class:"mb-5",label:l.$t("Payment Instructions"),"error-messages":e(a).errors.instructions},null,8,["modelValue","label","error-messages"]),r(H,{modelValue:e(a).is_active,"onUpdate:modelValue":o[6]||(o[6]=s=>e(a).is_active=s),class:"mb-5",label:l.$t("Active"),"error-messages":e(a).errors.is_active},null,8,["modelValue","label","error-messages"]),r(L,{type:"submit",loading:e(a).processing},{default:t(()=>[r(N,{icon:"mdi-content-save"}),p(" "+c(l.$t("Save")),1)]),_:1},8,["loading"])]),_:1},8,["onSubmit"])]),_:1})]),_:1})]),_:1})]),_:1})]),_:1})]),_:1},8,["title","back"])}}};export{oe as default};
