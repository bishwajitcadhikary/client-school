import{a as f,w as i,ay as n,o as p,b as r,u as o,az as t,b9 as V}from"./app.21a975b2.js";import{r as b}from"./rules.52e7414f.js";import{u as _}from"./useMailDriverStore.d375bd6f.js";import{V as v}from"./VForm.d67dcacf.js";import{V as s}from"./VCol.69e39502.js";import{V as c}from"./VSelect.68a7ad8d.js";import{V as S}from"./VRow.95dd16bf.js";import"./VCheckboxBtn.ad4c2d67.js";import"./VSelectionControl.31b751d2.js";import"./VChip.8209ba3d.js";const N={__name:"Basic",setup(F){const e=_();function u(){e.form.put(route("admin.settings.mail.update"),{onSuccess:l=>{console.log(l)}})}function d(l){e.form.mail_driver=l}return(l,a)=>(p(),f(v,{onSubmit:n(u,["prevent"])},{default:i(()=>[r(S,null,{default:i(()=>[r(s,{cols:"12",sm:"6"},{default:i(()=>[r(c,{modelValue:o(e).form.mail_driver,"onUpdate:modelValue":[a[0]||(a[0]=m=>o(e).form.mail_driver=m),d],label:l.$t("Mail Driver"),items:o(e).mail_drivers,rules:[o(b).required]},null,8,["modelValue","label","items","rules"])]),_:1}),r(s,{cols:"12",sm:"6"},{default:i(()=>[r(t,{modelValue:o(e).form.basic.mail_from_address,"onUpdate:modelValue":a[1]||(a[1]=m=>o(e).form.basic.mail_from_address=m),label:l.$t("Mail From Address"),type:"email"},null,8,["modelValue","label"])]),_:1}),r(s,{cols:"12",sm:"6"},{default:i(()=>[r(t,{modelValue:o(e).form.basic.mail_from_name,"onUpdate:modelValue":a[2]||(a[2]=m=>o(e).form.basic.mail_from_name=m),label:l.$t("Mail From Name")},null,8,["modelValue","label"])]),_:1})]),_:1}),V(l.$slots,"default")]),_:3},8,["onSubmit"]))}};export{N as default};
